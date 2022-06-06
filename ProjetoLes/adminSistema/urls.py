from django.urls import path

from . import views

urlpatterns = [

    path("", views.AdminSistemaHomepage, name="AdminSistemaHomepage"),
    path("CriarRestaurante", views.CriarRestaurante, name="CriarRestaurante"),
    path("VerRestaurantes", views.VerRestaurantes, name="VerRestaurantes"),
    path("EliminarRestaurante", views.EliminarRestaurante, name="EliminarRestaurante"),
    path("Info_Restaurante/<str:id_res>", views.Info_Restaurante, name="Info_Restaurante"),
    path("RestauranteEditar/<str:res_id>", views.RestauranteEditar, name="RestauranteEditar"),

    path("InformacoesDoRestaurante/<str:id_res>", views.InformacoesDoRestaurante, name="InformacoesDoRestaurante"),
    path("VerFuncionarios/<str:res_id>", views.VerFuncionarios, name="VerFuncionarios"), 
    path("CreateFuncionario", views.CreateFuncionario, name="CreateFuncionario"),
    path("EditarFuncionario/<str:func_id>", views.EditarFuncionario, name="EditarFuncionario"), 
    path("ApagarFuncionario/<str:func_id>", views.ApagarFuncionario, name="ApagarFuncionario"),
    

    
]