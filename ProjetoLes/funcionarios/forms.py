from django.forms import ModelForm
from .models import *
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm,PasswordChangeForm
from django.forms import *
from django.contrib.auth.models import User
from django import forms
from django.contrib.auth.hashers import make_password, check_password   


class LoginForm(forms.ModelForm):
    email = forms.CharField(label='Email')
    password = forms.CharField(max_length=32, widget=forms.PasswordInput, label="Introduza a password")
    class Meta:
        model = Funcionario
        fields = [
            'email',
            'password',
        ]
    def clean(self):
        email = self.cleaned_data.get('email')
        password = self.cleaned_data.get('password')
      

        if email =="" or password =="":
            raise forms.ValidationError(f'0')
        if email and Funcionario.objects.filter(email=email).exists():
            funcionario = Funcionario.objects.filter(email=email).first()
            if check_password(password, funcionario.password):
                print("ok")
            else:
                raise forms.ValidationError(f'1')
        else:
            raise forms.ValidationError(f'1')
     
class CreateFuncionarioForm(forms.ModelForm):
    ids=[1, 6, 7]
    tipofuncionarioid = forms.ModelChoiceField(queryset=Tipofuncionario.objects.filter().exclude(id__in=ids), label = "Tipo de funcionário")
    restauranteid = forms.ModelChoiceField(queryset=Restaurante.objects.filter(), label = "Restaurante", required= False)
    nome = forms.CharField(label='Nome')
    telefone = forms.IntegerField(label='Número de telefone', min_value=111111111, max_value= 999999999)
    email = forms.EmailField(label='Email')
    password = forms.CharField(max_length=32, widget=forms.PasswordInput, label="Introduza a password")
    password2 = forms.CharField(max_length=32, widget=forms.PasswordInput, label="Confirme a password")
    
    class Meta:
        model = Funcionario
        fields = [
            'tipofuncionarioid',
            'restauranteid',
            'nome',
            'telefone',
            'email',
            'password',
            'password2'
        ]
    def clean(self):
        nome = self.cleaned_data.get('nome')
        telefone = self.cleaned_data.get('telefone')
        tipofuncionarioid = self.cleaned_data.get('tipofuncionarioid')
        restauranteid = self.cleaned_data.get('restauranteid')
        email = self.cleaned_data.get('email')
        password = self.cleaned_data.get('password')
        password2 = self.cleaned_data.get('password2')

        erros = []
        if nome == "" or telefone==""  or restauranteid == "" or email == "" or password == "" or password2 == "":
            raise forms.ValidationError(f'0')
            

        if email and Funcionario.objects.filter(email=email).exists():
            erros.append(forms.ValidationError(f'1'))

        if password and password2 and password != password2:
            erros.append(forms.ValidationError(f'2'))
        if restauranteid == None and str(tipofuncionarioid) != "Administrador":
            raise forms.ValidationError(f'3')
           
        if len(erros)>0:
            raise ValidationError([erros])

class CriarContaForm(forms.ModelForm):
    nome = forms.CharField(label='Nome')
    telefone = forms.IntegerField(label='Número de telefone', min_value=111111111, max_value= 999999999)
    email = forms.EmailField(label='Email')
    password = forms.CharField(max_length=32, widget=forms.PasswordInput, label="Introduza a password")
    password2 = forms.CharField(max_length=32, widget=forms.PasswordInput, label="Confirme a password")
    
    class Meta:
        model = Funcionario
        fields = [
            'nome',
            'telefone',
            'email',
            'password',
            'password2'
        ]
    def clean(self):
        nome = self.cleaned_data.get('nome')
        telefone = self.cleaned_data.get('telefone')
        email = self.cleaned_data.get('email')
        password = self.cleaned_data.get('password')
        password2 = self.cleaned_data.get('password2')

        erros = []
        if nome == "" or telefone==""  or email == "" or password == "" or password2 == "":
            raise forms.ValidationError(f'0')
            

        if email and Funcionario.objects.filter(email=email).exists():
            erros.append(forms.ValidationError(f'1'))

        if password and password2 and password != password2:
            erros.append(forms.ValidationError(f'2'))

           
        if len(erros)>0:
            raise ValidationError([erros])


class EditarFuncionario(forms.ModelForm):
    ids=[1, 6, 7]
    tipofuncionarioid = forms.ModelChoiceField(queryset=Tipofuncionario.objects.filter().exclude(id__in=ids), label = "Tipo de funcionário")
    restauranteid = forms.ModelChoiceField(queryset=Restaurante.objects.filter(), label = "Restaurante", required= False)
    nome = forms.CharField(label='Nome')
    telefone = forms.IntegerField(label='Número de telefone', min_value=111111111, max_value= 999999999)
    email = forms.EmailField(label='Email2')
    password = forms.CharField(max_length=32, widget=forms.PasswordInput, label="Introduza a password",  required= False)
    password2 = forms.CharField(max_length=32, widget=forms.PasswordInput, label="Confirme a password",  required= False)

    def __init__(self, *args, **kwargs):
        self.tipofuncionarioid = kwargs.pop('tipofuncionarioid', None)
        self.restauranteid = kwargs.pop('restauranteid', None)
        self.nome = kwargs.pop('nome', None)
        self.telefone = kwargs.pop('telefone', None)
        self.email = kwargs.pop('email', None)

        super().__init__(*args, **kwargs)

    class Meta:
        model = Funcionario
        fields = [
            'tipofuncionarioid',
            'restauranteid',
            'nome',
            'telefone',
            'email',
            'password',
            'password2'
        ]
    
    def clean(self):
        nome = self.cleaned_data.get('nome')
        telefone = self.cleaned_data.get('telefone')
        tipofuncionarioid = self.cleaned_data.get('tipofuncionarioid')
        restauranteid = self.cleaned_data.get('restauranteid')
        email = self.cleaned_data.get('email')
        password = self.cleaned_data.get('password')
        password2 = self.cleaned_data.get('password2')

        erros = []
        if nome == "" or telefone==""  or restauranteid == "" or email == "":
            raise forms.ValidationError(f'0')
            
        

        if email and Funcionario.objects.filter(email=email).exists():
            if email.lower() != self.email.lower():
                erros.append(forms.ValidationError(f'1'))
        
        if password and password2 and password != password2:
            erros.append(forms.ValidationError(f'2'))

        if restauranteid == None and str(tipofuncionarioid) != "Administrador Sistema":
            raise forms.ValidationError(f'3')

        if len(erros)>0:
            raise ValidationError([erros])






