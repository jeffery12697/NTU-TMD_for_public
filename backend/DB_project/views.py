from re import search
import re
from rest_framework import status
from rest_framework.decorators import api_view
from rest_framework.response import Response
from django.shortcuts import render
from DB_project.models import TransferRequirement as TR
from DB_project.models import DoubleMajorRequirement as DBR
from DB_project.models import MinorRequirement as MR
from DB_project.models import DepID as Dep
from DB_project.models import *
from DB_project.serializers import RequirementListSerializer, DepidMapSerializer
from django.contrib.auth.models import User


# Create your views here.


@api_view(['GET'])
def TransferRequirementList(request):
    if request.method == 'GET':
        requitements = TR.objects.all()
        serializer = RequirementListSerializer(requitements, many=True)
        return Response(serializer.data, status=status.HTTP_200_OK)


@api_view(['GET'])
def DepidMap(request):
    if request.method == 'GET':
        requitements = Dep.objects.all()
        serializer = DepidMapSerializer(requitements, many=True)
        ingnore_data = {"3020":0, "3051":0, "3052":0, "3100":0, "4031":0, "4081":0, 
                        "4120":0, "6031":0, "6032":0, "6051":0, "6052":0, "6053":0, 
                        "6054":0, "605A":0,  "605B":0, "605C":0, "605D":0, "6101":0,
                        "6102":0,  "7010":0, "B01A":0, "B01B":0, "B01C":0, "E010":0,
                        "E030":0, "E040":0, "E070":0, "E020":0
                        }
        data = []
        for i in serializer.data:
            if i["dep_id"] in ingnore_data:
                continue
            data.append(i)
        return Response(data, status=status.HTTP_200_OK)


@api_view(['POST'])
def CompulsoryList(request):
    if request.method == 'POST':
        try:
            dep_id = request.data['dep_id']
        except KeyError:
            return Response("Parameter should contain dep_id", status=status.HTTP_400_BAD_REQUEST)
        search_list = list(Compulsory.objects.values())
        # result = {"course_id":[], "course_name":[]}
        result = []
        for item in search_list:
            if item['dep_id'] == dep_id:
                temp = {}
                temp["course_id"] = item['course_id']
                temp["course_name"] = item['course_name']
                result.append(temp)

        return Response(result, status=status.HTTP_200_OK)


@api_view(['POST'])
def RequirementSearch(request):
    if request.method == 'POST':
        try:
            dep_id = request.data['dep_id']
        except KeyError:
            return Response("Parameter should contain dep_id", status=status.HTTP_400_BAD_REQUEST)
        try:
            type_ = request.data['type']
        except KeyError:
            claim = " Parameter should contain type "
            return Response(claim, status=status.HTTP_400_BAD_REQUEST)

        if type_ == "Transfer":
            search_list = list(TR.objects.values())
        elif type_ == "DoubleMajor":
            search_list = list(DBR.objects.values())
        elif type_ == "Minor":
            search_list = list(MR.objects.values())
        else:
            claim = " type does not exist! \n tpye should be Transfer / DoubleMajor / Minor  "
            return Response(claim, status=status.HTTP_400_BAD_REQUEST)

        result = {}
        for item in search_list:
            if item['dep_id'] == dep_id:
                result = item

        if not result:
            return Response("dep_id does not exist!", status=status.HTTP_400_BAD_REQUEST)

        dep_name = Dep.objects.filter(dep_id=dep_id)[0].dep_name
        result['dep_name'] = dep_name
        return Response(result, status=status.HTTP_200_OK)


