from asyncio.windows_events import NULL
from django.shortcuts import render
from django.http import HttpResponse
from operator import truediv
from django.shortcuts import redirect, render
from .models import *
from .forms import *
from django.core.paginator import Paginator
from django.shortcuts import redirect
from django.db.models.functions import Lower
from django.http import HttpResponse
from django.shortcuts import render
from django.http import HttpResponse
from django.shortcuts import render
from .tables import *
from notificacoes.views import count_notificacoes
from django.db.models import Q
from restaurantes.decorators import *
from .filters import *



@IsLoggedIn
@allowed_users(allowed_user=[1])
def VisualizarFuncionarios(request, res_id):
    func_id = request.session['funcID']
    func = Funcionario.objects.filter(id=func_id).first()
    restaurantes = Restaurante.objects.filter(funcionarioid=func).exclude(estado="por pagar")
    rest_ids = []
    for r in restaurantes:
        rest_ids.append(r.id)
    TipoFunc = Tipofuncionario.objects.get(id=7)
    funcionarios = Funcionario.objects.filter(restauranteid__in=rest_ids).exclude(tipofuncionarioid=TipoFunc)
    print(funcionarios, "----")
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
                funcionarios = funcionarios.filter(restauranteid=rest_id).exclude(tipofuncionarioid = tipoCliente).order_by("-" + str(order_by))
            else:
                funcionarios = funcionarios.filter(restauranteid=rest_id, tipofuncionarioid=tipo).exclude(tipofuncionarioid = tipoCliente).order_by("-" + str(order_by))
        else:
            if tipo == "0":
                funcionarios = funcionarios.filter(restauranteid=rest_id).exclude(tipofuncionarioid = tipoCliente).order_by(order_by)
            else:
                funcionarios = funcionarios.filter(restauranteid=rest_id, tipofuncionarioid=tipo).exclude(tipofuncionarioid = tipoCliente).order_by(order_by)
        
       
        myFilter = FuncionariosFilter(request.GET, queryset=funcionarios)
        funcionarios = myFilter.qs
      
        restaurantes=Restaurante.objects.all()
        myFilter = RestaurantesFilter(request.GET, queryset=restaurantes)
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

        return render(request, 'funcionarios/Funcionários_v2.html', {"rest": rest, "rest_id" : rest_id, "restaurante" : Funcionario.objects.all, 'page_obj': page_obj, 
        'res': request.GET.get("res", ""), 'nome' : request.GET.get("nome", ""), 'Tipo': request.GET.get("Tipo", ""), 
        'message' : message, 'NumeroNotif': count_notificacoes(func_id=request.session['funcID'])})
    else:
        if dir == '0':
            if tipo == "0":
                funcionarios = funcionarios.exclude(tipofuncionarioid = tipoCliente).order_by("-" + str(order_by))
            else:
                funcionarios = funcionarios.filter(tipofuncionarioid=tipo).exclude(tipofuncionarioid = tipoCliente).order_by("-" + str(order_by))
        else:
            if tipo == "0":
                funcionarios = funcionarios.exclude(tipofuncionarioid = tipoCliente).order_by(order_by)
            else:
                funcionarios = funcionarios.filter(tipofuncionarioid=tipo).exclude(tipofuncionarioid = tipoCliente).order_by(order_by)
    myFilter = FuncionariosFilter(request.GET, queryset=funcionarios)
    funcionarios = myFilter.qs
    restaurantes=Restaurante.objects.all()
    myFilter = RestaurantesFilter(request.GET, queryset=restaurantes)
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
   
   
    return render(request, 'funcionarios/Funcionários.html', {"restaurante" : Funcionario.objects.all, 'page_obj': page_obj, 'message' : message, 
    'res': request.GET.get("res", ""), 'nome' : request.GET.get("nome", ""), 'Tipo': request.GET.get("Tipo", ""), 
    'Pagina' : "Visualizar Funcionários", 'NumeroNotif': count_notificacoes(func_id=request.session['funcID'])})

@IsLoggedIn
@allowed_users(allowed_user=[1])
def CriarFuncionario(request):
    Func_form = CreateFuncionarioForm()
    func_id = request.session['funcID']
    func = Funcionario.objects.filter(id=func_id).first()
    restaurantes = Restaurante.objects.filter(funcionarioid=func).exclude(estado="por pagar")
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
            return redirect('VisualizarFuncionarios', 0)
            
        else:
            return render(request, "funcionarios/Criar_Funcionário.html",
            context={'restaurantes' : restaurantes,"restaurante" : Restaurante.objects.all, 'form':Func_form, 'NumeroNotif': count_notificacoes(func_id=request.session['funcID'])}
            )         
    return render(request, "funcionarios/Criar_Editar_Funcionario.html",
    context={'restaurantes' : restaurantes, "restaurante" : Restaurante.objects.all, 'form':Func_form, 'NumeroNotif': count_notificacoes(func_id=request.session['funcID']), 'Pagina' : "Criar Funcionário",
    'ModalTitulo': "Cancelar a criação do funcionário", 'ModalFrase': "Deseja mesmo cancelar a criação do funcionário?", 'Titulo': "Criar funcionário", 'Verbo' : "Criar"}
)


