from email.errors import NonPrintableDefect
from random import choices
from time import time
from unittest.util import _MAX_LENGTH
from xmlrpc.client import DateTime
from django.forms import ModelForm
from .models import *
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm,PasswordChangeForm
from django.forms import *
from django.contrib.auth.models import User
from django import forms
from django.contrib.auth.forms import PasswordResetForm
from django.forms.widgets import NumberInput
import datetime
from django.utils import timezone
CHOICES = (
    ("1","Esplanada,fumador"),
    ("2","Esplanada, não fumador"),
    ("3","Interior"),
)
class ReservaForm(forms.ModelForm):
    nomecliente = forms.CharField(label = 'Nome completo', max_length= 100)
    telefonecliente = forms.IntegerField(label= 'Número de Telefone', max_value= 999999999)
    numeropessoas = forms.IntegerField(label= 'Número de Pessoas', max_value= 100)
    dia = forms.DateField(widget=NumberInput(attrs={'type': 'date'}),)
    horainicio = forms.TimeField(widget=NumberInput(attrs={'type': 'time'}), label='Horario Início')
    nota = forms.CharField(label = 'Nota', max_length= 250, required= False)
    sala = forms.ChoiceField(label = "Tipo de sala", choices = CHOICES)
    class Meta:
        model = Reserva
        fields = [
            'nomecliente',
            'telefonecliente',
            'numeropessoas',
            'dia',
            'horainicio',
            'nota',
            'sala',
        ]
    def __init__(self, *args, **kwargs):
        self.now = kwargs.pop('now_time', None)
        super().__init__(*args, **kwargs)

    def clean(self):
        print(timezone.now())
        erros = []
        nome = self.cleaned_data.get('nomecliente')
        numero_telefone = self.cleaned_data.get('telefonecliente')
        numero_pessoas = self.cleaned_data.get('numeropessoas')
        dia = self.cleaned_data.get('dia')
        horainicio = self.cleaned_data.get('horainicio')
        nota = self.cleaned_data.get('nota')
        sala = self.cleaned_data.get('sala')
        if dia < datetime.date.today():
            raise forms.ValidationError("O dia nao pode ser no passado")

        if dia == datetime.date.today():
            if str(horainicio) < self.now:
                raise forms.ValidationError(" Nao podes fazer uma reserva no passado")
        if horainicio < datetime.time(10,0) or horainicio > datetime.time(22,0):
            raise forms.ValidationError("O Restaurante so está aberto das 10 às 22")

        if len(str(numero_telefone)) != 9:
            raise forms.ValidationError("O número de telefone tem que ter 9 digitos")

        if len(erros)>0:
            raise ValidationError([erros])

class EditFormReserva(ModelForm):
    nomecliente = forms.CharField(label = 'Nome completo', max_length= 100)
    telefonecliente = forms.IntegerField(label= 'Número de Telefone', max_value= 999999999)
    numeropessoas = forms.IntegerField(label= 'Número de Pessoas', max_value= 100)
    dia = forms.DateField(widget=NumberInput(attrs={'type': 'date'}),)
    horainicio = forms.TimeField(widget=NumberInput(attrs={'type': 'time'}), label='Horario Início')
    nota = forms.CharField(label = 'Nota', max_length= 250, required= False)
    sala = forms.ChoiceField(label = "Tipo de sala", choices = CHOICES)
    class Meta:
        model = Reserva
        fields = [
            'nomecliente',
            'telefonecliente',
            'numeropessoas',
            'dia',
            'horainicio',
            'nota',
            'sala',
        ]
    def __init__(self, *args, **kwargs):
        self.now = kwargs.pop('now_time', None)
        super().__init__(*args, **kwargs)
        
    def clean(self):
        print(timezone.now())
        erros = []
        nome = self.cleaned_data.get('nomecliente')
        numero_telefone = self.cleaned_data.get('telefonecliente')
        numero_pessoas = self.cleaned_data.get('numeropessoas')
        dia = self.cleaned_data.get('dia')
        horainicio = self.cleaned_data.get('horainicio')
        nota = self.cleaned_data.get('nota')
        sala = self.cleaned_data.get('sala')
        if dia < datetime.date.today():
            raise forms.ValidationError("O dia nao pode ser no passado")

        if dia == datetime.date.today():
            if str(horainicio) < self.now:
                raise forms.ValidationError(" Nao podes fazer uma reserva no passado")
        if horainicio < datetime.time(10,0) or horainicio > datetime.time(22,0):
            raise forms.ValidationError("O Restaurante so está aberto das 10 às 22")

        if len(str(numero_telefone)) != 9:
            raise forms.ValidationError("O número de telefone tem que ter 9 digitos")

        if len(erros)>0:
            raise ValidationError([erros])

class TakeAway_Form(forms.ModelForm):
    nomecliente = forms.CharField(label = 'Nome completo', max_length= 100)
    telefonecliente = forms.IntegerField(label= 'Número de Telefone', max_value= 999999999)
    dia = forms.DateField(widget=NumberInput(attrs={'type': 'date'}),)
    horainicio = forms.TimeField(widget=NumberInput(attrs={'type': 'time'}), label='Horario de Recolha')
    nota = forms.CharField(label = 'Nota', max_length= 250, required= False)
    class Meta:
        model = Reserva
        fields = [
            'nomecliente',
            'telefonecliente',
            'dia',
            'horainicio',
            'nota',
        ]
    def __init__(self, *args, **kwargs):
        self.now = kwargs.pop('now_time', None)
        super().__init__(*args, **kwargs)
        
    def clean(self):
        print(timezone.now())
        erros = []
        nome = self.cleaned_data.get('nomecliente')
        numero_telefone = self.cleaned_data.get('telefonecliente')
        dia = self.cleaned_data.get('dia')
        horainicio = self.cleaned_data.get('horainicio')
        nota = self.cleaned_data.get('nota')
        sala = self.cleaned_data.get('sala')
        if dia < datetime.date.today():
            raise forms.ValidationError("O dia nao pode ser no passado")

        if dia == datetime.date.today():
            if str(horainicio) < self.now:
                raise forms.ValidationError(" Nao podes fazer uma reserva no passado")
        if horainicio < datetime.time(10,0) or horainicio > datetime.time(22,0):
            raise forms.ValidationError("O Restaurante so está aberto das 10 às 22")

        if len(str(numero_telefone)) != 9:
            raise forms.ValidationError("O número de telefone tem que ter 9 digitos")

        if len(erros)>0:
            raise ValidationError([erros])