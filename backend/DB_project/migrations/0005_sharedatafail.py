# Generated by Django 3.2.6 on 2022-01-26 16:22

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
        ('DB_project', '0004_sharedata_ori_dep'),
    ]

    operations = [
        migrations.CreateModel(
            name='ShareDataFail',
            fields=[
                ('data_id', models.AutoField(primary_key=True, serialize=False)),
                ('year', models.TextField()),
                ('gpa_first_semester', models.TextField()),
                ('gpa_second_semester', models.TextField()),
                ('option', models.TextField()),
                ('prioity', models.TextField()),
                ('ori_dep', models.TextField(default='None')),
                ('dep', models.ForeignKey(db_column='dep_id', on_delete=django.db.models.deletion.CASCADE, related_name='sharedataFail_dep_id', to='DB_project.depid')),
                ('user', models.ForeignKey(db_column='user_id', on_delete=django.db.models.deletion.CASCADE, related_name='sharedataFail_user', to=settings.AUTH_USER_MODEL)),
            ],
            options={
                'db_table': 'DB_project"."ShareDataFail',
            },
        ),
    ]
