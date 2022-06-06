from asyncio.windows_events import NULL
import os
from django.http import HttpResponse
from operator import truediv
from django.shortcuts import redirect, render
from .models import *
from django.views.generic import ListView
from django.core.paginator import Paginator
from django.db.models.functions import Lower
from .filters import *
from restaurantes.decorators import *
from notificacoes.views import count_notificacoes
from .forms import *
from datetime import datetime
from django.views.generic import ListView, DeleteView, CreateView

def Restaurantes(request):
    islogin_ = 0
    notificacoes_count = 0
    if 'isLogin' in request.session:
        notificacoes_count = count_notificacoes(func_id=request.session['funcID'])
        islogin_ = request.session['isLogin']

    dir = 0
    message = ""

    if 'message' in request.session:
        message = request.session['message']
        del request.session['message']
    order_by = request.GET.get("order_by", "id")
    dir = request.GET.get("direction", "0")
   
    
    if order_by == "rua" and dir == "0":
        restaunrantes = Restaurante.objects.all().order_by('rua', 'numero_andar')
    elif order_by == "codigo" and dir == "0":
        restaunrantes = Restaurante.objects.all().order_by('codigo', 'postal')
    elif order_by == "cidade" and dir == "0":
        restaunrantes = Restaurante.objects.all().order_by('cidade', 'distrito')

    if order_by == "rua" and dir == "1":
        restaunrantes = Restaurante.objects.all().order_by('-rua', '-numero_andar')
    elif order_by == "codigo" and dir == "1":
        restaunrantes = Restaurante.objects.all().order_by('-codigo', '-postal')
    elif order_by == "cidade" and dir == "1":
        restaunrantes = Restaurante.objects.all().order_by('-cidade', '-distrito')

    elif dir=="1":
        restaunrantes = Restaurante.objects.all().order_by("-" + order_by)
    else:
        restaunrantes = Restaurante.objects.all().order_by(order_by)
    
    myFilter = RestaurantesFilter(request.GET, queryset=restaunrantes)
    restaunrantes = myFilter.qs
    
    paginator = Paginator(restaunrantes, 5) 
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    return render(request, 'clientes/Visualizar_Restaurantes.html', {"restaurante" : Restaurante.objects.all, 'page_obj': page_obj,
    'message' : message, 'myFilter' : myFilter, 'nome': request.GET.get("nome", ""),
    'numerotelefone': request.GET.get("numerotelefone", ""), 'cidade' : request.GET.get("cidade", ""), 'dir' : dir, 'Pagina' : "Visualizar Restaurantes"
    ,'NumeroNotif': notificacoes_count, 'islogin' : islogin_})

@IsLoggedIn
def Make_Reserva(request, restaurante_id):
    islogin_ = 0
    notificacoes_count = 0
    if 'isLogin' in request.session:
        notificacoes_count = count_notificacoes(func_id=request.session['funcID'])
        islogin_ = request.session['isLogin']

    restaurante = Restaurante.objects.filter(id=restaurante_id ).first()
    nome_restaurante = restaurante.nome
    request.session['nome_restaurante'] = nome_restaurante
    
    menssagem = ""
    Reserva_form = ReservaForm()
    if 'menssagem' in request.session:
        menssagem =  request.session['menssagem']
        initial_data = {
            'nomecliente': request.session['nomecliente'],
            'telefonecliente' : request.session['telefonecliente'],
            'numeropessoas' :request.session['numeropessoas'],
            'dia' :request.session['dia'],
            'horainicio' : request.session['horainicio'],
            'nota': request.session['nota'],
            'NrPasso':request.session['NrPasso'],
            'sala':request.session['Tipo_sala'],
        }
        Reserva_form = ReservaForm(initial = initial_data)
        del request.session['menssagem']
    now = datetime.now()
    current_time = now.strftime("%H:%M:%S")
    if request.method == "POST":
        Reserva_form = ReservaForm(request.POST, now_time = current_time )
        if Reserva_form.is_valid():
            print(Reserva_form.cleaned_data)
            reserva = Reserva_form.save(commit=False)
            request.session['nomecliente'] = request.POST.get("nomecliente", "")
            request.session['telefonecliente'] = request.POST.get("telefonecliente", "")
            request.session['numeropessoas'] = request.POST.get("numeropessoas", "")
            request.session['dia'] = request.POST.get("dia", "")
            request.session['horainicio'] = request.POST.get("horainicio", "")
            request.session['nota'] = request.POST.get("nota", "")
            request.session['NrPasso'] = 1
            request.session['Tipo_sala'] = request.POST.get("sala", "")
            return redirect('../Make_reserva_passo2/' + str(restaurante_id))
        else:
            return render(request, "clientes/criar_reserva.html", context={'reserva': Reserva.objects.all, 'form': Reserva_form, 'menssagem': menssagem})
    return render(request, "clientes/criar_reserva.html", context={'reserva': Reserva.objects.all, 'form': Reserva_form,
    'NumeroNotif': count_notificacoes(func_id=request.session['funcID']), 'nome_restaurante' : nome_restaurante, 'menssagem': menssagem, 'Pagina' : "Criar Reserva",'NumeroNotif': notificacoes_count, 'islogin' : islogin_})

