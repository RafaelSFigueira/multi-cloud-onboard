import calendar
from turtle import pd
from django.views.generic import TemplateView
from .models import *
from django.shortcuts import redirect, render
from notificacoes.views import count_notificacoes
from .filters import *
from datetime import datetime, timedelta
import json
from restaurantes.decorators import *
from .funcoes import *

@IsLoggedIn
@allowed_users(allowed_user=[1])
def VisualizarEstatisticas(request):

    return render(request = request, 
    template_name="estatistica/home.html",
    context={'NumeroNotif': count_notificacoes(func_id=request.session['funcID']), 'Pagina' : "Página Inicial"}
    )


# Creating views
class EditorChartView(TemplateView):
    template_name = 'estatistica/estatis.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        context["qs"] = Restaurante.objects.all()
        return context



##############################################################################################################################
#########                                                                                                            #########
#########                                    Número médio de pessoas por grupo                                       #########
#########                                                                                                            #########
##############################################################################################################################

@IsLoggedIn
@allowed_users(allowed_user=[1])
def VisualizarEstatisticas_epaco_1(request):
    res_id = request.GET.get("res_id", "0")
    rest = Restaurante.objects.filter(id=res_id).first()
    res_id2= request.GET.get("res_id2", "0")
    if res_id2 == res_id:
        res_id2 = 0

    if rest is None:
        rest = Restaurante.objects.first()

    
    func_id = request.session['funcID']
    func = Funcionario.objects.filter(id=func_id).first()
    restaurantes = Restaurante.objects.filter(funcionarioid=func).exclude(estado="por pagar")
    data = []
    time_min = rest.abertura
    time_max = rest.fecho
    if rest.abertura_tarde is not None:
        time_max = rest.fecho_tarde
    time_min = str(time_min)
    time_max = str(time_max)
    DataInicial = request.GET.get("dateStart", str(datetime.date(datetime.now())))
    DataFinal = request.GET.get("dateEnd", str(datetime.date(datetime.now())))
    HoraInicial = request.GET.get("timeStart", time_min)
    HoraFinal = request.GET.get("timeEnd", time_max)

    if HoraInicial < time_min:
        HoraInicial = time_min
    if HoraFinal > time_max:
        HoraFinal = time_max

    if HoraInicial == "":
        HoraInicial = time_min

    if HoraFinal == "":
        HoraFinal = time_max

    if DataInicial == "":
        DataInicial = str(datetime.date(datetime.now()))

    if DataFinal == "":
        DataFinal = DataInicial

    ##### Reservas  1
    reservas =  Reserva.objects.filter(restauranteid = rest, pedido__isnull=True) # Todas as reservas
    pedidos = Pedido.objects.filter(takeaway= 0, reservaid__isnull=False) # Todos os pedidosque não são takeaway com reserva

    list = []
    for pedido in pedidos:
        list.append(pedido.reservaid.id)
    
    reservas2 = Reserva.objects.filter(id__in=list)
    reservas.union(reservas2)

    reservas_combo = reservas | reservas2
    myFilter = EstatitisticasFilter1(request.GET, queryset=reservas_combo)
    reservas = myFilter.qs

    k = grupos_estatistica(dateInicio=DataInicial, dateFim=DataFinal, horInicio=HoraInicial, horFim=HoraFinal, reservas=reservas)
    dias = k[0]
    data = k[1]
    data2 =[]
    ####### Reservas 2
    rest2 = Restaurante.objects.filter(id=res_id2).first()
    res_id2 = int(res_id2)
    if res_id2 != 0:
        reservas =  Reserva.objects.filter(restauranteid = rest2, pedido__isnull=True) # Todas as reservas
        pedidos = Pedido.objects.filter(takeaway= 0, reservaid__isnull=False) # Todos os pedidosque não são takeaway com reserva

        list = []
        for pedido in pedidos:
            list.append(pedido.reservaid.id)
        
        reservas2 = Reserva.objects.filter(id__in=list)
        reservas.union(reservas2)

        reservas_combo = reservas | reservas2
        myFilter = EstatitisticasFilter1(request.GET, queryset=reservas_combo)
        reservas = myFilter.qs

        k = grupos_estatistica(dateInicio=DataInicial, dateFim=DataFinal, horInicio=HoraInicial, horFim=HoraFinal, reservas=reservas)
        data2 = k[1]
        res_id = int(res_id)
        res_id2 = int(res_id2)
        restaurante_comp = restaurantes.exclude(id=res_id)
        return render(request, 'estatistica/estatis2.html', {'restaurante' : rest, 'res_id' : int(res_id), 
        'restaurantes' : restaurantes, 'data' : data, 'dias' : json.dumps(dias), 'dateStart' : DataInicial, 'dateEnd' : DataFinal,
        'timeStart' : HoraInicial, 'timeEnd' : HoraFinal, 'NumeroNotif': count_notificacoes(func_id=request.session['funcID']), 'e_id' : 1, 'Pagina' : "Estatísticas",
        'time_min' : time_min, 'time_max' : time_max, 'restaurante_comp' : restaurante_comp, 'res_id2' : res_id2, 
        'data2' : data2, 'tam' : len(restaurante_comp), 'ylabel' : 'Média de pessoas', 'xlabel' : k[2], 'titulo' : "Média de número de pessoas por reserva"
        })
    ##############

        
    res_id = int(res_id)
    res_id2 = int(res_id2)
    restaurante_comp = restaurantes.exclude(id=res_id)
    return render(request, 'estatistica/estatis.html', {'restaurante' : rest, 'res_id' : int(res_id), 
        'restaurantes' : restaurantes, 'data' : data, 'dias' : json.dumps(dias), 'dateStart' : DataInicial, 'dateEnd' : DataFinal,
        'timeStart' : HoraInicial, 'timeEnd' : HoraFinal, 'NumeroNotif': count_notificacoes(func_id=request.session['funcID']), 'e_id' : 1, 'Pagina' : "Estatísticas",
        'time_min' : time_min, 'time_max' : time_max, 'restaurante_comp' : restaurante_comp, 'res_id2' : res_id2, 
        'tam' : len(restaurante_comp), 'ylabel' : 'Média de pessoas', 'xlabel' : k[2], 'titulo' : "Média de número de pessoas por reserva"
        })


