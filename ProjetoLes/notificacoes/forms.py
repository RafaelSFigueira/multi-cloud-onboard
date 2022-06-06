from django.forms import ModelForm
from .models import *
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm,PasswordChangeForm
from django.forms import *
from django.contrib.auth.models import User
from django import forms
from django.contrib.auth.hashers import make_password, check_password   


class CreateNotificacao(forms.ModelForm):
    nome = forms.CharField(label='Nome da notificação')
    template = forms.CharField(widget=forms.Textarea, label='Template')

    class Meta:
        model = Notificacao
        fields = [
            'nome',
            'template',
           
        ]
    def clean(self):
        nome = self.cleaned_data.get('nome')
        template = self.cleaned_data.get('template')
       

        erros = []
        if nome == "" or template=="":
            raise forms.ValidationError(f'0')
            
        if nome and Notificacao.objects.filter(nome=nome).exists():
            erros.append(forms.ValidationError(f'1'))

        if len(erros)>0:
            raise ValidationError([erros])




class EditNotificacaoForm(forms.ModelForm):
    nome = forms.CharField(label='Nome da notificação')
    template = forms.CharField(widget=forms.Textarea, label='Template')

    def __init__(self, *args, **kwargs):
        self.notificacao = kwargs.pop('notificacao', None)
        self.nome = self.notificacao.nome
        self.template = self.notificacao.template
        super().__init__(*args, **kwargs)

    class Meta:
        model = Notificacao
        fields = [
            'nome',
            'template',
        ]
    
    def clean(self):
        nome = self.cleaned_data.get('nome')
        template = self.cleaned_data.get('template')
    
        erros = []
        if nome == "" or template=="":
            raise forms.ValidationError(f'0')
            
        if nome and Notificacao.objects.filter(nome=nome).exists():
            if nome.lower() != self.nome.lower():
                erros.append(forms.ValidationError(f'1'))

        if len(erros)>0:
            raise ValidationError([erros])



