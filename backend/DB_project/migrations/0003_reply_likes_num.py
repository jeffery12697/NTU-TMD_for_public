# Generated by Django 3.2.6 on 2022-01-20 12:54

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('DB_project', '0002_user_likes_reply'),
    ]

    operations = [
        migrations.AddField(
            model_name='reply',
            name='likes_num',
            field=models.IntegerField(default=0),
        ),
    ]