@api_view(['POST'])
def StatisticsSearch(request):
    if request.method == 'POST':
        try:
            dep_id = request.data['dep_id']
        except KeyError:
            return Response("Parameter should contain dep_id", status=status.HTTP_400_BAD_REQUEST)
        try:
            type_ = request.data['type']
        except KeyError:
            claim = "Parameter should contain type "
            return Response(claim, status=status.HTTP_400_BAD_REQUEST)

        if type_ == "Transfer":
            search_list = list(TransferStats.objects.values())
        elif type_ == "DoubleMajor":
            search_list = list(DoubleMajorStats.objects.values())
        elif type_ == "Minor":
            search_list = list(MinorStats.objects.values())
        result = {}
        if type_ == "Transfer":
            result = {
                "transfer_in_applicants": [],
                "transfer_in_Approved_number": [],
                "transfer_in_Approval_rate": [],
                "transfer_out_applicants": [],
                "transfer_out_winners": [],
                "transfer_out_successed_rate": [],
                "year": []
            }
            for item in search_list:
                if item['dep_id'] == dep_id:
                    result["transfer_in_applicants"].append(
                        item["transfer_in_applicants"])
                    result["transfer_in_Approved_number"].append(
                        item["transfer_in_Approved_number"])
                    result["transfer_in_Approval_rate"].append(
                        item["transfer_in_Approval_rate"])
                    result["transfer_out_applicants"].append(
                        item["transfer_out_applicants"])
                    result["transfer_out_winners"].append(
                        item["transfer_out_winners"])
                    result["transfer_out_successed_rate"].append(
                        item["transfer_out_successed_rate"])
                    result["year"].append(item["year"])
            new_transfer_in_applicants = []
            for i in ["110", "109", "108", "107", "106"]:
                mark = False
                for k in range(len(result["year"])):
                    if i == result["year"][k]:
                        new_transfer_in_applicants.append(result["transfer_in_applicants"][k])
                        mark = True
                if not mark:
                    new_transfer_in_applicants.append("0")
            if result["transfer_in_applicants"]:
                result["transfer_in_applicants"] = new_transfer_in_applicants
        else:
            result = {
                "number_of_applicants": [],
                "approved_number": [],
                "approval_rate": [],
                "year": []
            }
            for item in search_list:
                if item['dep_id'] == dep_id:
                    result["number_of_applicants"].append(
                        item["number_of_applicants"])
                    result["approved_number"].append(item["approved_number"])
                    result["approval_rate"].append(item["approval_rate"])
                    result["year"].append(item["year"])
            new_number_of_applicants = []
            for i in ["110", "109", "108", "107", "106"]:
                mark = False
                for k in range(len(result["year"])):
                    if i == result["year"][k]:
                        new_number_of_applicants.append(result["number_of_applicants"][k])
                        mark = True
                if not mark:
                    new_number_of_applicants.append("0")
            if result["number_of_applicants"]:
                result["number_of_applicants"] = new_number_of_applicants
        if not result["year"]:
            return Response("dep_id does not exist!", status=status.HTTP_400_BAD_REQUEST)
        



        dep_name = Dep.objects.filter(dep_id=dep_id)[0].dep_name
        result['dep_name'] = dep_name
        return Response(result, status=status.HTTP_200_OK)


@api_view(['Post'])
def Dep_post(request):
    data = []
    dep_post = Article.objects.filter(dep=request.data["dep_id"])
    username = request.data['username']
    if request.user.is_authenticated or username != '':
        users_list = list(User.objects.all())
        for user_ in users_list:
            if user_.username == username:
                select_user_id = user_.id
        for i in dep_post:
            if not i.status:
                continue
            tem = {}
            tem["post_id"] = i.post_id
            tem["title"] = i.title
            tem["content"] = i.content
            tem["author"] = i.user_mail.username
            tem["likes_num"] = i.likes_num
            tem["user_likes"] = bool(User_likes_article.objects.filter(
                post_id=Article.objects.get(post_id=i.post_id), user_id=select_user_id))
            tem["post_reply_num"] = len(Reply.objects.filter(post_id=i))
            tem["datetime"] = i.date
            data.append(tem)
        data = sorted(data, key=lambda x: x["post_id"], reverse=True)
        return Response(data, status=status.HTTP_200_OK)
    else:
        for i in dep_post:
            if not i.status:
                continue
            tem = {}
            tem["post_id"] = i.post_id
            tem["title"] = i.title
            tem["content"] = i.content
            tem["author"] = i.user_mail.username
            tem["likes_num"] = i.likes_num
            tem["datetime"] = i.date
            tem["user_likes"] = False
            tem["post_reply_num"] = len(Reply.objects.filter(post_id=i))

            data.append(tem)
        data = sorted(data, key=lambda x: x["post_id"], reverse=True)
        return Response(data, status=status.HTTP_200_OK)


