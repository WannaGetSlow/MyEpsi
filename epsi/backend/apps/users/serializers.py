# backend/apps/users/serializers.py
from rest_framework import serializers
from django.contrib.auth.models import User  # Import du modèle User

class UserSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = ['id', 'username', 'email', 'first_name', 'last_name']
