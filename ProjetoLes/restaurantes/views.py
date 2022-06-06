from asyncio.windows_events import NULL
import os
from django.http import HttpResponse
from operator import truediv
from django.shortcuts import redirect, render
from .models import *
from .forms import *
from django.views.generic import ListView
from django.core.paginator import Paginator
from django.db.models.functions import Lower
from .filters import *
from .decorators import *
from notificacoes.views import count_notificacoes
from datetime import datetime


def pagina_redirect(request):
    return redirect('../funcionarios/Login')


def handle_not_found(request, exception):
    return render(request, 'restaurantes/notfound.html')

def checkuser(restauranteid, userid):
    restaurante = Restaurante.objects.get(id=restauranteid)
    if restaurante.funcionarioid.id != userid:
        return False
    return True

##############################################################################################################################
#########                                                                                                            #########
#########                                              Homepage                                                      #########
#########                                                                                                            #########
##############################################################################################################################
@IsLoggedIn
@allowed_users(allowed_user=[1])
def homepage(request):

    return render(request = request, 
    template_name="restaurantes/home.html",
    context={'NumeroNotif': count_notificacoes(func_id=request.session['funcID']), 'Pagina' : "Página Inicial"}
    )


class ContactListView(ListView):
    paginate_by = 2
    model = Restaurante

##############################################################################################################################
#########                                                                                                            #########
#########                                        Visualizar Restaurantes                                             #########
#########                                                                                                            #########
##############################################################################################################################
@IsLoggedIn
@allowed_users(allowed_user=[1])
def VisualizarRestaurantes(request):
    func_id = request.session['funcID']
    func = Funcionario.objects.filter(id=func_id).first()
    restaurantes = Restaurante.objects.filter(funcionarioid=func).exclude(estado="por pagar")
    dir = 0
    message = ""

    if 'message' in request.session:
        message = request.session['message']
        del request.session['message']
    order_by = request.GET.get("order_by", "id")
    dir = request.GET.get("direction", "0")
   
    if order_by == "cidade" and dir == "0":
        restaunrantes = restaurantes.order_by('cidade', 'distrito')

    if order_by == "cidade" and dir == "1":
        restaunrantes = restaurantes.order_by('-cidade', '-distrito')

    elif dir=="1":
        restaunrantes = restaurantes.order_by("-" + order_by)
    else:
        restaunrantes = restaurantes.order_by(order_by)
    
    myFilter = RestaurantesFilter(request.GET, queryset=restaunrantes)
    restaunrantes = myFilter.qs
    
    paginator = Paginator(restaunrantes, 5) 
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)

    return render(request, 'restaurantes/Restaurantes.html', {"restaurante" : Restaurante.objects.all, 'page_obj': page_obj,
    'message' : message, 'myFilter' : myFilter, 'nome': request.GET.get("nome", ""),
    'numerotelefone': request.GET.get("numerotelefone", ""), 'cidade' : request.GET.get("cidade", ""), 'dir' : dir, 'Pagina' : "Visualizar Restaurantes",
    'NumeroNotif': count_notificacoes(func_id=request.session['funcID'])
    })