def CriarConta(request):
    Cliente_form = CriarContaForm()
   
    if request.method == "POST":
        Cliente_form = CriarContaForm(request.POST)
        if Cliente_form.is_valid():

            password = request.POST.get("password", "")
            TipoFunc = Tipofuncionario.objects.filter(id=6).first()

            nome= request.POST.get("nome", "")
            telefone = request.POST.get("telefone", "")
            email = request.POST.get("email", "")
            Cliente_form.full_clean()

            password_enc = make_password(password)

            clien = Funcionario(tipofuncionarioid= TipoFunc, nome=nome, telefone=telefone, email=email, password=password_enc)

            clien.save()
            request.session['message'] = "Cliente criado com sucesso"
            return redirect('Login')
            
        else:
            return render(request, "funcionarios/Criar_Funcionário.html",
            context={"restaurante" : Restaurante.objects.all, 'form':Cliente_form}
            )         
    return render(request, "funcionarios/CriarCliente.html",
    context={"restaurante" : Restaurante.objects.all, 'form':Cliente_form,
    'ModalTitulo': "Cancelar a criação da conta", 'ModalFrase': "Deseja mesmo cancelar a criação da sua conta?", 'Titulo': "Criar conta", 'Verbo' : "Criar"}
)



@IsLoggedIn
@allowed_users(allowed_user=[1])
def FuncionarioEditar(request, func_id):
    
    func_id = request.session['funcID']
    func = Funcionario.objects.filter(id=func_id).first()
    restaurantes = Restaurante.objects.filter(funcionarioid=func).exclude(estado="por pagar")
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


    Edit_Func_Form = EditarFuncionario(initial=initial_data)
    if request.method == "POST":
        func_id = request.session['func_id']
        Func = Funcionario.objects.get(id=func_id)

        tipofuncionarioid_ = request.POST.get("tipofuncionarioid", "")
        restauranteid_ = request.POST.get("restauranteid", "")
        nome_ = request.POST.get("nome", "")
        telefone_ = request.POST.get("telefone", "")
        email_ = request.POST.get("email", "")
        password_ = request.POST.get("password", "")


        
        Edit_Func_Form = EditarFuncionario(request.POST, tipofuncionarioid=Func.tipofuncionarioid, restauranteid=Func.restauranteid, nome=Func.nome, 
        telefone=Func.telefone, email = Func.email)

        if Edit_Func_Form.is_valid():
            if password_ != "":
                password_enc = make_password(password_)
            else:
                password_enc = Func.password
            Funcionario.objects.filter(id=func_id).update(tipofuncionarioid=tipofuncionarioid_, restauranteid=restauranteid_, 
            nome=nome_, telefone=telefone_, email = email_, password=password_enc)
            request.session['message'] = "Funcionário editado com sucesso"
            return redirect('VisualizarFuncionarios', 0)
                
        else:
           
            return render(request, "funcionarios/Criar_Editar_Funcionario.html",
            context={'restaurantes' : restaurantes,"restaurante" : Restaurante.objects.all, 'form':Edit_Func_Form, 'NumeroNotif': count_notificacoes(func_id=request.session['funcID']),
            'ModalTitulo': "Cancelar a edição do funcionário", 'ModalFrase': "Deseja mesmo cancelar a atualização do funcionário?", 'Titulo': "Editar funcionário", 'Verbo' : "Editar"}
            )         
        
    Edit_Func_Form = EditarFuncionario(initial=initial_data)
    return render(request, "funcionarios/Criar_Editar_Funcionario.html",
        context={'restaurantes' : restaurantes,"restaurante" : Restaurante.objects.all, 'form':Edit_Func_Form, 'NumeroNotif': count_notificacoes(func_id=request.session['funcID']), 'Pagina' : "Editar Funcionário",
        'ModalTitulo': "Cancelar a edição do funcionário", 'ModalFrase': "Deseja mesmo cancelar a atualização do funcionário?", 'Titulo': "Editar funcionário", 'Verbo' : "Editar"}
        )

@IsLoggedIn
@allowed_users(allowed_user=[1])
def Delete_Func(request, func_id):
    if 'tipofunc' in request.session:
        if request.session['tipofunc'] and request.session['tipofunc'] != 1:
            return redirect('Login')
    else:
        return redirect('Login')
    func = Funcionario.objects.filter(id=func_id).first()
    FuncionarioNotificacao.objects.filter(funcionarioid_recetor=func).delete()
    func.delete()
    request.session['message'] = "Funcionário eliminado com sucesso"
    return redirect('VisualizarFuncionarios', 0)


def Login(request):
    form = LoginForm()

    if 'tipofunc' in request.session:
        if 'tipofunc' in request.session and request.session['tipofunc'] == 1:
            return redirect('../restaurantes') ###mudar
        elif 'tipofunc' in request.session and request.session['tipofunc'] == 7:
            return redirect('../adminSistema') ###mudar
        elif 'tipofunc' in request.session and request.session['tipofunc'] == 3:
            return redirect('../cozinha/')
        elif 'tipofunc' in request.session and request.session['tipofunc'] == 6:
            return redirect('Restaurantes')

    if request.method == "POST":
        form = LoginForm(request.POST)
        if form.is_valid():
            print("ye?")
            email = request.POST.get("email", "")

            func = Funcionario.objects.filter(email=email).first()
            request.session['tipofunc'] = func.tipofuncionarioid_id
            request.session['isLogin'] = 1
            request.session['restID'] = func.restauranteid_id
            request.session['nome'] = func.nome
            request.session['funcID'] = func.id
            print(request.session['tipofunc'])
            if request.session['tipofunc'] == "1":
                return redirect('../restaurantes/')
            elif request.session['tipofunc'] == "6":
                redirect('VisualizarRestaurantes')
            else:
                return redirect('VisualizarRestaurantes')
        else:
            return render(request, "funcionarios/login.html",
            context={"restaurante" : Restaurante.objects.all, 'form': form}
            ) 
    return render(request, "funcionarios/login.html",
            context={"restaurante" : Restaurante.objects.all, 'form': form, 'Pagina' : "Login"})

def Logout(request):
    if 'isLogin' in request.session:
        del request.session['tipofunc']
        del request.session['isLogin']
        del request.session['restID']
        del request.session['nome']
    return redirect('Login')
