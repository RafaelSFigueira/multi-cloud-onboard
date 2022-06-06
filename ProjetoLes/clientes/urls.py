from django.urls import path

from . import views

urlpatterns = [
    path("Restaurantes", views.Restaurantes, name="Restaurantes"),
    path("Make_Reserva/<str:restaurante_id>", views.Make_Reserva, name="Make_Reserva"),
    path("Make_reserva_passo2/<str:restaurante_id>", views.Make_reserva_passo2, name="Make_reserva_passo2"),
    path("VisualizarReservas", views.Ver_Reservas, name="Ver_Reservas"),
    path("EliminarReserva/<str:reserva_id>", views.EliminarReserva, name="EliminarReserva"),
    path("EditarReserva/<str:reserva_id>", views.EditarReserva, name="EditarReserva"),
    path("Make_TakeAway/<str:restaurante_id>", views.Make_TakeAway, name="Make_TakeAway"),
    path("CreatePedido_takeAway/<str:restaurante_id>", views.CreatePedido_takeAway, name="CreatePedido_takeAway"),
    path("VisualizarTakeAways", views.Ver_take_aways, name="Ver_take_aways"),
    path("Takeaway_info/<str:id_pedido>", views.Takeaway_info, name="Takeaway_info"),
    path("EliminarTakeAway/<str:id_pedido>", views.EliminarTakeAway, name="EliminarTakeAway"),
]


