"""project URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.1/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.urls import path
from . import views


urlpatterns = [
    path("", views.homeCozinha, name="homeCozinha"),
    path("CriarProduto", views.CriarProduto, name="CriarProduto"),
    path("VisualizarProdutos", views.VisualizarProdutos, name="VisualizarProdutos"),
   #  path("Restaurante_info", views.Restaurante_info, name="Restaurante_info"),
    path("DeleteProduto", views.DeleteProduto, name="DeleteProduto"),
    path("EditarProduto", views.EditarProduto, name="EditarProduto"),

    path("ProdutoInfo/<str:id_res>", views.ProdutoInfo, name="ProdutoInfo")
]
