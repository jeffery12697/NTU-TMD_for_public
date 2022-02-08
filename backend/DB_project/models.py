from django.db import models
from django.contrib.auth.models import User

# Create your models here.
class DepID(models.Model):
    # dep_id = models.CharField(primary_key=True, max_length=20)
    dep_id = models.TextField(primary_key=True)
    dep_name = models.CharField(max_length=50)
    class Meta:
        db_table = 'DB_project"."DepID'
    def __str__(self):
        return self.dep_name

class TransferRequirement(models.Model):
    dep = models.OneToOneField('DepID', on_delete=models.CASCADE, 
        primary_key=True, related_name='transfer_dep_id', db_column='dep_id')
    
    accept_number = models.PositiveSmallIntegerField()
    qualification = models.TextField(blank=True, null=True)
    admission_requirement = models.TextField(blank=True, null=True)
    other = models.TextField(blank=True, null=True)
    accept_second_priority = models.TextField(blank=True, null=True)
    notes = models.TextField(blank=True, null=True)

    class Meta:
        db_table = 'DB_project"."TransferRequirement'
    def __str__(self):
        # return str(self.dep_id)
        return str(self.dep_id)

class DoubleMajorRequirement(models.Model):
    dep = models.OneToOneField('DepID', on_delete=models.CASCADE, 
        primary_key=True, related_name='doublemajor_dep_id', db_column='dep_id')
    accept_number = models.CharField(max_length=10, null=True)
    qualification = models.TextField(blank=True, null=True)
    admission_requirement = models.TextField(blank=True, null=True)
    other = models.TextField(blank=True, null=True)
    notes = models.TextField(blank=True, null=True)

    class Meta:
        db_table = 'DB_project"."DoubleMajorRequirement'
    def __str__(self):
        return self.dep_id

class MinorRequirement(models.Model):
    dep = models.OneToOneField('DepID', on_delete=models.CASCADE, 
        primary_key=True, related_name='minor_dep_id', db_column='dep_id')
    # accept_number = models.PositiveSmallIntegerField()
    accept_number = models.CharField(max_length=10, null=True)
    qualification = models.TextField(blank=True, null=True)
    admission_requirement = models.TextField(blank=True, null=True)
    other = models.TextField(blank=True, null=True)
    compulsory = models.TextField(blank=True, null=True)
    elective = models.TextField(blank=True, null=True)
    min_received_credit = models.TextField(blank=True, null=True)
    notes = models.TextField(blank=True, null=True)

    class Meta:
        db_table = 'DB_project"."MinorRequirement'
    def __str__(self):
        return self.dep

class Compulsory(models.Model):
    default_id = models.AutoField(primary_key=True)
    course = models.ForeignKey("AllCompulsory", to_field="course_id", on_delete=models.CASCADE,
        related_name='compulsory_course_id', db_column='course_id')
    course_name = models.TextField(blank=True, null=True)
    dep = models.ForeignKey('DepID', to_field="dep_id", on_delete=models.CASCADE, 
         related_name='compulsory_dep_id', db_column='dep_id', null=True)
    
    class Meta:
        db_table = 'DB_project"."Compulsory'
        unique_together = ['course', 'dep']
    def __str__(self):
        return self.course_name



class AllCompulsory(models.Model):
    compulsory_id = models.IntegerField(primary_key=True)
    course_id = models.TextField(unique=True)
    
    class Meta:
        db_table = 'DB_project"."AllCompulsory'
    def __str__(self):
        return self.course_id
        
class MinorStats(models.Model):
    year = models.TextField(blank=True, null=True)
    dep = models.ForeignKey('DepID', on_delete=models.CASCADE, related_name='minorStats_dep_id', db_column='dep_id')
    number_of_applicants = models.IntegerField()
    approved_number = models.IntegerField()
    approval_rate = models.TextField(blank=True, null=True)
    id_for_minorStats = models.IntegerField(primary_key=True)
    class Meta:
        db_table = 'DB_project"."MinorStats'
        unique_together = ['year', 'dep']

    def __str__(self):
        return self.dep

class DoubleMajorStats(models.Model):
    year = models.TextField(blank=True, null=True)
    dep = models.ForeignKey('DepID', on_delete=models.CASCADE, related_name='doubleMajorStats_dep_id', db_column='dep_id')
    number_of_applicants = models.IntegerField()
    approved_number = models.IntegerField()
    approval_rate = models.TextField(blank=True, null=True)
    id_for_doubleMajorStats = models.IntegerField(primary_key=True)
    class Meta:
        db_table = 'DB_project"."DoubleMajorStats'
        unique_together = ['year', 'dep']

    def __str__(self):
        return self.dep

class TransferStats(models.Model):
    year = models.TextField(blank=True, null=True)
    dep = models.ForeignKey('DepID', on_delete=models.CASCADE, related_name='transferStats_dep_id', db_column='dep_id')
    transfer_in_applicants = models.IntegerField()
    transfer_in_Approved_number = models.IntegerField()
    transfer_in_Approval_rate = models.TextField(blank=True, null=True)
    transfer_out_applicants = models.IntegerField()
    transfer_out_winners = models.IntegerField()
    transfer_out_successed_rate = models.TextField(blank=True, null=True)
    id_for_transferStats = models.IntegerField(primary_key=True)

    class Meta:
        db_table = 'DB_project"."TransferStats'
        unique_together = ['year', 'dep']

    def __str__(self):
        return self.dep

