from django.urls import path
from . import views

urlpatterns = [
    path('auth/password-reset/', views.password_reset_view, name='password_reset'),
    path('auth/password-reset/confirm/', views.password_reset_confirm, name='password_reset_confirm'),
]