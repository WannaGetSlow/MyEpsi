# backend/apps/api/views.py
from rest_framework.response import Response
from rest_framework.decorators import api_view
from rest_framework.permissions import IsAuthenticated
from rest_framework.decorators import api_view, permission_classes

@api_view(['GET'])
@permission_classes([IsAuthenticated])
def protected_view(request):
    return Response({"message": "Accès autorisé uniquement aux utilisateurs authentifiés."})

def home(request):
    return Response({"message": "Bienvenue sur mon API !"})
