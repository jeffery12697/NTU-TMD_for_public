from django.conf.urls import url
from users import views

urlpatterns = [
    url('get_mail', views.GetUserMail.as_view()),
    url('register', views.Register),   
    url('logout', views.Logout),
    url('createpost', views.CreatePost),
    url('createshare', views.CreateShare),
    url('check_duplicate_share', views.CheckDuplicateShare),
    url('set_verify_code', views.SetVerifyCode),
    url('add_course', views.AddCourse),
    url('create_reply', views.CreateReplay),
    url('forget_password', views.Forgetpassword),
    url('change_password', views.ChangePassword),
    url("likes_post", views.likeArticle),
    url("delete_post", views.DeletePost),
    url("delete_reply", views.DeleteReply),
    url("likes_reply", views.likeReply)
]

# {"username":"Evan", "password":"1234567qq"}