from asyncio.windows_events import NULL
import os
from django.http import HttpResponse
from operator import truediv
from django.shortcuts import redirect, render
from .models import *
from restaurantes.decorators import *
from notificacoes.views import count_notificacoes
##############################################################################################################################
#########                                                                                                            #########
#########                                            Visualizar Mesas                                                #########
#########                                               (garcon)                                                     #########
##############################################################################################################################
@IsLoggedIn
@allowed_users(allowed_user=[1])
def VisualizarMesas2(request, id_sala):
   
    sala = Sala.objects.filter(id=id_sala).first()
    restaurante = sala.restauranteid
    salas = Sala.objects.filter(restauranteid=restaurante)
    mesas = Mesa.objects.filter(salaid=id_sala)

    sala = Sala.objects.filter(id=id_sala).values_list('nomesala', flat=True).first()

    res = Restaurante.objects.filter(id=restaurante.id).values_list('nome', flat=True).first()



   
   
    return render(request, 'garcon/MesasGarcon.html', {'salas': salas, "sala" : sala, "res": res, 
    "id_res": restaurante.id, "sala_id" : int(id_sala), 'Pagina' : "Visualizar Mesas", 'NumeroNotif': count_notificacoes(func_id=request.session['funcID']),
     'numero': request.GET.get("numero", ""),  'capacidade': request.GET.get("capacidade", ""), 'mesas' : mesas, 'capacidade_max': request.GET.get("capacidade_max", "")})