@IsLoggedIn
def Make_reserva_passo2(request, restaurante_id):
    islogin_ = 0
    notificacoes_count = 0
    if 'isLogin' in request.session:
        notificacoes_count = count_notificacoes(func_id=request.session['funcID'])
        islogin_ = request.session['isLogin']
    if  request.session['NrPasso'] != 1:
        return redirect('Make_reserva/' + str(restaurante_id))
    
    restaurante = Restaurante.objects.filter(id=restaurante_id ).first()
    nome_restaurante = restaurante.nome
    request.session['nome_restaurante'] = nome_restaurante

    sala = request.session['Tipo_sala']
    restaurante = Restaurante.objects.filter(id = restaurante_id).first()
    if sala == "1":
        salas = Sala.objects.filter(restauranteid = restaurante,tiposala = "Exterior", fumador = 1)
    elif sala == "2":
        salas = Sala.objects.filter(restauranteid = restaurante,tiposala = "Exterior",fumador = 0)
    else:
        salas = Sala.objects.filter(restauranteid = restaurante,tiposala = "Interior")
    mesas_disponiveis=[]
    for i in salas:
        mesas = Mesa.objects.filter(salaid = i)
        for mesa in mesas:
            mesas_disponiveis.append(mesa)
            reservas = Reserva.objects.filter(dia = request.session['dia'], mesaid=mesa)
            count=0
            if mesa.maximopessoas < int(request.session['numeropessoas']) or int(request.session['numeropessoas']) + 3 < mesa.maximopessoas:
                mesas_disponiveis.pop()
            
            else:
                for reserva in reservas:
                    time_zero = datetime.strptime('00:00:00', '%H:%M:%S')
                    reserva_horainicio = datetime.strptime(str(reserva.horainicio), '%H:%M:%S')
                    tempo1 = datetime.strptime('01:30:00', '%H:%M:%S')
                    tempo2 = (reserva_horainicio  - time_zero + tempo1).time()

                    hora_inicio = datetime.strptime(str(request.session['horainicio'] + ':00'), '%H:%M:%S')
                    tempo3 =  (hora_inicio - time_zero + tempo1).time()

                    if hora_inicio.time() == reserva_horainicio.time():
                        mesas_disponiveis.pop()

                    elif hora_inicio.time() > reserva_horainicio.time() and hora_inicio.time() < tempo2:
                        mesas_disponiveis.pop()
                    
                    elif tempo3 > reserva_horainicio.time() and tempo3 < tempo2:
                        mesas_disponiveis.pop()
    if len(mesas_disponiveis )== 0:
        request.session['menssagem'] = "nao existem mesas disponiveis"
        return redirect('../Make_Reserva/' + str(restaurante_id))
    if request.method == "POST":
        mesa = request.POST.get("mesaid", "")
        mesita = Mesa.objects.filter(id=mesa).first()
        res = Restaurante.objects.filter(id=restaurante_id).first()
        reserva = Reserva(nomecliente =  request.session['nomecliente'],telefonecliente = request.session['telefonecliente'],numeropessoas = request.session['numeropessoas'], 
        dia =request.session['dia'], horainicio = request.session['horainicio'], nota =request.session['nota'],mesaid = mesita, restauranteid = res, clienteid=request.session['funcID'])
        reserva.save()
        request.session['message'] = "Reserva criada com sucesso"
        return redirect('Ver_Reservas')
    return render(request, "clientes/escolher_mesa.html", context={'reserva': Reserva.objects.all, 'mesas': mesas_disponiveis,
    'NumeroNotif': count_notificacoes(func_id=request.session['funcID']), 'Pagina' : "Criar Reserva", 'nome_restaurante':nome_restaurante, 'NumeroNotif': notificacoes_count, 'islogin' : islogin_})