##############################################################################################################################
#########                                                                                                            #########
#########                        Tempo médio que os clientes permanecem no restaurante                               #########
#########                                                                                                            #########
##############################################################################################################################
@IsLoggedIn
@allowed_users(allowed_user=[1])
def VisualizarEstatisticas_epaco_3(request):
    res_id = request.GET.get("res_id", "0")
    rest = Restaurante.objects.filter(id=res_id).first()
    res_id2= request.GET.get("res_id2", "0")
    if res_id2 == res_id:
        res_id2 = 0
    if rest is None:
        rest = Restaurante.objects.first()

    func_id = request.session['funcID']
    func = Funcionario.objects.filter(id=func_id).first()
    restaurantes = Restaurante.objects.filter(funcionarioid=func).exclude(estado="por pagar")

    data = []
    time_min = rest.abertura
    time_max = rest.fecho
    if rest.abertura_tarde is not None:
        time_max = rest.fecho_tarde
    time_min = str(time_min)
    time_max = str(time_max)
    DataInicial = request.GET.get("dateStart", str(datetime.date(datetime.now())))
    DataFinal = request.GET.get("dateEnd", str(datetime.date(datetime.now())))
    HoraInicial = request.GET.get("timeStart", time_min)
    HoraFinal = request.GET.get("timeEnd", time_max)

    if HoraInicial < time_min:
        HoraInicial = time_min
    if HoraFinal > time_max:
        HoraFinal = time_max

    if HoraInicial == "":
        HoraInicial = time_min

    if HoraFinal == "":
        HoraFinal = time_max

    if DataInicial == "":
        DataInicial = str(datetime.date(datetime.now()))

    if DataFinal == "":
        DataFinal = DataInicial
    

    ### Pedidos 1
    salas = Sala.objects.filter(restauranteid=rest)
    mesas = Mesa.objects.filter(salaid__in=salas)
    cadeiras = Cadeira.objects.filter(mesaid__in=mesas)
    data = []
    

    
    pedidos =  Pedido.objects.filter(cadeiraid__in=cadeiras, takeaway=0)
    ############################################Filtros#################################################
    
    pedidos = pedidos.filter(dataabertura__gte=DataInicial)
    t = datetime.strptime(DataFinal,"%Y-%m-%d").date() 
    dataParcial = t+timedelta(days=1)
    pedidos = pedidos.filter(dataabertura__lte=dataParcial)
    horas = HoraInicial.split(":")
    pedidos = pedidos.filter(dataabertura__hour__gte=horas[0])
    pedidos = pedidos.exclude(dataabertura__hour=horas[0], dataabertura__minute__lte=horas[1])

    horas = HoraFinal.split(":")
    pedidos = pedidos.filter(dataabertura__hour__lte=horas[0])
    pedidos = pedidos.exclude(dataabertura__hour=horas[0], dataabertura__minute__gte=horas[1])
    #####################################################################################################

    k = permanecem_pedidos(dateInicio=DataInicial, dateFim=DataFinal, horInicio=HoraInicial, horFim=HoraFinal, pedidos=pedidos)
    dias = k[0]
    data = k[1]
    data2 = []
    ### Pedidos 2
    rest2 = Restaurante.objects.filter(id=res_id2).first()
    res_id2 = int(res_id2)
    if res_id2 != 0:
        salas = Sala.objects.filter(restauranteid=rest2)
        mesas = Mesa.objects.filter(salaid__in=salas)
        cadeiras = Cadeira.objects.filter(mesaid__in=mesas)
        
        pedidos =  Pedido.objects.filter(cadeiraid__in=cadeiras, takeaway=0)
        ############################################Filtros#################################################
        
        pedidos = pedidos.filter(dataabertura__gte=DataInicial)
        t = datetime.strptime(DataFinal,"%Y-%m-%d").date() 
        dataParcial = t+timedelta(days=1)
        pedidos = pedidos.filter(dataabertura__lte=dataParcial)
        horas = HoraInicial.split(":")
        pedidos = pedidos.filter(dataabertura__hour__gte=horas[0])
        pedidos = pedidos.exclude(dataabertura__hour=horas[0], dataabertura__minute__lte=horas[1])

        horas = HoraFinal.split(":")
        pedidos = pedidos.filter(dataabertura__hour__lte=horas[0])
        pedidos = pedidos.exclude(dataabertura__hour=horas[0], dataabertura__minute__gte=horas[1])
        #####################################################################################################

        k = permanecem_pedidos(dateInicio=DataInicial, dateFim=DataFinal, horInicio=HoraInicial, horFim=HoraFinal, pedidos=pedidos)
        data2 = k[1]
        restaurante_comp = restaurantes.exclude(id=res_id)
        return render(request, 'estatistica/estatis2.html', {'restaurante' : rest, 'res_id' : int(res_id), 
        'restaurantes' : restaurantes, 'data' : data, 'dias' : json.dumps(dias), 'dateStart' : DataInicial, 'dateEnd' : DataFinal,
        'timeStart' : HoraInicial, 'timeEnd' : HoraFinal, 'NumeroNotif': count_notificacoes(func_id=request.session['funcID']), 'e_id' : 3, 'Pagina' : "Estatísticas",
        'time_min' : time_min, 'time_max' : time_max, 'restaurante_comp' : restaurante_comp, 'res_id2' : res_id2, 'data2' : data2, 'tam' : len(restaurante_comp)
        , 'ylabel' : 'Média em minutos', 'xlabel' : k[2], 'titulo' : "Tempo médio que os clientes permanencem no restaurante"
        })

    
    res_id = int(res_id)
    res_id2 = int(res_id2)
    restaurante_comp = restaurantes.exclude(id=res_id)
    return render(request, 'estatistica/estatis.html', {'restaurante' : rest, 'res_id' : res_id, 
    'restaurantes' : restaurantes, 'data' : data, 'dias' : json.dumps(dias), 'dateStart' : DataInicial, 'dateEnd' : DataFinal,
    'timeStart' : HoraInicial, 'timeEnd' : HoraFinal, 'NumeroNotif': count_notificacoes(func_id=request.session['funcID']), 'e_id' : 3, 'Pagina' : "Estatísticas",
    'time_min' : time_min, 'time_max' : time_max, 'restaurante_comp' : restaurante_comp, 'res_id2' : res_id2, 
    'tam' : len(restaurante_comp), 'ylabel' : 'Média em minutos', 'xlabel' : k[2], 'titulo' : "Tempo médio que os clientes permanencem no restaurante"
    })
