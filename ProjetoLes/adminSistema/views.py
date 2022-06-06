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
    return redirect('../adminSistema/Login')


def handle_not_found(request, exception):
    return render(request, 'adminSistema/notfound.html')

##############################################################################################################################
#########                                                                                                            #########
#########                                              Homepage                                                      #########
#########                                                                                                            #########
##############################################################################################################################
@IsLoggedIn
@allowed_users(allowed_user=[7])
def AdminSistemaHomepage(request):

    return render(request = request, 
    template_name="adminSistema/home.html",
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
@allowed_users(allowed_user=[7])
def VerRestaurantes(request):

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

    return render(request, 'adminSistema/Restaurantes.html', {"restaurante" : Restaurante.objects.all, 'page_obj': page_obj,
    'message' : message, 'myFilter' : myFilter, 'nome': request.GET.get("nome", ""),
    'numerotelefone': request.GET.get("numerotelefone", ""), 'cidade' : request.GET.get("cidade", ""), 'dir' : dir, 
    'estado':  request.GET.get("estado", ""),'Pagina' : "Visualizar Restaurantes",
    'NumeroNotif': count_notificacoes(func_id=request.session['funcID'])
    })


@IsLoggedIn
@allowed_users(allowed_user=[7])
def Info_Restaurante(request, id_res):
   
    request.session['id_res'] = id_res
    restaurante = Restaurante.objects.filter(id=id_res).first()
   
    return render(request, 'adminSistema/Restaurante_info.html', { "id_res": id_res,
    'NumeroNotif': count_notificacoes(func_id=request.session['funcID']), 'restaurante' : restaurante, "imagem" : restaurante.imagem})


##############################################################################################################################
#########                                                                                                            #########
#########                                              Criar Restaurante                                             #########
#########                                                                                                            #########
##############################################################################################################################
@IsLoggedIn
@allowed_users(allowed_user=[7])
def CriarRestaurante(request):
    form_restaurante = RestauranteForm()
   
    if request.method == "POST":
        form_restaurante = RestauranteForm(request.POST, request.FILES)
        if form_restaurante.is_valid():
            form_restaurante.full_clean()
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
            form.estado = "inativo"
            form.save()
            
            tipo = Tipofuncionario.objects.filter(id=7).first()
            funcionarios = Funcionario.objects.filter(tipofuncionarioid=tipo)
            notifica = Notificacao.objects.filter(id=1).first()
            for func in funcionarios:
                nova_notificacao = FuncionarioNotificacao(funcionarioid_recetor=func, funcionarioid=request.session['funcID'],  notificacaoid=notifica, visto=0, data=datetime.now(), nomerestaurante = form.nome)
                nova_notificacao.save()
    

            request.session['message'] = "Restaurante criado com sucesso"
            return redirect('VerRestaurantes')

    context={"restaurante" : Restaurante.objects.all, 'form':form_restaurante, 'ModalTitulo': "Cancelar a criação do restaurante", 
    'ModalFrase': "Deseja mesmo cancelar a criação do restaurante?", 'Titulo': "Criar restaurante", 'Verbo' : "Criar", 'Pagina' : "Criar Restaurante",
    'NumeroNotif': count_notificacoes(func_id=request.session['funcID']), 'ch' : 0, 'edit' : 0}
    return render(request, "adminSistema/Criar_Restaurante.html",context)

##############################################################################################################################
#########                                                                                                            #########
#########                                             Editar Restaurante                                             #########
#########                                                                                                            #########
##############################################################################################################################
@IsLoggedIn
@allowed_users(allowed_user=[7])
def RestauranteEditar(request, res_id):
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

            tipo = Tipofuncionario.objects.filter(id=7).first()
            funcionarios = Funcionario.objects.filter(tipofuncionarioid=tipo)
            notifica = Notificacao.objects.filter(id=2).first()
            for func in funcionarios:
                nova_notificacao = FuncionarioNotificacao(funcionarioid_recetor=func, funcionarioid=request.session['funcID'],  notificacaoid=notifica, visto=0, data=datetime.now(), nomerestaurante = form.nome)
                nova_notificacao.save()
            request.session['message'] = "Restaurante editado com sucesso"
            return redirect('VerRestaurantes')

    context = {'form': form_restaurante, 'ModalTitulo': "Cancelar a edição do restaurante", 'ModalFrase': "Deseja mesmo cancelar a edição do restaurante?", 'ch' : 1,
    'Titulo': "Editar restaurante", 'Verbo' : "Atualizar", 'edit' : 1, "imagem" : restaurante.imagem, 'Pagina' : "Editar Restaurantes", 'NumeroNotif': count_notificacoes(func_id=request.session['funcID'])}
    return render(request, 'adminSistema/Criar_Restaurante.html', context)



##############################################################################################################################
#########                                                                                                            #########
#########                                         Eliminar Restaurante                                               #########
#########                                                                                                            #########
##############################################################################################################################
@IsLoggedIn
@allowed_users(allowed_user=[7])
def EliminarRestaurante(request):

    if request.method == 'GET':
        id_res = request.GET.get('id')
        restaurante = Restaurante.objects.filter(id=id_res).first()
        if len(restaurante.imagem) > 0:
            os.remove(restaurante.imagem.path)
        tipo = Tipofuncionario.objects.filter(id=1).first()
        funcionarios = Funcionario.objects.filter(tipofuncionarioid=tipo)
        notifica = Notificacao.objects.filter(id=3).first()
        for func in funcionarios:
            nova_notificacao = FuncionarioNotificacao(funcionarioid_recetor=func, funcionarioid=request.session['funcID'],  notificacaoid=notifica, visto=0, data=datetime.now(), nomerestaurante = restaurante.nome)
            nova_notificacao.save()
        Restaurante.objects.filter(id=id_res).delete()
        request.session['message'] = "Restaurante eliminado com sucesso"
        return redirect('VerRestaurantes')
    return redirect('VerRestaurantes')



@IsLoggedIn
@allowed_users(allowed_user=[7])
def InformacoesDoRestaurante(request, id_res):
   
    request.session['id_res'] = id_res
    restaurante = Restaurante.objects.filter(id=id_res).first()
   
    return render(request, 'adminSistema/Restaurante_info.html', { "id_res": id_res,
    'NumeroNotif': count_notificacoes(func_id=request.session['funcID']), 'restaurante' : restaurante, "imagem" : restaurante.imagem})


@IsLoggedIn
@allowed_users(allowed_user=[7])
def VerFuncionarios(request, res_id):
    message = ""
    if 'message' in request.session:
        message = request.session['message']
        del request.session['message']
    
    order_by = request.GET.get("order_by", "tipofuncionarioid")
    dir = request.GET.get("direction", "0")

    rest_id = res_id
    
    tipoCliente = Tipofuncionario.objects.filter(id=6).first()
    tipo = request.GET.get("Tipo", "0")
    if tipo== "":
        tipo = "0"
   
    if rest_id != "0":
        rest = Restaurante.objects.filter(id=rest_id).values_list('nome', flat=True).first()
        if dir == '0':
            if tipo == "0":
                funcionarios = Funcionario.objects.filter(restauranteid=rest_id).exclude(tipofuncionarioid = tipoCliente).order_by("-" + str(order_by))
            else:
                funcionarios = Funcionario.objects.filter(restauranteid=rest_id, tipofuncionarioid=tipo).exclude(tipofuncionarioid = tipoCliente).order_by("-" + str(order_by))
        else:
            if tipo == "0":
                funcionarios = Funcionario.objects.filter(restauranteid=rest_id).exclude(tipofuncionarioid = tipoCliente).order_by(order_by)
            else:
                funcionarios = Funcionario.objects.filter(restauranteid=rest_id, tipofuncionarioid=tipo).exclude(tipofuncionarioid = tipoCliente).order_by(order_by)
        
       
        myFilter = FuncionariosFilter(request.GET, queryset=funcionarios)
        funcionarios = myFilter.qs
      
        restaurantes=Restaurante.objects.all()
        myFilter = RestaurantesFilter2(request.GET, queryset=restaurantes)
        restaurantes = myFilter.qs
      
        funciona = []
        true = False
        for funcio in funcionarios:
            for restaurante in restaurantes:
                if funcio.restauranteid is None:
                    
                    true=True
                elif restaurante.id == funcio.restauranteid.id:
                    true= True
            if true:
                funciona.append(funcio)
            true=False


        paginator = Paginator(funciona, 5) # Show 25 contacts per page.

        page_number = request.GET.get('page')
        page_obj = paginator.get_page(page_number)

        return render(request, 'adminSistema/Funcionários_v2.html', {"rest": rest, "rest_id" : rest_id, "restaurante" : Funcionario.objects.all, 'page_obj': page_obj, 
        'res': request.GET.get("res", ""), 'nome' : request.GET.get("nome", ""), 'Tipo': request.GET.get("Tipo", ""), 
        'message' : message, 'NumeroNotif': count_notificacoes(func_id=request.session['funcID'])})
    else:
        if dir == '0':
            if tipo == "0":
                funcionarios = Funcionario.objects.exclude(tipofuncionarioid = tipoCliente).order_by("-" + str(order_by))
            else:
                funcionarios = Funcionario.objects.filter(tipofuncionarioid=tipo).exclude(tipofuncionarioid = tipoCliente).order_by("-" + str(order_by))
        else:
            if tipo == "0":
                funcionarios = Funcionario.objects.exclude(tipofuncionarioid = tipoCliente).order_by(order_by)
            else:
                funcionarios = Funcionario.objects.filter(tipofuncionarioid=tipo).exclude(tipofuncionarioid = tipoCliente).order_by(order_by)
    myFilter = FuncionariosFilter(request.GET, queryset=funcionarios)
    funcionarios = myFilter.qs
    restaurantes=Restaurante.objects.all()
    myFilter = RestaurantesFilter2(request.GET, queryset=restaurantes)
    restaurantes = myFilter.qs

    funciona = []
    true = False
    for funcio in funcionarios:
        for restaurante in restaurantes:
            if funcio.restauranteid is None:
                true=True
            elif restaurante.id == funcio.restauranteid.id:
                true= True
        if true:
            funciona.append(funcio)
        true=False


    paginator = Paginator(funciona, 5) # Show 25 contacts per page.

    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)
   
   
    return render(request, 'adminSistema/Funcionários.html', {"restaurante" : Funcionario.objects.all, 'page_obj': page_obj, 'message' : message, 
    'res': request.GET.get("res", ""), 'nome' : request.GET.get("nome", ""), 'Tipo': request.GET.get("Tipo", ""), 
    'Pagina' : "Visualizar Funcionários", 'NumeroNotif': count_notificacoes(func_id=request.session['funcID'])})

