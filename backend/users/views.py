from django.core.exceptions import RequestAborted
from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.contrib.auth.models import User
from django.contrib.auth import authenticate, login, logout
from rest_framework.views import APIView
from users.serializers import UserListSerializer
from DB_project.models import *
import datetime
from django.core.mail import EmailMessage
from django.conf import settings
import random
from rest_framework.permissions import IsAuthenticated
# Create your views here.
import jwt
from rest_framework_simplejwt.authentication import JWTAuthentication
JWT_authenticator = JWTAuthentication()


def get_code():
    code = ''
    # set your random code
    return code




class GetUserMail(APIView):
    permission_classes = (IsAuthenticated,) 
    def post(self, request):
        response = JWT_authenticator.authenticate(request)
        if response is not None:
            user , token = response
            print("this is decoded token claims", token.payload)
        else:
            print("no token is provided in the header or the header is missing")
        user = User.objects.get(id=response[1]["user_id"])
        return Response(user.email, status=status.HTTP_200_OK)


@api_view(['POST'])
def Register(request):
    username = request.data['username']
    password = request.data['password']
    mail = request.data['mail']
    vcode = request.data['vcode']
    student_code = mail[:-11] if "@ntu.edu.tw" in mail else mail[:-13]
    temp = VerifyCode.objects.filter(mail=mail)
    if User.objects.filter(username=username):
        return Response("username exist!", status=status.HTTP_400_BAD_REQUEST)
    if User.objects.filter(email=student_code+"@ntu.edu.tw") or User.objects.filter(email=student_code+"@g.ntu.edu.tw"):
        return Response("mail exist!", status=status.HTTP_400_BAD_REQUEST)
    if not temp:
        return Response("Didn't click verify button!", status=status.HTTP_400_BAD_REQUEST)
    if temp[0].vcode != vcode:
        return Response("Wrong verify code.", status=status.HTTP_400_BAD_REQUEST)
    user = User.objects.create_user(username, mail, password)
    temp.delete()
    return Response("User created.", status=status.HTTP_200_OK)

# {"mail: "Howard@gmail.com", "vcode":"1234567qq", "username":"Howard", "password":"12312312qq"}


@api_view(['POST'])
def Login(request):
    username = request.data['username']
    password = request.data['password']
    user = authenticate(username=username, password=password)
    if user is not None:
        login(request, user)
        return Response(f"Good.", status=status.HTTP_200_OK)
    else:
        return Response(f"Liar.", status=status.HTTP_401_UNAUTHORIZED)
# {"username":"Evan", "password":"1234567qq"}


@api_view(['GET'])
def Logout(request):
    logout(request)
    return Response("Logout.", status=status.HTTP_200_OK)


@api_view(['POST'])
def CreatePost(request):
    print(request.auth)
    response = JWT_authenticator.authenticate(request)
    if response is not None:
        user = User.objects.filter(id=response[1]["user_id"])[0]
        cuser = Article.objects.create(
            dep_id=request.data['dep_id'],
            content=request.data['content'],
            user_mail=user,
            date=datetime.datetime.now(),
            title=request.data['title'],
            status=True
        )
        cuser.save()
        return Response("Post request.", status=status.HTTP_200_OK)
    else:
        return Response("Plz login", status=status.HTTP_400_BAD_REQUEST)
# {"dep_id":"7050", "content":"乳題，資管系轉系很難嗎？", "user_mail": "Evan@gmail.com", "title": "轉資管系"}


# NEW
@api_view(['POST'])
def CreateShare(request):
    if request.data["type"] == "failure":
        response = JWT_authenticator.authenticate(request)
        if  response is None:
            return Response("Plz login", status=status.HTTP_400_BAD_REQUEST)
        temp = DepID.objects.get(dep_id=request.data['dep_id'])
        user = User.objects.filter(id=response[1]["user_id"])[0]
        cuser = ShareDataFail.objects.create(
            # user_mail=request.user,
            user=user,
            year=request.data['year'],
            gpa_first_semester=request.data['gpa_first_semester'],
            gpa_second_semester=request.data['gpa_second_semester'],
            option=request.data['option'],
            prioity="1",
            dep=temp,
            ori_dep=request.data['ori_dep']
        )
        cuser.save()
        data_id = ShareDataFail.objects.filter(
            user=user, option=request.data['option']).latest('data_id').data_id
        return Response({"message": "good", "data_id": data_id}, status=status.HTTP_200_OK)
    response = JWT_authenticator.authenticate(request)
    print(response)
    if response is not None:
        temp = DepID.objects.get(dep_id=request.data['dep_id'])
        user = User.objects.filter(id=response[1]["user_id"])[0]
        cuser = ShareData.objects.create(
            # user_mail=request.user,
            user_mail=user,
            year=request.data['year'],
            gpa_first_semester=request.data['gpa_first_semester'],
            gpa_second_semester=request.data['gpa_second_semester'],
            option=request.data['option'],
            prioity="1",
            dep=temp,
            ori_dep=request.data['ori_dep']
        )
        cuser.save()
        data_id = ShareData.objects.filter(
            user_mail=user, option=request.data['option'])[0].data_id
        return Response({"message": "good", "data_id": data_id}, status=status.HTTP_200_OK)
    else:
        return Response("Plz login", status=status.HTTP_400_BAD_REQUEST)



