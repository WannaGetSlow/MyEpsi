from rest_framework import status
from rest_framework.decorators import api_view, permission_classes
from rest_framework.response import Response
from rest_framework.permissions import AllowAny
from django.contrib.auth.models import User
from .serializers import PasswordResetSerializer, PasswordResetConfirmSerializer
from .utils import send_password_reset_email, verify_reset_token

@api_view(['POST'])
@permission_classes([AllowAny])
def password_reset_view(request):
    serializer = PasswordResetSerializer(data=request.data)
    if serializer.is_valid():
        email = serializer.validated_data['email']
        try:
            user = User.objects.get(email=email)
            token = send_password_reset_email(user)
            # Store token in database or cache for verification
            return Response({
                'success': True,
                'message': 'Password reset email sent successfully'
            })
        except User.DoesNotExist:
            return Response({
                'success': False,
                'message': 'No user found with this email address'
            }, status=status.HTTP_404_NOT_FOUND)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)


@api_view(['POST'])
@permission_classes([AllowAny])
def password_reset_confirm(request):
    serializer = PasswordResetConfirmSerializer(data=request.data)
    if serializer.is_valid():
        token = serializer.validated_data['token']
        new_password = serializer.validated_data['new_password']
        
        user = verify_reset_token(token)
        if user:
            user.set_password(new_password)
            user.save()
            return Response({
                'success': True,
                'message': 'Password has been reset successfully'
            })
        return Response({
            'success': False,
            'message': 'Invalid or expired token'
        }, status=status.HTTP_400_BAD_REQUEST)
    return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
