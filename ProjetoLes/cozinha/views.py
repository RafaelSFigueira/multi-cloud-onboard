from operator import truediv
from django.shortcuts import redirect, render
from django.http import HttpResponse
from .models import *
from .models import Restaurante
from .forms import *
from django.http import HttpResponseRedirect
from django.views.generic import ListView
from django.core.paginator import Paginator
from django.shortcuts import redirect
from django.db.models.functions import Lower
from restaurantes.decorators import *

def count_notificacoes(func_id):
    notificacoes = FuncionarioNotificacao.objects.filter(funcionarioid_recetor=func_id, visto=0).count()

    return notificacoes

@IsLoggedIn
@allowed_users(allowed_user=[3])
# Create your views here.
def homeCozinha(request):
    return render(request = request, 
    template_name="cozinha/homeCozinha.html",
    context={}
    )


class ContactListView(ListView):
    paginate_by = 2
    model = Produto


@IsLoggedIn
@allowed_users(allowed_user=[3])
def VisualizarProdutos(request):

    if request.method == 'GET':
        order_by = request.GET.get('order_by')
        direction = request.GET.get('direction')
       
        ordering = Lower(order_by)
    
        if direction == 'down':
            restaunrantes = Produto.objects.all().order_by(-ordering)
        else:
            restaunrantes = Produto.objects.all().order_by(ordering)
    else:
        order_by = 'nome'




    paginator = Paginator(restaunrantes, 5) # Show 25 contacts per page.
    page_number = request.GET.get('page')
    page_obj = paginator.get_page(page_number)


   
   
    return render(request, 'cozinha/VisualizarProdutos.html', {"produto" : Produto.objects.all, 'page_obj': page_obj})



@IsLoggedIn
@allowed_users(allowed_user=[3])
def CriarProduto(request):
    CreateMenuForm = RestauranteForm()

    if request.method == "POST":
        CreateMenuForm = RestauranteForm(request.POST)
        if CreateMenuForm.is_valid():
            nome = CreateMenuForm.cleaned_data.get("nome")
            preco = CreateMenuForm.cleaned_data.get("preco")
            ingredientes = CreateMenuForm.cleaned_data.get("ingredientes")
            tipoproduto = CreateMenuForm.cleaned_data.get("tipoproduto")
           
            NewProduto = Produto(tipoprodutoid=tipoproduto, nome=nome, preco=preco, quantidade=0 )
            NewProduto.save()  
            for ingre in ingredientes:
                produto_ing = ProdutoIngredientes(ingredientesid=ingre, produtoid=NewProduto)
                produto_ing.save()
            return redirect('http://127.0.0.1:8000/VisualizarProdutos')
            
        else:
            return render(request, "cozinha/CriarProduto.html",
            context={"restaurante" : Produto.objects.all, 'form':CreateMenuForm}
            ) 

    return render(request, "cozinha/CriarProduto.html",
    context={"restaurante" : Produto.objects.all, 'form':CreateMenuForm}
)

@IsLoggedIn
@allowed_users(allowed_user=[3])
def DeleteProduto(request):
    if request.method == 'GET':
        id_res = request.GET.get('id')
        Produto.objects.filter(id=id_res).delete()
        request.session['message'] = "Restaurante eliminado com sucesso"

       
        return redirect('http://127.0.0.1:8000/VisualizarProdutos')
    return redirect('http://127.0.0.1:8000/VisualizarProdutos')

@IsLoggedIn
@allowed_users(allowed_user=[3])
def EditarProduto(request):
    if request.method == 'GET':
        id_res = request.GET.get('id')
        res = Produto.objects.get(id=id_res)
        res2 = Ingredientes.objects.get(id=id_res)

        request.session['id_res'] = id_res
        initial_data = {
            'nome' : res.nome,
            'preco' : res.preco,
            'quantidade' : res.quantidade,
            'nome3' : res2.nome

            
        }

        form_restaurante = EditarProduto(initial=initial_data)
        
   
    if request.method == "POST":
        id_res =  request.session['id_res']
        res = Produto.objects.get(id=id_res)

        nome2 = request.POST.get("nome", "")
        preco2 = request.POST.get("preco", "")
        quantidade2 = request.POST.get("quantidade", "")
        nome4 = request.POST.get("nome3", "")
        #tipoproduto2 = request.POST.get("tipoproduto2", "")

        form_restaurante = EditarProduto(request.POST, nome=res.nome, preco=res.preco, quantidade=res.quantidade, ingredientes=res2.nome3)

        if form_restaurante.is_valid():
            product = Produto.objects.get(id=id_res)
            product.nome = nome2
            product.preco = preco2
            product.quantidade = quantidade2
            product.nome3 = nome4    

            product.save()
            request.session['message'] = "Produto editado com sucesso"
            #Restaurante.objects.create(**form_restaurante.cleaned_data)
            #form_restaurante.full_clean()
            #form_restaurante.save()
            return redirect('http://127.0.0.1:8000/VisualizarProdutos')
            
        else:
            return render(request, "cozinha/Editar_Prato.html",
            context={"restaurante" : Produto.objects.all, 'form':form_restaurante, 'k':k}
            )         
    form_restaurante = EditarProduto(initial=initial_data)
    return render(request, "cozinha/Editar_Prato.html",
        context={"restaurante" : Produto.objects.all, 'form':form_restaurante}
        )

@IsLoggedIn
@allowed_users(allowed_user=[3])
def ProdutoInfo(request, id_res):
   
    request.session['id_res'] = id_res
    produto = Produto.objects.filter(id=id_res).first()
   
    return render(request, 'cozinha/ProdutoInfo.html', { "id_res": id_res,
    'NumeroNotif': count_notificacoes(func_id=request.session['funcID']), 'produto' : produto})