class Article(models.Model):
    post_id = models.AutoField(primary_key=True)
    dep = models.ForeignKey('DepID', on_delete=models.CASCADE,
        related_name='article_dep_id', db_column='dep_id')
    content = models.TextField(blank=True, null=True)
    user_mail = models.ForeignKey(User, on_delete=models.CASCADE,
        related_name='article_user_mail', db_column='user_mail')
    date = models.TextField(blank=True, null=True)
    title = models.TextField(blank=True, null=True)
    status = models.BooleanField(default=True)
    likes_num = models.IntegerField(default=0)
    class Meta:
        db_table = 'DB_project"."Article'
    def __str__(self):
        return self.title

class ShareData(models.Model):
    data_id = models.AutoField(primary_key=True)
    user_mail = models.ForeignKey(User, on_delete=models.CASCADE,
        related_name='sharedata_user_mail', db_column='user_mail')
    year = models.TextField()
    gpa_first_semester = models.TextField()
    gpa_second_semester = models.TextField()
    option = models.TextField()
    prioity = models.TextField()
    dep = models.ForeignKey('DepID', on_delete=models.CASCADE,
        related_name='sharedata_dep_id', db_column='dep_id')  
    ori_dep = models.TextField(default="None")
    class Meta:
        db_table = 'DB_project"."ShareData'
    def __str__(self):
        return str(self.data_id)

class ShareDataFail(models.Model):
    data_id = models.AutoField(primary_key=True)
    user = models.ForeignKey(User, on_delete=models.CASCADE,
        related_name='sharedataFail_user', db_column='user_id')
    year = models.TextField()
    gpa_first_semester = models.TextField()
    gpa_second_semester = models.TextField()
    option = models.TextField()
    prioity = models.TextField()
    dep = models.ForeignKey('DepID', on_delete=models.CASCADE,
        related_name='sharedataFail_dep_id', db_column='dep_id')  
    ori_dep = models.TextField(default="None")
    class Meta:
        db_table = 'DB_project"."ShareDataFail'
    def __str__(self):
        return str(self.data_id)

class TakenCompulsory(models.Model):
    taken_id = models.AutoField(primary_key=True)
    data = models.ForeignKey("ShareData", on_delete=models.CASCADE,
        related_name='taken_data_id', db_column='data_id')
    course = models.ForeignKey("AllCompulsory", to_field="course_id", on_delete=models.CASCADE,
        related_name='taken_course_id', db_column='course_id')
    grade = models.TextField()
     
    class Meta:
        db_table = 'DB_project"."TakenCompulsory'
    def __str__(self):
        return self.data

class TakenCompulsoryFail(models.Model):
    taken_id = models.AutoField(primary_key=True)
    data = models.ForeignKey("ShareDataFail", on_delete=models.CASCADE,
        related_name='fail_taken_data_id', db_column='data_id')
    course = models.ForeignKey("AllCompulsory", to_field="course_id", on_delete=models.CASCADE,
        related_name='fali_taken_course_id', db_column='course_id')
    grade = models.TextField()
     
    class Meta:
        db_table = 'DB_project"."TakenCompulsoryFail'
    def __str__(self):
        return self.data


class VerifyCode(models.Model):
    code_id = models.AutoField(primary_key=True)
    mail = models.TextField()
    vcode = models.TextField()

    class Meta:
        db_table = 'DB_project"."VerifyCode'
    def __str__(self):
        return self.mail

class Reply(models.Model):
    reply_id = models.AutoField(primary_key=True)
    post_id = models.ForeignKey('Article', on_delete=models.CASCADE,
        related_name='reply_post_id', db_column='post_id')
    post_reply_id = models.IntegerField()
    user_id = models.ForeignKey(User, on_delete=models.CASCADE,
        related_name='reply_user_id', db_column='user_id')
    content = models.TextField()
    date = models.TextField()
    likes_num = models.IntegerField(default=0)
    status = models.BooleanField(default=True)

    class Meta:
        db_table = 'DB_project"."Reply'
    
    def __str__(self):
        return self.user_id


class User_likes_article(models.Model):
    post_id = models.ForeignKey('Article', on_delete=models.CASCADE,
        related_name='user_likes', db_column='post_id')
    user_id = models.ForeignKey(User, on_delete=models.CASCADE,
        related_name='user_likes_post', db_column='user_id')
    likes_id = models.AutoField(primary_key=True)

    class Meta:
        db_table = 'DB_project"."User_likes_article'
    
    def __str__(self):
        return self.likes_id

class User_likes_reply(models.Model):
    reply_id = models.ForeignKey('Reply', on_delete=models.CASCADE,
        related_name='user_likes', db_column='reply_id')
    user_id = models.ForeignKey(User, on_delete=models.CASCADE,
        related_name='user_likes_reply', db_column='user_id')
    likes_id = models.AutoField(primary_key=True)

    class Meta:
        db_table = 'DB_project"."User_likes_reply'
    
    def __str__(self):
        return self.likes_id