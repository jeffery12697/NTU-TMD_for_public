from rest_framework import serializers
from DB_project.models import *

class RequirementListSerializer(serializers.ModelSerializer):
    class Meta:
        model = TransferRequirement
        fields = '__all__'

class DepidMapSerializer(serializers.ModelSerializer):
    class Meta:
        model = DepID
        fields = '__all__'