##############################################################################################################################
#########                                                                                                            #########
#########                                             Editar Restaurante                                             #########
#########                                                                                                            #########
##############################################################################################################################
@IsLoggedIn
@allowed_users(allowed_user=[1])
def EditarRestaurante(request, res_id):
    if not checkuser(res_id, request.session['funcID']):
        return redirect('Login')
    restaurante = Restaurante.objects.filter(id=res_id).first()
    form_restaurante = RestauranteForm(instance=restaurante)
 
    if request.method == 'POST':
        k = request.POST.get("chec", 0)
        form_restaurante = EditForm(request.POST, request.FILES, instance=restaurante, res=restaurante)
        if form_restaurante.is_valid():
            if len(request.FILES) != 0:
                
                restaurante = Restaurante.objects.filter(id=res_id).first()
                #if len(restaurante.imagem) > 0:
                    #os.remove(restaurante.imagem.path)
                form = form_restaurante.save(commit = False)
            if k == "on":
                print("hey")
                form = form_restaurante.save(commit = False)
                form.abertura_tarde = None
                form.fecho_tarde = None
                form.save()
            else:
                form = form_restaurante.save(commit = False)
            codigo = form.codigo
            codigos = codigo.split("-")
            parte1 = int(codigos[0])
            parte2 = int(codigos[1])
            codigo_postal = Codigos_postais_parcial.objects.filter(num_cod_postal=parte1, ext_cod_postal=parte2).first()
            form.cidade = codigo_postal.nome_localidade
            cod_d = codigo_postal.cod_distrito
            distrito = Distritos.objects.filter(cod_distrito = cod_d).first()
            form.distrito = distrito.nome_distrito
            form.save()

            tipo = Tipofuncionario.objects.filter(id=1).first()
            notifica = Notificacao.objects.filter(id=2).first()
            funcionario_atual = Funcionario.objects.filter(id=request.session['funcID']).first()
            nova_notificacao = FuncionarioNotificacao(funcionarioid_recetor=funcionario_atual, funcionarioid=request.session['funcID'],  notificacaoid=notifica, visto=0, data=datetime.now(), nomerestaurante = form.nome)
            nova_notificacao.save()
            request.session['message'] = "Restaurante editado com sucesso"
            return redirect('VisualizarRestaurantes')

    context = {'form': form_restaurante, 'ModalTitulo': "Cancelar a edição do restaurante", 'ModalFrase': "Deseja mesmo cancelar a edição do restaurante?", 'ch' : 1,
    'Titulo': "Editar restaurante", 'Verbo' : "Atualizar",'edit' : 1, "imagem" : restaurante.imagem, 'Pagina' : "Editar Restaurantes", 'NumeroNotif': count_notificacoes(func_id=request.session['funcID'])}
    return render(request, 'restaurantes/Criar_Restaurante.html', context)



@IsLoggedIn
@allowed_users(allowed_user=[1])
def Restaurante_info(request, id_res):
    if not checkuser(id_res, request.session['funcID']):
        return redirect('Login')
   
    request.session['id_res'] = id_res
    restaurante = Restaurante.objects.filter(id=id_res).first()
   
    return render(request, 'restaurantes/Restaurante_info.html', { "id_res": id_res,
    'NumeroNotif': count_notificacoes(func_id=request.session['funcID']), 'restaurante' : restaurante, "imagem" : restaurante.imagem})


##############################################################################################################################
#########                                                                                                            #########
#########                                               Visualizar Salas                                             #########
#########                                                                                                            #########
##############################################################################################################################
@IsLoggedIn
@allowed_users(allowed_user=[1])
def VisualizarSalas(request, id_res):
    if not checkuser(id_res, request.session['funcID']):
        return redirect('Login')
    message = ""

    if 'message' in request.session:
        message = request.session['message']
        del request.session['message']
    request.session['id_res'] = id_res
    zonas = Sala.objects.filter(restauranteid=id_res)
    res = Restaurante.objects.filter(id=id_res).values_list('nome', flat=True).first()
    paginator = Paginator(zonas, 5) # Show 25 contacts per page.

    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
   
   
    return render(request, 'restaurantes/Restaurante.html', {"zonas" : Sala.objects.all, 'page_obj': page_obj, "res" : res, "id_res": id_res, 'Pagina' : "Visualizar Salas",
    'NumeroNotif': count_notificacoes(func_id=request.session['funcID']), 'message' : message})



##############################################################################################################################
#########                                                                                                            #########
#########                                                Criar Sala                                                  #########
#########                                                                                                            #########
##############################################################################################################################
@IsLoggedIn
@allowed_users(allowed_user=[1])
def Salas(request):

    form_restaurantesalaform = RestauranteSalaForm()
    id_res = request.session['id_res']
    s = False

    
    if request.method == "POST":
        form_restaurantesalaform = RestauranteSalaForm(request.POST)
       
        if form_restaurantesalaform.is_valid():
            res = Restaurante.objects.filter(id=id_res).first()
            fumador = request.POST.get("fumador", "")
         
            if fumador == "on":
                fumador = 1
            else:
                fumador = 0
 
            blog_obj = Sala(restauranteid=res, nomesala=request.POST.get("nomesala", ""), capacidade=request.POST.get("capacidade", ""), tiposala=request.POST.get("tiposala", ""), fumador=fumador )
            blog_obj.save()
            return redirect('http://127.0.0.1:8000/restaurantes/Restaurante_info/'+ id_res) 
            
        else:
            s = True
            return render(request, "restaurantes/Criar_Salas.html",
            context={"sala" : Sala.objects.all, 'form':form_restaurantesalaform, 's':s}
            ) 
       
    return render(request, "restaurantes/Criar_Salas.html",
    context={"sala" : Sala.objects.all, 'form':form_restaurantesalaform, 's':s, 'id_res' : id_res, 'Pagina' : "Criar Sala", 
    'NumeroNotif': count_notificacoes(func_id=request.session['funcID'])})