@IsLoggedIn
def Ver_Reservas(request): 
    tw = Pedido.objects.filter(reservaid__isnull = False,takeaway = 1)
    take_away = []
    for t in tw:
        take_away.append(t.reservaid.id)
    islogin_ = 0
    notificacoes_count = 0
    if 'isLogin' in request.session:
        notificacoes_count = count_notificacoes(func_id=request.session['funcID'])
        islogin_ = request.session['isLogin']
    
    dir = 0
    message = ""

    if 'message' in request.session:
        message = request.session['message']
        del request.session['message']
    order_by = request.GET.get("order_by", "id")
    dir = request.GET.get("direction", "0")
    
    if dir=="1":
        reservas = Reserva.objects.all().filter(clienteid=request.session['funcID']).order_by("-" + order_by)
        reservas = reservas.exclude(id__in=take_away)
    else:
        reservas = Reserva.objects.all().filter(clienteid=request.session['funcID']).order_by(order_by)
        reservas = reservas.exclude(id__in=take_away)
    
    myFilter = ReservasFiler(request.GET, queryset=reservas)
    reservas = myFilter.qs
    restaurantes=Restaurante.objects.all()
    myFilter = RestaurantesFilter(request.GET, queryset=restaurantes)
    restaurantes = myFilter.qs

    reservas_2 = []
    true = False
    for reserva_t in reservas:
        for restaurante in restaurantes:
            if restaurante.id == reserva_t.restauranteid.id:
                true= True
        if true:
            reservas_2.append(reserva_t)
        true=False


    paginator = Paginator(reservas_2, 5) 
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    return render(request, 'clientes/Visualizar_Reservas.html', {'page_obj': page_obj,
    'message' : message, 'myFilter' : myFilter, 'restauranteid': request.GET.get("restauranteid", ""),
    'Dia': request.GET.get("Dia", ""), 'dir' : dir, 'Pagina' : "Visualizar Reservas", 'DataFim' : request.GET.get("DataFim", ""),
    'DataInicio' : request.GET.get("DataInicio", ""), "nome" : request.GET.get("nome", ""),
    'NumeroNotif': count_notificacoes(func_id=request.session['funcID']),'NumeroNotif': notificacoes_count, 'islogin' : islogin_
    })

@IsLoggedIn
def EliminarReserva(request, reserva_id):   
    reserva = Reserva.objects.filter(id=reserva_id).first()
    if reserva.clienteid == request.session['funcID']:
        reserva.delete()
        request.session['message'] = "Reserva eliminada com sucesso"
    return redirect('Ver_Reservas')   

@IsLoggedIn
def EditarReserva(request, reserva_id):
    islogin_ = 0
    message = ""
    notificacoes_count = 0
    if 'isLogin' in request.session:
        notificacoes_count = count_notificacoes(func_id=request.session['funcID'])
        islogin_ = request.session['isLogin']
    now = datetime.now()
    current_time = now.strftime("%H:%M:%S")
    menssagem = ""
    editReserva = Reserva.objects.filter(id=reserva_id).first()
    form_reserva = ReservaForm(instance=editReserva)
    if request.method == 'POST':
        form_reserva = EditFormReserva(request.POST, instance=editReserva, now_time = current_time)
        if form_reserva.is_valid():
            form_reserva.save()
            request.session['message'] = "Reserva editada com sucesso"
            return redirect('Ver_Reservas')
    return render(request, "clientes/Editar_reserva.html", context={'reserva': Reserva.objects.all, 'form': form_reserva,
    'NumeroNotif': count_notificacoes(func_id=request.session['funcID']), 'message': message, 'Pagina' : "Editar Reserva", 'NumeroNotif': notificacoes_count, 'islogin' : islogin_})

