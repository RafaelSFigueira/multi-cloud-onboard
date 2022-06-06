from django.urls import path

from . import views

urlpatterns = [
   
    path("", views.homepage, name="homepage"),

    path("VisualizarRestaurantes", views.VisualizarRestaurantes, name="VisualizarRestaurantes"),
    path("Salas", views.Salas, name="Salas"),
    path("Delete_Sala/<str:id_sala>", views.Delete_Sala, name="Delete_Sala"),
    path("VisualizarSalas/<str:id_res>", views.VisualizarSalas, name="VisualizarSalas"),

    path("Restaurante_info/<str:id_res>", views.Restaurante_info, name="Restaurante_info"),

    path("Sala_editar/<str:id_sala>", views.Sala_editar, name="Sala_editar"),
    path("VisualizarMesas/<str:id_sala>", views.VisualizarMesas, name="VisualizarMesas"),
    path("CriarMesa/<str:id_sala>", views.CriarMesa, name="CriarMesa"),
    path("EliminarMesa/<str:id_mesa>", views.EliminarMesa, name="EliminarMesa"),
    path("EditarRestaurante/<str:res_id>", views.EditarRestaurante, name="EditarRestaurante"),
    path("EditarMesa/<str:id_mesa>", views.EditarMesa, name="EditarMesa"),
    path("pagina_redirect", views.pagina_redirect, name="pagina_redirect"),
    
]