@api_view(['POST'])
def AddCourse(request):
    response = JWT_authenticator.authenticate(request)
    if request.data['type'] == "failure":
        if response is not None:
            data = ShareDataFail.objects.filter(data_id=request.data['data_id'])[0]
            course = AllCompulsory.objects.filter(
                course_id=request.data['course_id'])[0]
            cuser = TakenCompulsoryFail.objects.create(
                data=data,
                course=course,
                grade=request.data['grade'],
            )
            cuser.save()
            return Response("Add Fail taken course.", status=status.HTTP_200_OK)
        else:
            return Response("Plz login", status=status.HTTP_400_BAD_REQUEST)
    if response is not None:
        data = ShareData.objects.filter(data_id=request.data['data_id'])[0]
        course = AllCompulsory.objects.filter(
            course_id=request.data['course_id'])[0]
        cuser = TakenCompulsory.objects.create(
            data=data,
            course=course,
            grade=request.data['grade'],
        )
        cuser.save()
        return Response("Add taken course.", status=status.HTTP_200_OK)
    else:
        return Response("Plz login", status=status.HTTP_400_BAD_REQUEST)

@api_view(['POST'])
def CheckDuplicateShare(request):
    response = JWT_authenticator.authenticate(request)
    if response is not None:
        user = User.objects.filter(id=response[1]["user_id"])[0]
        temp_transfer = list(ShareData.objects.filter(
            option="Transfer", user_mail=user.id))
        temp_db = list(ShareData.objects.filter(
            option="DoubleMajor", user_mail=user.id))
        temp_minor = list(ShareData.objects.filter(
            option="Minor", user_mail=user.id))
        return Response({"Transfer": not bool(temp_transfer), "DoubleMajor": not bool(temp_db), "Minor": not bool(temp_minor)}, status=status.HTTP_200_OK)


@api_view(['POST'])
def SetVerifyCode(request):
    user_mail = request.data['mail']
    verify_mail = VerifyCode.objects.filter(mail=user_mail)
    if request.data["type"] == "register":
        if User.objects.filter(email=user_mail):
            return Response("User mail exist", status=status.HTTP_400_BAD_REQUEST)
    vcode = get_code()
    if verify_mail:
        verify_mail[0].vcode = vcode
        verify_mail[0].save()
    else:
        cuser = VerifyCode.objects.create(
            mail=request.data['mail'],
            vcode=vcode,
        )
        cuser.save()
    email = EmailMessage(
        '台大雙轉輔網站信箱確認驗證碼',
        f"您好，\n\n這是您的信箱驗證碼:\n{vcode}\n\n若您未使用本網站進行信箱驗證，\n請忽略此信謝謝您～",
        settings.EMAIL_HOST_USER,
        [user_mail]
    )
    email.fail_silently = False
    email.send()
    return Response("Good.", status=status.HTTP_200_OK)
#  {"mail":"Howard@gmail.com", "vcode":"1234567qq"}


@api_view(['Post'])
def CreateReplay(request):
    response = JWT_authenticator.authenticate(request)
    if response is not None:
        temp_post = Article.objects.filter(
            post_id=request.data['post_id'])[0]
        if not temp_post:
            return Response("Post doesn't exist!", status=status.HTTP_400_BAD_REQUEST)
        count_reply = Reply.objects.filter(post_id=temp_post)
        user = User.objects.filter(username=request.data["username"])
        print(user[0].username)
        cuser = Reply.objects.create(
            post_id=temp_post,
            post_reply_id=len(count_reply) + 1,
            content=request.data['content'],
            user_id=user[0],
            date=datetime.datetime.now(),
            status=True
        )
        cuser.save()
        return Response("Reply request success.", status=status.HTTP_200_OK)
    else:
        return Response("Plz login", status=status.HTTP_400_BAD_REQUEST)