@IsLoggedIn
def Make_TakeAway(request, restaurante_id):
    islogin_ = 0
    notificacoes_count = 0
    if 'isLogin' in request.session:
        notificacoes_count = count_notificacoes(func_id=request.session['funcID'])
        islogin_ = request.session['isLogin']

    menssagem = ""
    takeAway_form = TakeAway_Form()
    if 'menssagem' in request.session:
        menssagem =  request.session['menssagem']
        initial_data = {
            'nomecliente': request.session['nomecliente'],
            'telefonecliente' : request.session['telefonecliente'],
            'numeropessoas' :request.session['numeropessoas'],
            'dia' :request.session['dia'],
            'nota': request.session['nota'],
            'NrPasso':request.session['NrPasso'],
        }
        takeAway_form = TakeAway_Form(initial = initial_data)
        del request.session['menssagem']
    now = datetime.now()
    current_time = now.strftime("%H:%M:%S")
    if request.method == "POST":
        takeAway_form = TakeAway_Form(request.POST, now_time = current_time )
        if takeAway_form.is_valid():
            print(takeAway_form.cleaned_data)
            res = Restaurante.objects.filter(id=restaurante_id).first()
            mesita = Mesa.objects.filter(id=0).first()
            request.session['nomecliente'] = request.POST.get("nomecliente", "")
            request.session['telefonecliente'] = request.POST.get("telefonecliente", "")
            request.session['dia'] = request.POST.get("dia", "")
            request.session['horainicio'] = request.POST.get("horainicio", "")
            request.session['nota'] = request.POST.get("nota", "")
            request.session['NrPasso'] = 1
            reserva = Reserva(nomecliente =  request.session['nomecliente'],telefonecliente = request.session['telefonecliente'], 
            dia =request.session['dia'], horainicio = request.session['horainicio'], nota =request.session['nota'],mesaid = mesita, restauranteid = res, clienteid=request.session['funcID'])
            reserva.save()
            request.session['reserva_id'] = reserva.id
            return redirect('../CreatePedido_takeAway/' + str(restaurante_id))
        else:
            return render(request, "clientes/criar_takeAway.html", context={'reserva': Reserva.objects.all, 'form': takeAway_form, 'menssagem': menssagem})
    return render(request, "clientes/criar_takeAway.html", context={'reserva': Reserva.objects.all, 'form': takeAway_form,
    'NumeroNotif': count_notificacoes(func_id=request.session['funcID']), 'menssagem': menssagem, 'Pagina' : "Criar Reserva de TakeAway",'NumeroNotif': notificacoes_count, 'islogin' : islogin_})

@IsLoggedIn
def CreatePedido_takeAway(request, restaurante_id):
    preco = 0
    mensagem =""
    islogin_ = 0
    notificacoes_count = 0
    if 'isLogin' in request.session:
        notificacoes_count = count_notificacoes(func_id=request.session['funcID'])
        islogin_ = request.session['isLogin']

    res = Restaurante.objects.filter(id=restaurante_id).first()

    menu = Menurestaurante.objects.filter(restauranteid=res).first()
    menu = Menurestaurante.objects.filter(id=1).first()
    menu = Menurestaurante.objects.filter(restauranteid=restaurante_id, estadosmenuid=1).first()
    produtos = ProdutoMenurestaurante.objects.filter(menurestauranteid=menu)

    date =  Reserva.objects.filter(dia=request.session['dia']).first()
    date = date.dia
    time =  Reserva.objects.filter(horainicio=request.session['horainicio']).first()
    time = time.horainicio
    combined =datetime.strptime(str(date)+" "+str(time), "%Y-%m-%d %H:%M:%S")
    #combined = datetime.combine(date, time)

    entradas = set()
    for prod in produtos:
        if prod.produtoid.tipoprodutoid == Tipoproduto.objects.get(id=1):
            entradas.add(prod.produtoid)

    pratos = set()
    for prod in produtos:
        if prod.produtoid.tipoprodutoid == Tipoproduto.objects.get(id=2):
            pratos.add(prod.produtoid)

    sobremesas = set()
    for prod in produtos:
        if prod.produtoid.tipoprodutoid == Tipoproduto.objects.get(id=3):
            sobremesas.add(prod.produtoid)

    bebidas = set()
    for prod in produtos:
        if prod.produtoid.tipoprodutoid == Tipoproduto.objects.get(id=4):
            bebidas.add(prod.produtoid)

    rest = Restaurante.objects.filter(id=restaurante_id).first()
    reservas = Reserva.objects.filter(restauranteid=rest)

    if request.method == 'POST':
        passt = False
        rersid= int(request.POST.get("reserva", 0))
        reserva = Reserva.objects.filter(id=rersid).first()

        pedido = Pedido(reservaid=reserva)
        pedido.precototal = 0
        pedido.takeaway = 1
        pedido.save()
        for ent in entradas:
            k = ent.id
            t = request.POST.get(str(ent.id), "0")
            #print(t)
            if int(t) != 0:
                passt = True

                NovoProdutoPedido = ProdutoPedido(produtoid=ent, pedidoid=pedido, quantidade=int(t))
                preco += ent.preco*int(t)
                NovoProdutoPedido.save()
        for ent in pratos:
            k = ent.id
            t = request.POST.get(str(ent.id), "0")
            #print(t)
            if int(t) != 0:
                passt = True
                NovoProdutoPedido = ProdutoPedido(produtoid=ent, pedidoid=pedido, quantidade=int(t))
                preco += ent.preco*int(t)
                NovoProdutoPedido.save()
        for ent in sobremesas:
            k = ent.id
            t = request.POST.get(str(ent.id), "0")
            #print(t)
            if int(t) != 0:
                passt = True
                NovoProdutoPedido = ProdutoPedido(produtoid=ent, pedidoid=pedido, quantidade=int(t))
                preco += ent.preco*int(t)
                NovoProdutoPedido.save()
        for ent in bebidas:
            k = ent.id
            t = request.POST.get(str(ent.id), "0")
            #print(t)
            if int(t) != 0:
                passt = True
                NovoProdutoPedido = ProdutoPedido(produtoid=ent, pedidoid=pedido, quantidade=int(t))
                preco += ent.preco*int(t)
                NovoProdutoPedido.save()
        if passt:
            pedido.precototal += preco
            pedido.funcionarioid = Funcionario.objects.get(id =request.session['funcID'])
            pedido.reservaid = Reserva.objects.get(id=request.session['reserva_id'])
            pedido.dataabertura = combined
            pedido.dataabertura__hour = combined.hour
            pedido.dataabertura__minute = combined.minute
            pedido.save()
            request.session['message'] = "Reserva de Take Away criado com sucesso "
            return redirect('Ver_take_aways')
        else:
            mensagem = "Não podes ter um pedido vazio"
            pedido.delete()
    return render(request, 'clientes/criar_takeAway_pedido.html', {"apedidos" : Pedido.objects.all, 'entradas' : entradas, 'pratos' : pratos,
    'sobremesas' : sobremesas, 'mensagem' : mensagem, 'bebidas' : bebidas, 'reservas' : reservas, 'restaurante_id' : res, 'NumeroNotif': notificacoes_count, 'islogin' : islogin_})

