from django.urls import path

from . import views

urlpatterns = [
    path("", views.VisualizarNotificacoes2, name="VisualizarNotificacoes2"), 
    path("<str:not_id>", views.VerNotificacao, name="VerNotificacao"),
    path("CriarNotificacao", views.CriarNotificacao, name="CriarNotificacao"),
    path("EditarNotificacao/<str:notificacao_id>", views.EditarNotificacao, name="EditarNotificacao"),
    path("DeleteNotificacao/<str:notificacao_id>", views.DeleteNotificacao, name="DeleteNotificacao"),
]