from django.urls import path

from . import views

urlpatterns = [
   
    path("VisualizarFuncionarios/<str:res_id>", views.VisualizarFuncionarios, name="VisualizarFuncionarios"), 
    path("CriarFuncionario", views.CriarFuncionario, name="CriarFuncionario"),
    path("CriarConta", views.CriarConta, name="CriarConta"),
    path("Delete_Func/<str:func_id>", views.Delete_Func, name="Delete_Func"),
    path("FuncionarioEditar/<str:func_id>", views.FuncionarioEditar, name="FuncionarioEditar"),
    path("Logout", views.Logout, name="Logout"),
    path("Login", views.Login, name="Login"),
    
]