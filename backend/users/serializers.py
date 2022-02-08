from rest_framework import serializers
from django.contrib.auth.models import User

class UserListSerializer(serializers.ModelSerializer):
    class Meta:
        model = User
        fields = '__all__'

