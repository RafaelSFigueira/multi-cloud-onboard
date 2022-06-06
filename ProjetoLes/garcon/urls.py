from django.urls import path

from . import views

urlpatterns = [

    path("VisualizarMesas2/<str:id_sala>", views.VisualizarMesas2, name="VisualizarMesas2"),
    
    
]