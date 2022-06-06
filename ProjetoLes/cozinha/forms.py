from django.forms import ModelForm
from .models import Restaurante
from .models import Produto
from .models import Ingredientes
from .models import Tipoproduto
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm,PasswordChangeForm
from django.forms import *
from django.contrib.auth.models import User
from django import forms
from django.contrib.auth.forms import PasswordResetForm

class RestauranteForm(forms.Form):
    nome = forms.CharField()
    preco = forms.IntegerField()
    ingredientes = forms.ModelMultipleChoiceField(queryset=Ingredientes.objects.filter(), widget=forms.CheckboxSelectMultiple, required=False)
    tipoproduto = forms.ModelChoiceField(queryset=Tipoproduto.objects.filter(), label="Tipo de produto")
   # quantidade = forms.IntegerField()    

    class Meta:
        fields = [
           
            'nome',
            'preco',
            'ingredientes'
            'tipoproduto'
        ]

    def clean(self):
        nome = self.cleaned_data.get('nome')
        preco = self.cleaned_data.get('preco')
        ingredientes = self.cleaned_data.get('ingredientes')
        tipoproduto = self.cleaned_data.get('tipoproduto')

        erros = []
        if nome == "" or preco=="" or tipoproduto=="" :
            raise forms.ValidationError(f'Todos os campos são obrigatórios!')

        if nome and Produto.objects.filter(nome=nome).exists():
            erros.append(forms.ValidationError(f'Já existe este Produto'))
 

        if len(erros)>0:
            raise ValidationError([erros])

class EditarProduto(forms.ModelForm):
    tipoproduto = forms.ModelChoiceField(queryset=Tipoproduto.objects.filter())
    nome = forms.CharField()
    preco = forms.FloatField()
    ingredientes = forms.ModelMultipleChoiceField(queryset=Ingredientes.objects.filter(), widget=forms.CheckboxSelectMultiple)
   
    quantidade = forms.IntegerField()   

    def __init__(self, *args, **kwargs):
        self.nome = kwargs.pop('nome', None)
        self.preco = kwargs.pop('preco', None)
        self.ingredientes = kwargs.pop('ingredientes', None)
        self.tipoproduto = kwargs.pop('tipoproduto', None)
        self.quantidade = kwargs.pop('quantidade', None)

        super().__init__(*args, **kwargs)

    class Meta:
        model = Produto
        fields = [
        'tipoproduto',
            'nome',
            'preco',
            'ingredientes',
            
            'quantidade'
        ]

    def clean(self):
        tipoproduto = self.cleaned_data.get('tipoproduto')
        nome = self.cleaned_data.get('nome')
        preco = self.cleaned_data.get('preco')
        ingredientes = self.cleaned_data.get('ingredientes')

        quantidade = self.cleaned_data.get('quantidade')

        erros = []
        if nome == "" or preco=="" or quantidade=="":
            raise forms.ValidationError(f'Todos os campos são obrigatórios!')

        if nome and Produto.objects.filter(nome=nome).exists():
            if nome != self.nome:
                print(nome, self.nome)
                erros.append(forms.ValidationError(f'Já existe este Prato'))
 

        if len(erros)>0:
            raise ValidationError([erros])