@IsLoggedIn
@allowed_users(allowed_user=[7])
def CreateFuncionario(request):
    Func_form = CreateFuncionarioForm()
   
    if request.method == "POST":
        Func_form = CreateFuncionarioForm(request.POST)
        if Func_form.is_valid():


            password = request.POST.get("password", "")

            tipofuncionarioid = request.POST.get("tipofuncionarioid", "")
            TipoFunc = Tipofuncionario.objects.filter(id=tipofuncionarioid).first()

            restauranteid = request.POST.get("restauranteid", "")

            nome= request.POST.get("nome", "")
            telefone = request.POST.get("telefone", "")
            email = request.POST.get("email", "")
            Func_form.full_clean()

            password_enc = make_password(password)

            if restauranteid == "":
                func = Funcionario(tipofuncionarioid= TipoFunc, nome=nome, telefone=telefone, email=email, password=password_enc)
            else:
                Rest = Restaurante.objects.filter(id=restauranteid).first()
                func = Funcionario(tipofuncionarioid= TipoFunc, restauranteid = Rest, nome=nome, telefone=telefone, email=email, password=password_enc)


            func.save()
            request.session['message'] = "Funcionário criado com sucesso"
            return redirect('VerFuncionarios', 0)
            
        else:
            return render(request, "adminSistema/Criar_Editar_Funcionario.html",
            context={"restaurante" : Restaurante.objects.all, 'form':Func_form, 'NumeroNotif': count_notificacoes(func_id=request.session['funcID'])}
            )         
    return render(request, "adminSistema/Criar_Editar_Funcionario.html",
    context={"restaurante" : Restaurante.objects.all, 'form':Func_form, 'NumeroNotif': count_notificacoes(func_id=request.session['funcID']), 'Pagina' : "Criar Funcionário",
    'ModalTitulo': "Cancelar a criação do funcionário", 'ModalFrase': "Deseja mesmo cancelar a criação do funcionário?", 'Titulo': "Criar funcionário", 'Verbo' : "Criar"}
)