@api_view(['Post'])
def PostReply(request):
    post = Article.objects.filter(post_id=request.data["post_id"])
    if not post:
        return Response("post didn't exist", status=status.HTTP_400_BAD_REQUEST)
    post = post[0]
    if not post.status:
        return Response("post were deleted", status=status.HTTP_400_BAD_REQUEST)
    all_reply = Reply.objects.filter(post_id=post)
    data = []
    if request.user.is_authenticated or request.data["username"] != '':
        for i in all_reply:
            if not i.status:
                continue
            tem = {}
            tem["post_id"] = post.post_id
            tem["post_reply_id"] = i.post_reply_id
            tem["content"] = i.content
            tem["username"] = i.user_id.username
            tem["datetime"] = i.date
            tem["like_num"] = i.likes_num
            if User_likes_reply.objects.filter(reply_id=i, user_id=User.objects.filter(username=request.data["username"])[0]):
                tem["user_like"] = True
            else:
                tem["user_like"] = False
            data.append(tem)

    else:
        for i in all_reply:
            if not i.status:
                continue
            tem = {}
            tem["post_id"] = post.post_id
            tem["post_reply_id"] = i.post_reply_id
            tem["content"] = i.content
            tem["username"] = i.user_id.username
            tem["datetime"] = i.date
            tem["user_like"] = False
            tem["like_num"] = i.likes_num
            data.append(tem)
    return Response(data, status=status.HTTP_200_OK)


@api_view(['Post'])
def SearchShare(request):
    print(request.data["dep_id"])
    share = ShareData.objects.filter(dep_id=request.data["dep_id"])
    data = []
    count = {}
    for i in share:
        course = TakenCompulsory.objects.filter(data_id=i.data_id)
        if not course:
            continue
        for j in course:
            tem = {}
            tem["course_id"] = j.course_id
            tem["grade"] = j.grade
            tem["type"] = i.option
            tem["year"] = i.year
            tem["gpa"] = i.gpa_first_semester
            # gpa_second_semester 拿來當備註
            tem["note"] = i.gpa_second_semester
            tem["ori_dep"] = i.ori_dep
            tem["data_id"] = i.data_id
            data.append(tem)
            if j.course_id not in count.keys():
                count[j.course_id] = 1
            else:
                count[j.course_id] += 1
        data = sorted(data, key=lambda x: count[x['course_id']], reverse=True)

    return Response(data, status=status.HTTP_200_OK)

@api_view(['Post'])
def SearchShareFail(request):
    share = ShareDataFail.objects.filter(dep_id=request.data["dep_id"])
    data = []
    count = {}
    for i in share:
        course = TakenCompulsoryFail.objects.filter(data_id=i.data_id)
        if not course:
            continue
        for j in course:
            tem = {}
            tem["course_id"] = j.course_id
            tem["grade"] = j.grade
            tem["type"] = i.option
            tem["year"] = i.year
            tem["gpa"] = i.gpa_first_semester
            tem["note"] = i.gpa_second_semester
            tem["ori_dep"] = i.ori_dep
            tem["data_id"] = i.data_id
            data.append(tem)
            if j.course_id not in count.keys():
                count[j.course_id] = 1
            else:
                count[j.course_id] += 1
        data = sorted(data, key=lambda x: count[x['course_id']], reverse=True)

    return Response(data, status=status.HTTP_200_OK)