##############################################################################################################################
#########                                                                                                            #########
#########                                             Eliminar Sala                                                  #########
#########                                                                                                            #########
##############################################################################################################################
@IsLoggedIn
@allowed_users(allowed_user=[1])
def Delete_Sala(request, id_sala):
    sala = Sala.objects.filter(id=id_sala).first()
    id_res = sala.restauranteid.id
    if not checkuser(id_res, request.session['funcID']):
        return redirect('Login')
    sala.delete()
    request.session['message'] = "Sala eliminada com sucesso"

    return redirect('http://127.0.0.1:8000/restaurantes/Restaurante_info/' + str(id_res))


##############################################################################################################################
#########                                                                                                            #########
#########                                                Editar Sala                                                 #########
#########                                                                                                            #########
##############################################################################################################################
@IsLoggedIn
@allowed_users(allowed_user=[1])
def Sala_editar(request, id_sala):
    
    id_res = request.session['id_res']
    if not checkuser(id_res, request.session['funcID']):
        return redirect('Login')

    sala = Sala.objects.filter(id=id_sala).first()
    form_restaurantesalaform = RestauranteSalaForm(instance=sala)

    if request.method == 'POST':
        form_restaurantesalaform = EditFormSala(request.POST, instance=sala, sala=sala)
        if form_restaurantesalaform.is_valid():
            form_restaurantesalaform.save()
            request.session['message'] = "Restaurante editado com sucesso"
            return redirect('http://127.0.0.1:8000/restaurantes/Restaurante_info/' + id_res)

    context = {'form': form_restaurantesalaform, 'id_res' : id_res, 'Pagina' : "Editar Sala", 'NumeroNotif': count_notificacoes(func_id=request.session['funcID'])}
    return render(request, 'restaurantes/Editar_sala.html', context)



##############################################################################################################################
#########                                                                                                            #########
#########                                            Visualizar Mesas                                                #########
#########                                                                                                            #########
##############################################################################################################################
@IsLoggedIn
@allowed_users(allowed_user=[1])
def VisualizarMesas(request, id_sala):
    if 'id_res' in request.session and 'id_res' == None:
        return redirect('VisualizarRestaurantes')
    elif 'id_res' not in request.session:
        return redirect('VisualizarRestaurantes')
   
    id_res = request.session['id_res']
    if not checkuser(id_res, request.session['funcID']):
        return redirect('Login')
    request.session['id_sala'] = id_sala

    mesas = Mesa.objects.filter(salaid=id_sala)
    sala = Sala.objects.filter(id=id_sala).values_list('nomesala', flat=True).first()
    message = ""
    if 'message' in request.session:
        message = request.session['message']
        del request.session['message']

    res = Restaurante.objects.filter(id=id_res).values_list('nome', flat=True).first()


    myFilter = Mesas2Filter(request.GET, queryset=mesas)
    mesas = myFilter.qs
    paginator = Paginator(mesas, 5) # Show 25 contacts per page.

    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
   
   
    return render(request, 'restaurantes/Mesas.html', {"zonas" : Sala.objects.all, 'message' : message, 'page_obj': page_obj, "sala" : sala, "res": res, 
    "id_res": id_res, "sala_id" : id_sala, 'Pagina' : "Visualizar Mesas", 'NumeroNotif': count_notificacoes(func_id=request.session['funcID']),
     'numero': request.GET.get("numero", ""),  'capacidade': request.GET.get("capacidade", ""), 'capacidade_max': request.GET.get("capacidade_max", "")})



