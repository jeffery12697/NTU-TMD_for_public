from django.conf.urls import url
from DB_project import views

urlpatterns = [
    url('list', views.TransferRequirementList),
    url('search/requirement', views.RequirementSearch),
    url('map', views.DepidMap),
    url('search/statistics', views.StatisticsSearch),
    url('search/compulsory', views.CompulsoryList),
    url('search/dep_post', views.Dep_post),
    url('search/post_reply', views.PostReply),
    url('search/sharedata', views.SearchShare),
    url('search/share_fail', views.SearchShareFail)
]