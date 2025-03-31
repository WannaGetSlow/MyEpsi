from django.core.mail import send_mail
from django.conf import settings
from django.utils import timezone
import secrets
from .models import PasswordResetToken

def send_password_reset_email(user):
    # Generate reset token
    token = secrets.token_urlsafe(32)
    
    # Save token to database
    PasswordResetToken.objects.filter(user=user).delete()  # Remove existing tokens
    PasswordResetToken.objects.create(user=user, token=token)
    
    # Create reset link
    reset_link = f"http://localhost:3000/reset-password?token={token}"
    
    # Email content
    subject = 'Password Reset Request'
    message = f'''
    Hello,
    
    You have requested to reset your password. Please click the link below to reset your password:
    
    {reset_link}
    
    This link will expire in 24 hours.
    
    If you did not request this, please ignore this email.
    
    Best regards,
    Your App Team
    '''
    
    # Send email
    send_mail(
        subject,
        message,
        settings.EMAIL_HOST_USER,
        [user.email],
        fail_silently=False,
    )
    
    return token

def verify_reset_token(token):
    try:
        token_obj = PasswordResetToken.objects.get(token=token)
        if token_obj.is_valid():
            user = token_obj.user
            token_obj.delete()  # Token can only be used once
            return user
        token_obj.delete()  # Remove expired token
        return None
    except PasswordResetToken.DoesNotExist:
        return None