##############################################################################################################################
#########                                                                                                            #########
#########                                                 Criar Mesa                                                 #########
#########                                                                                                            #########
##############################################################################################################################
@IsLoggedIn
@allowed_users(allowed_user=[1])
def CriarMesa(request, id_sala): 

    formCreateMesa = CreateMesa()
    request.session['id_sala'] = id_sala
    sala = Sala.objects.get(id=id_sala)
    id_res = sala.restauranteid.id
    if not checkuser(id_res, request.session['funcID']):
        return redirect('Login')

    if request.method == "POST":

        sala = Sala.objects.filter(id=id_sala).first()
        cap_max = sala.capacidade
       
        mesas = Mesa.objects.filter(salaid=id_sala)
        count = 0
        for mesa in mesas:
            count += mesa.maximopessoas
       
        formCreateMesa = CreateMesa(request.POST, salaID=id_sala, capMax=cap_max, capAtu=count)


        if formCreateMesa.is_valid():
            numero = request.POST.get("numero", "")
            maximopessoas = request.POST.get("maximopessoas", "")
            posicaox = request.POST.get("posicaox", "")
            posicaoy = request.POST.get("posicaoy", "")
            posicaox1 = request.POST.get("posicaox1", "")
            posicaoy1 = request.POST.get("posicaoy1", "")
            
                
            
            sala_id = Sala.objects.filter(id=id_sala).first()
            NewMesa = Mesa(salaid=sala_id, numero=numero, maximopessoas=maximopessoas, 
            limpeza=1, ocupada=0, reservada = 0, posicaox=posicaox, posicaoy=posicaoy, posicaox1=posicaox1, posicaoy1=posicaoy1 )
            NewMesa.save()
            MesaID = Mesa.objects.filter(id=NewMesa.id).first()
            for x in range(0, int(maximopessoas)):
                NewCadeira = Cadeira(mesaid = MesaID, ocupado=0)
                NewCadeira.save()

            request.session['message'] = "Mesa criada com sucesso"
            return redirect('VisualizarMesas', str(id_sala))
        
    return render(request, "restaurantes/Criar_Mesa.html",
    context={"restaurante" : Restaurante.objects.all, 'form':formCreateMesa, 'id_sala': id_sala, 'Pagina' : "Criar Mesa",
    'NumeroNotif': count_notificacoes(func_id=request.session['funcID'])}
)


##############################################################################################################################
#########                                                                                                            #########
#########                                              Eliminar Mesa                                                 #########
#########                                                                                                            #########
##############################################################################################################################
@IsLoggedIn
@allowed_users(allowed_user=[1])
def EliminarMesa(request, id_mesa): 

    if 'id_sala' in request.session:
        id_sala = request.session['id_sala']
    else:
        return redirect('VisualizarRestaurantes')
    if 'id_sala' == "None":
        return redirect('VisualizarRestaurantes')
    mesa = Mesa.objects.get(id=id_mesa)
    id_res = mesa.salaid.restauranteid.id
    if not checkuser(id_res, request.session['funcID']):
        return redirect('Login')
    Mesa.objects.filter(id=id_mesa).delete()
    request.session['message'] = "Mesa eliminada com sucesso"
       
    return redirect('VisualizarMesas', str(id_sala))


##############################################################################################################################
#########                                                                                                            #########
#########                                                 Editar Mesa                                                #########
#########                                                                                                            #########
##############################################################################################################################
@IsLoggedIn
@allowed_users(allowed_user=[1])
def EditarMesa(request, id_mesa):

    mesa = Mesa.objects.filter(id=id_mesa).first()
    id_res = mesa.salaid.restauranteid.id
    if not checkuser(id_res, request.session['funcID']):
        return redirect('Login')
    form_mesa = CreateMesa(instance=mesa)

    if 'id_sala' in request.session:
        id_sala = request.session['id_sala']
    else:
        return redirect('VisualizarRestaurantes')

    if request.method == 'POST':
        sala = Sala.objects.filter(id=id_sala).first()
        cap_max = sala.capacidade
        
        mesas = Mesa.objects.filter(salaid=id_sala)
        count = 0
        for mesa in mesas:
            count += mesa.maximopessoas
        mesa = Mesa.objects.filter(id=id_mesa).first()
        form_mesa = EditMesa(request.POST, instance=mesa, mesa=mesa, salaID=id_sala, capMax=cap_max, capAtu=count)
        if form_mesa.is_valid():
            form_mesa.save()
            request.session['message'] = "Mesa editada com sucesso"
            return redirect('VisualizarMesas', str(id_sala))

    context = {'form': form_mesa, 'id_sala' : id_sala, 'Pagina' : "Editar Mesa", 'NumeroNotif': count_notificacoes(func_id=request.session['funcID'])}
    return render(request, 'restaurantes/Editar_Mesa.html', context)


def index(request):
    return HttpResponse("Hello, world. You're at the polls index.")

# Create your views here.
