from asyncio.windows_events import NULL
from django.shortcuts import render
from django.http import HttpResponse
from operator import truediv
from django.shortcuts import redirect, render
from .models import *
from .forms import *
from django.http import HttpResponseRedirect
from django.views.generic import ListView
from django.core.paginator import Paginator
from django.shortcuts import redirect
from django.db.models.functions import Lower
from django.http import HttpResponse
from django.shortcuts import render
from django.http import HttpResponse
from django.shortcuts import render
from .filters import *
from restaurantes.decorators import *
def count_notificacoes(func_id):
    notificacoes = FuncionarioNotificacao.objects.filter(funcionarioid_recetor=func_id, visto=0).count()

    return notificacoes

@IsLoggedIn
def VisualizarNotificacoes2(request):
    order_by = request.GET.get("order_by", "data")
    islogin_ = 0
    if 'isLogin' in request.session:
        islogin_ = request.session['isLogin']

    notificacoes = FuncionarioNotificacao.objects.filter(funcionarioid_recetor=request.session['funcID']).order_by("-" + order_by)
    notificacoesTemplate= []
    for notifi in notificacoes:
        id=str(notifi.notificacaoid)
        print(id)
        id = id.replace("{{mesa_id}}", "2")
        print(id)
        notificacoesTemplate.append(id)
    myFilter = NotificacoesFilter(request.GET, queryset=notificacoes)
    notificacoes = myFilter.qs
    id_bar = request.session['tipofunc']
    paginator = Paginator(notificacoes, 5) 
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    return render(request, 'notificacoes/Visualizar.html', {"restaurante" : Restaurante.objects.all, 'page_obj': page_obj,
     'myFilter' : myFilter, 'nome': request.GET.get("nome", ""), 'noti': notificacoesTemplate, 'tamanho' : len(notificacoesTemplate),
     'NumeroNotif': count_notificacoes(func_id=request.session['funcID']), 'Pagina' : "Notificações", 'id_bar' : id_bar, 'islogin_' : islogin_
    })
@IsLoggedIn
def VerNotificacao(request, not_id):
    order_by = request.GET.get("order_by", "data")
    notif = FuncionarioNotificacao.objects.filter(id=not_id).first()
    if not notif:
        return redirect('VisualizarNotificacoes2')

    if notif.funcionarioid_recetor.id != request.session['funcID']:
        return redirect('VisualizarNotificacoes2')
    notif.visto = 1
    notif.save()
    notificacoes = FuncionarioNotificacao.objects.filter(funcionarioid_recetor=request.session['funcID']).order_by("-" + order_by)
    notificacoesTemplate= []
    for notifi in notificacoes:
        id=str(notifi.notificacaoid)
        print(id)
        id = id.replace("{{mesa_id}}", "2")
        print(id)
        notificacoesTemplate.append(id)
    myFilter = NotificacoesFilter(request.GET, queryset=notificacoes)
    notificacoes = myFilter.qs
    
    paginator = Paginator(notificacoes, 5) 
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
    notif = FuncionarioNotificacao.objects.filter(id=not_id).first()
    Func = Funcionario.objects.filter(id=notif.funcionarioid).first()
    id_bar = request.session['tipofunc']
    return render(request, 'notificacoes/Visualizar_Notificacao.html', {"restaurante" : Restaurante.objects.all, 'page_obj': page_obj,
     'myFilter' : myFilter, 'nome': request.GET.get("nome", ""), 'noti': notificacoesTemplate, 'tamanho' : len(notificacoesTemplate),
     'NumeroNotif': count_notificacoes(func_id=request.session['funcID']), 'Pagina' : "Notificações", 'notif' : notif, 'func' : Func, 'id_bar' : id_bar,
    })


@IsLoggedIn
def VisualizarNotificacoes(request):
    dir = 0
    message = ""

    if 'message' in request.session:
        message = request.session['message']
        del request.session['message']
    order_by = request.GET.get("order_by", "id")
    print(order_by)
    
   
    notificacoes = Notificacao.objects.all().order_by(order_by)
    myFilter = NotificacoesFilter(request.GET, queryset=notificacoes)
    notificacoes = myFilter.qs
    
    paginator = Paginator(notificacoes, 5) 
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    return render(request, 'notificacoes/VisualzarNotificacoes.html', {"restaurante" : Restaurante.objects.all, 'page_obj': page_obj,
    'message' : message, 'myFilter' : myFilter, 'nome': request.GET.get("nome", ""), 'NumeroNotif': count_notificacoes(func_id=request.session['funcID'])
    })

@IsLoggedIn
def CriarNotificacao(request):
    if 'tipofunc' in request.session:
        if request.session['tipofunc'] and request.session['tipofunc'] != 1:
            return redirect('../funcionarios/Login')
    else:
        return redirect('../funcionarios/Login')
    
    print(request.session['tipofunc'])
    form_notificacao = CreateNotificacao()
   
    if request.method == "POST":
        form_notificacao = CreateNotificacao(request.POST)
        if form_notificacao.is_valid():

            #Restaurante.objects.create(**form_restaurante.cleaned_data)
            form_notificacao.full_clean()
            form_notificacao.save()
            request.session['message'] = "Notificação criada com sucesso"
            return redirect('VisualizarNotificacoes')
                  
    return render(request, "notificacoes/CriarNotificacao.html",
    context={"restaurante" : Restaurante.objects.all, 'form':form_notificacao, 'verbo': "Criar", "verbo_cancelar": "criação", "href" : ".",
    'NumeroNotif': count_notificacoes(func_id=request.session['funcID'])})

@IsLoggedIn
def EditarNotificacao(request, notificacao_id):
    if 'tipofunc' in request.session:
        if request.session['tipofunc'] and request.session['tipofunc'] != 1:
            return redirect('../funcionarios/Login')
    else:
        return redirect('../funcionarios/Login')

    notificacao = Notificacao.objects.filter(id=notificacao_id).first()
    form_notificacao = CreateNotificacao(instance=notificacao)

    if request.method == 'POST':
        form_notificacao = EditNotificacaoForm(request.POST, instance=notificacao, notificacao=notificacao)
        if form_notificacao.is_valid():
            form_notificacao.save()
            request.session['message'] = "Notificação editado com sucesso"
            return redirect('VisualizarNotificacoes')

    return render(request, "notificacoes/CriarNotificacao.html",
    context={'form':form_notificacao, 'verbo': "Editar", "verbo_cancelar": "edição", "href" : "../.", 'NumeroNotif': count_notificacoes(func_id=request.session['funcID'])})


def DeleteNotificacao(request, notificacao_id):
    if 'tipofunc' in request.session:
        if request.session['tipofunc'] and request.session['tipofunc'] != 1:
            return redirect('../funcionarios/Login')
    else:
        return redirect('../funcionarios/Login')


    Notificacao.objects.filter(id=notificacao_id).delete()
    request.session['message'] = "Notificação eliminado com sucesso"
       
    return redirect('VisualizarNotificacoes')