@IsLoggedIn
@allowed_users(allowed_user=[7])
def ApagarFuncionario(request, func_id):
 
    func = Funcionario.objects.filter(id=func_id).first()
    FuncionarioNotificacao.objects.filter(funcionarioid_recetor=func).delete()
    func.delete()
    request.session['message'] = "Funcionário eliminado com sucesso"
    return redirect('VerFuncionarios', 0)



def EditarFuncionario(request, func_id):

    initial_data = {}

    if request.method == 'GET':
        request.session['func_id'] = func_id
      
        if func_id == None:
            return redirect('../restaurantes/VisualizarRestaurantes')
        Func = Funcionario.objects.get(id=func_id)

        initial_data = {
            'tipofuncionarioid' : Func.tipofuncionarioid,
            'restauranteid' : Func.restauranteid,
            'nome' : Func.nome,
            'telefone' : Func.telefone,
            'email' : Func.email,
        }


    Edit_Func_Form = EditarFuncionarioForm(initial=initial_data)
    if request.method == "POST":
        func_id = request.session['func_id']
        Func = Funcionario.objects.get(id=func_id)

        tipofuncionarioid_ = request.POST.get("tipofuncionarioid", "")
        restauranteid_ = request.POST.get("restauranteid", "")
        nome_ = request.POST.get("nome", "")
        telefone_ = request.POST.get("telefone", "")
        email_ = request.POST.get("email", "")
        password_ = request.POST.get("password", "")


        
        Edit_Func_Form = EditarFuncionarioForm(request.POST, tipofuncionarioid=Func.tipofuncionarioid, restauranteid=Func.restauranteid, nome=Func.nome, 
        telefone=Func.telefone, email = Func.email)

        if Edit_Func_Form.is_valid():
            if password_ != "":
                password_enc = make_password(password_)
            else:
                password_enc = Func.password
            Funcionario.objects.filter(id=func_id).update(tipofuncionarioid=tipofuncionarioid_, restauranteid=restauranteid_, 
            nome=nome_, telefone=telefone_, email = email_, password=password_enc)
            request.session['message'] = "Funcionário editado com sucesso"
            return redirect('VerFuncionarios', 0)
                
        else:
           
            return render(request, "funcionarios/Criar_Editar_Funcionario.html",
            context={"restaurante" : Restaurante.objects.all, 'form':Edit_Func_Form, 'NumeroNotif': count_notificacoes(func_id=request.session['funcID']),
            'ModalTitulo': "Cancelar a edição do funcionário", 'ModalFrase': "Deseja mesmo cancelar a atualização do funcionário?", 'Titulo': "Editar funcionário", 'Verbo' : "Editar"}
            )         
        
    Edit_Func_Form = EditarFuncionarioForm(initial=initial_data)
    return render(request, "funcionarios/Criar_Editar_Funcionario.html",
        context={"restaurante" : Restaurante.objects.all, 'form':Edit_Func_Form, 'NumeroNotif': count_notificacoes(func_id=request.session['funcID']), 'Pagina' : "Editar Funcionário",
        'ModalTitulo': "Cancelar a edição do funcionário", 'ModalFrase': "Deseja mesmo cancelar a atualização do funcionário?", 'Titulo': "Editar funcionário", 'Verbo' : "Editar"}
        )