@IsLoggedIn
def Ver_take_aways(request): 
    message = ""
    if 'message' in request.session:
        message = request.session['message']
        del request.session['message']
    tw = Pedido.objects.filter(reservaid__isnull = False,takeaway = 1)
    take_away = []
    for t in tw:
        take_away.append(t.reservaid.id)
    reservas = Reserva.objects.filter(id__in= take_away)

    islogin_ = 0
    notificacoes_count = 0
    if 'isLogin' in request.session:
        notificacoes_count = count_notificacoes(func_id=request.session['funcID'])
        islogin_ = request.session['isLogin']

    paginator = Paginator(tw, 5) 
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    return render(request, 'clientes/Visualizar_takeaway.html', {'message':message,'page_obj': page_obj,
    'restauranteid': request.GET.get("restauranteid", ""),
    'Dia': request.GET.get("Dia", ""), 'dir' : dir, 'Pagina' : "Visualizar Reservas", 'DataFim' : request.GET.get("DataFim", ""),
    'DataInicio' : request.GET.get("DataInicio", ""), "nome" : request.GET.get("nome", ""),
    'NumeroNotif': count_notificacoes(func_id=request.session['funcID']),'NumeroNotif': notificacoes_count, 'islogin' : islogin_
    })
@IsLoggedIn
def Takeaway_info(request, id_pedido):
    islogin_ = 0
    notificacoes_count = 0
    if 'isLogin' in request.session:
        notificacoes_count = count_notificacoes(func_id=request.session['funcID'])
        islogin_ = request.session['isLogin']
   
    request.session['id_pedido'] = id_pedido
    pedido = Pedido.objects.filter(id=id_pedido).first()
    produtos = ProdutoPedido.objects.filter(pedidoid=pedido)
   
    return render(request, 'clientes/takeaway_info.html', { "id_pedido": id_pedido,
    'NumeroNotif': count_notificacoes(func_id=request.session['funcID']),'produtos' : produtos, 'pedido' : pedido, 'NumeroNotif': notificacoes_count, 'islogin' : islogin_})

@IsLoggedIn
def EliminarTakeAway(request, id_pedido):
    pedido = Pedido.objects.filter(id=id_pedido)
    print(id_pedido)
    #if pedido.funcionarioid == request.session['funcID']:
    pedido.delete()
    request.session['message'] = "Reserva de Take Away eliminada com sucesso"
    return redirect('Ver_take_aways')

@IsLoggedIn
def EditarTakeAway(request, id_pedido):
    return True