@api_view(['Post'])
def Forgetpassword(request):
    user = User.objects.filter(email=request.data["mail"])
    if not user:
        return Response("User didn't exist!", status=status.HTTP_400_BAD_REQUEST)
    temp_vcode = VerifyCode.objects.filter(mail=request.data["mail"])
    if not temp_vcode:
        return Response("Plz click verify button", status=status.HTTP_400_BAD_REQUEST)
    if temp_vcode[0].vcode != request.data["vcode"]:
        return Response("Wrong verify code", status=status.HTTP_400_BAD_REQUEST)
    user[0].set_password(request.data["new_password"])
    user[0].save()
    temp_vcode.delete()
    return Response({"msg":"Success reset password", "username":user[0].username}, status=status.HTTP_200_OK)


@api_view(['Post'])
def ChangePassword(request):
    if not request.user.is_authenticated:
        return Response("Plz login", status=status.HTTP_400_BAD_REQUEST)
    user = authenticate(username=request.user.username,
                        password=request.data["old_password"])
    if user is not None:
        user.set_password(request.data["new_password"])
        user.save()
        return Response("Success reset password", status=status.HTTP_200_OK)
    else:
        return Response("Wrong old password!", status=status.HTTP_200_OK)


@api_view(['Post'])
def likeArticle(request):
    response = JWT_authenticator.authenticate(request)
    if response is None:
        return Response("Plz login", status=status.HTTP_400_BAD_REQUEST)
    # user = request.user
    user = User.objects.filter(id=response[1]["user_id"])[0]

    post = Article.objects.filter(post_id=request.data["post_id"])[0]
    if not post.status:
        return Response("Post were deleted", status=status.HTTP_400_BAD_REQUEST)
    if (s := User_likes_article.objects.filter(user_id=user, post_id=post)):
        post.likes_num -= 1
        post.save()
        s.delete()
        return Response("User unlikes post", status=status.HTTP_200_OK)
    else:
        post.likes_num += 1
        post.save()
        post.save()
        user_likes = User_likes_article.objects.create(
            post_id=post,
            user_id=user
        )
        user_likes.save()
        return Response("User likes post", status=status.HTTP_200_OK)


@api_view(['Post'])
def DeletePost(request):
    response = JWT_authenticator.authenticate(request)
    if response is None:
        return Response("Plz login", status=status.HTTP_400_BAD_REQUEST)
    user = User.objects.filter(id=response[1]["user_id"])[0]
    post = Article.objects.filter(post_id=request.data["post_id"])[0]
    if post.user_mail.username == user.username:
        post.status = False
        post.save()
        return Response("Success in deleting post", status=status.HTTP_200_OK)
    else:
        return Response("user are not the post author", status=status.HTTP_400_BAD_REQUEST)


@api_view(['Post'])
def DeleteReply(request):
    response = JWT_authenticator.authenticate(request)
    if response is None:
        return Response("Plz login", status=status.HTTP_400_BAD_REQUEST)
    user = User.objects.filter(id=response[1]["user_id"])[0]
    reply = Reply.objects.filter(post_id=request.data["post_id"], post_reply_id=request.data["post_reply_id"])[0]
    if reply.user_id.username == user.username:
        reply.status = False
        reply.save()
        return Response("Success in deleting reply", status=status.HTTP_200_OK)
    else:
        return Response("user are not the reply author", status=status.HTTP_400_BAD_REQUEST)


@api_view(['Post'])
def likeReply(request):
    response = JWT_authenticator.authenticate(request)
    if response is None:
        return Response("Plz login", status=status.HTTP_400_BAD_REQUEST)
    user = User.objects.filter(id=response[1]["user_id"])[0]

    reply = Reply.objects.filter(post_id=request.data["post_id"], post_reply_id=request.data["post_reply_id"])[0]
    if not reply.status:
        return Response("Post were deleted", status=status.HTTP_400_BAD_REQUEST)
    if (s := User_likes_reply.objects.filter(user_id=user, reply_id=reply)):
        reply.likes_num -= 1
        reply.save()
        s.delete()
        return Response("User unlikes post", status=status.HTTP_200_OK)
    else:
        reply.likes_num += 1
        reply.save()
        reply.save()
        user_likes = User_likes_reply.objects.create(
            reply_id=reply,
            user_id=user
        )
        user_likes.save()
        return Response("User likes post", status=status.HTTP_200_OK)