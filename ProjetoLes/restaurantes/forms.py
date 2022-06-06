import numbers
from django.forms import ModelForm
from .models import *
from django.contrib.auth.forms import UserCreationForm, AuthenticationForm,PasswordChangeForm
from django.forms import *
from django.contrib.auth.models import User
from django import forms
from django.contrib.auth.hashers import make_password, check_password   

Dias_CHOICES =(
    ("", "-------------"),
    ("segunda-feira", "segunda-feira"),
    ("terça-feira", "terça-feira"),
    ("quarta-feira", "quarta-feira"),
    ("quinta-feira", "quinta-feira"),
    ("sexta-feira", "sexta-feira"),
    ("sábado", "sábado"),
    ("domingo", "domingo"),
)

estados_choices =(
    ("ativo", "ativo"),
    ("inativo", "inativo"),
)

class RestauranteForm(forms.ModelForm):
    nome = forms.CharField(label='*Nome do Restaurante')
    numerotelefone = forms.IntegerField(label='*Número de Telefone do Restaurante', min_value=111111111, max_value= 999999999)
    rua = forms.CharField(label='*Rua do Restaurante')
    numero_andar = forms.CharField(label='*Número e andar', widget=forms.TextInput(attrs={'placeholder': 'Bloco X NrºY ZºDt'}))
    codigo = forms.CharField(label='*Código Postal', widget=forms.TextInput(attrs={'placeholder': '8000-026'}))

    abertura = forms.TimeField(widget=NumberInput(attrs={'type': 'time'}), label="*Abertura")
    fecho = forms.TimeField(widget=NumberInput(attrs={'type': 'time'}), label="*Fecho")
    abertura_tarde = forms.TimeField(widget=NumberInput(attrs={'type': 'time'}), required=False, label="Abertura")
    fecho_tarde = forms.TimeField(widget=NumberInput(attrs={'type': 'time'}), required=False, label="Fecho")
    dia_fecho = forms.ChoiceField(choices = Dias_CHOICES, label="Dia em que o restaurante se encontra fechado", required=False)
    estado = forms.ChoiceField(choices = estados_choices, label="Estado do restaurante")

    class Meta:
        model = Restaurante
        fields = [
            'nome',
            'numerotelefone',
            'rua',
            'numero_andar',
            'codigo',
            'abertura',
            'fecho',
            'imagem',
            'abertura_tarde',
            'fecho_tarde',
            'dia_fecho',
            'estado',
        ]


    def clean(self):
        imagem = self.cleaned_data.get('imagem')
        nome = self.cleaned_data.get('nome')
        numerotelefone = self.cleaned_data.get('numerotelefone')
        rua = self.cleaned_data.get('rua')
        numero_andar = self.cleaned_data.get('numero_andar')
        codigo = self.cleaned_data.get('codigo')
       
        abertura = self.cleaned_data.get('abertura')
        fecho = self.cleaned_data.get('fecho')
        abertura_tarde = self.cleaned_data.get('abertura_tarde')
        fecho_tarde = self.cleaned_data.get('fecho_tarde')

        erros = []
        if imagem=="" or nome == "" or numerotelefone==""  or rua == "" or numero_andar == "" or codigo == "" or abertura == "" or fecho =="":
       
            raise forms.ValidationError(f'0')
            

        if nome and Restaurante.objects.filter(nome=nome).exists():
            erros.append(forms.ValidationError(f'1'))
     
        if numerotelefone and Restaurante.objects.filter(numerotelefone=numerotelefone).exists():
            erros.append(forms.ValidationError(f'2'))
      
        if rua and numero_andar and Restaurante.objects.filter(rua=rua, numero_andar=numero_andar).exists():
            erros.append(forms.ValidationError(f'3'))
    
        
        if abertura and fecho and abertura > fecho:
            erros.append(forms.ValidationError(f'4'))
         
        if not imagem:
            erros.append(forms.ValidationError(f'5'))
         
        if abertura_tarde and fecho and abertura_tarde < fecho:
            erros.append(forms.ValidationError(f'6'))
           
        if fecho_tarde and not abertura_tarde:
            erros.append(forms.ValidationError(f'8'))
        valido = False
        if codigo and len(codigo)==8:
            for i in range (0,len(codigo)):
                if i != 4:
                    for j in range(0, 10):
                        if str(j) == codigo[i]:
                            valido = True
                            break
                else:
                    if codigo[i] == "-":
                        valido = True
                if not valido:
                    break
                elif i != 7:
                    valido = False
            if not valido:
                erros.append(forms.ValidationError(f'7'))
            if valido:
                codigos = codigo.split("-")
                parte1 = int(codigos[0])
                parte2 = int(codigos[1])
                if codigo and not Codigos_postais_parcial.objects.filter(num_cod_postal=parte1, ext_cod_postal=parte2).exists():
                    erros.append(forms.ValidationError(f'9'))
        else:
            erros.append(forms.ValidationError(f'7'))
        
        
        if len(erros)>0:

            raise ValidationError([erros])
      

 

class EditForm(forms.ModelForm):
    nome = forms.CharField(label='Nome do Restaurante')
    numerotelefone = forms.IntegerField(label='Número de Telefone do Restaurante', min_value=111111111, max_value= 999999999)
    rua = forms.CharField(label='Rua do Restaurante')
    numero_andar = forms.CharField(label='Número e andar', widget=forms.TextInput(attrs={'placeholder': 'Ex: Bloco X Nrº3 1ºDt'}))
    codigo = forms.CharField(label='Código Postal')
    abertura = forms.TimeField(widget=NumberInput(attrs={'type': 'time'}))
    fecho = forms.TimeField(widget=NumberInput(attrs={'type': 'time'}))
    abertura_tarde = forms.TimeField(widget=NumberInput(attrs={'type': 'time'}), required=False)
    fecho_tarde = forms.TimeField(widget=NumberInput(attrs={'type': 'time'}), required=False)
    dia_fecho = forms.ChoiceField(choices = Dias_CHOICES, label="Dia em que o restaurante se encontra fechado", required=False)
    estado = forms.ChoiceField(choices = estados_choices, label="Estado do restaurante")


    def __init__(self, *args, **kwargs):
        self.res = kwargs.pop('res', None)
        self.nome = self.res.nome
        self.rua = self.res.rua
        self.numerotelefone = self.res.numerotelefone
        self.numero_andar = self.res.numero_andar
        self.codigo = self.res.codigo
        self.abertura = self.res.abertura
        self.fecho = self.res.fecho

        super().__init__(*args, **kwargs)

    class Meta:
        model = Restaurante
        fields = [
            'nome',
            'numerotelefone',
            'rua',
            'numero_andar',
            'codigo',
            'abertura',
            'fecho',
            'imagem',
            'abertura_tarde',
            'fecho_tarde',
            'dia_fecho',
            'estado',
        ]
    
    def clean(self):
        imagem = self.cleaned_data.get('imagem')
        nome = self.cleaned_data.get('nome')
        numerotelefone = self.cleaned_data.get('numerotelefone')
        rua = self.cleaned_data.get('rua')
        numero_andar = self.cleaned_data.get('numero_andar')
        codigo = self.cleaned_data.get('codigo')
        abertura = self.cleaned_data.get('abertura')
        fecho = self.cleaned_data.get('fecho')
        abertura_tarde = self.cleaned_data.get('abertura_tarde')
        fecho_tarde = self.cleaned_data.get('fecho_tarde')

        erros = []
        if imagem=="" or nome == "" or numerotelefone==""  or rua == "" or numero_andar == "" or codigo == "" or abertura == "" or fecho =="":
            print("1")
            raise forms.ValidationError(f'0')
            

        if nome and Restaurante.objects.filter(nome=nome).exists():
            if nome.lower() != self.nome.lower():
                print("2")
                erros.append(forms.ValidationError(f'1'))

        if rua and numero_andar and Restaurante.objects.filter(rua=rua, numero_andar=numero_andar).exists():
            if rua != self.rua and numero_andar != self.numero_andar:
                print("3")
                erros.append(forms.ValidationError(f'3'))
           

        if numerotelefone and Restaurante.objects.filter(numerotelefone=numerotelefone).exists():
            if numerotelefone != self.numerotelefone:
                print("4")
                erros.append(forms.ValidationError(f'2'))
        
        if abertura and fecho and abertura > fecho:
            erros.append(forms.ValidationError(f'4'))
            print("5")

        if abertura_tarde and fecho and abertura_tarde < fecho:
            erros.append(forms.ValidationError(f'6'))
            print("6")

        if fecho_tarde and not abertura_tarde:
            erros.append(forms.ValidationError(f'8'))

        valido = False
        if codigo and len(codigo)==8:
            for i in range (0,len(codigo)):
                if i != 4:
                    for j in range(0, 10):
                        if str(j) == codigo[i]:
                            valido = True
                            break
                else:
                    if codigo[i] == "-":
                        valido = True
                if not valido:
                    break
                elif i != 7:
                    valido = False
            if not valido:
                erros.append(forms.ValidationError(f'7'))
        else:
            erros.append(forms.ValidationError(f'7'))
            
        codigos = codigo.split("-")
        parte1 = int(codigos[0])
        parte2 = int(codigos[1])
        if codigo and not Codigos_postais_parcial.objects.filter(num_cod_postal=parte1, ext_cod_postal=parte2).exists():
            erros.append(forms.ValidationError(f'9'))



        if len(erros)>0:
            raise ValidationError([erros])
 

    
##############################################################################################################################
#########                                                                                                            #########
#########                                           Francisco Tomé                                                   #########
#########                                                                                                            #########
##############################################################################################################################    



class RestauranteCreateForm(forms.Form):
    nome = forms.CharField()
    morada = forms.CharField()
    numerotelefone = forms.IntegerField() 

CHOICE_TIPO_SALA = (
    ("Interior", "Interior"),
    ("Exterior", "Exterior"),
)


class RestauranteSalaForm(forms.ModelForm):
    nomesala = forms.CharField(label='Nome da Sala')
    capacidade = forms.IntegerField(label='Capacidade da Sala')
    tiposala = forms.ChoiceField(label='Tipo de sala', choices = CHOICE_TIPO_SALA)
    fumador = forms.BooleanField(label='Zona de Fumadores', required=False)

    class Meta:
        model = Sala
        fields = [
            'nomesala',
            'capacidade',
            'tiposala',
            'fumador',
        ]

    def clean(self):
        nomesala = self.cleaned_data.get('nomesala')
        capacidade = self.cleaned_data.get('capacidade')
        tiposala = self.cleaned_data.get('tiposala')
        fumador = self.cleaned_data.get('fumador')

        erros = []
        if nomesala == "" or capacidade=="" or tiposala=="" or fumador=="":
            raise forms.ValidationError(f'Todos os campos são obrigatórios!')

        if nomesala and Sala.objects.filter(nomesala=nomesala).exists():
            erros.append(forms.ValidationError(f'Esta sala já existe'))

        if len(erros)>0:
            raise ValidationError([erros])



class RestauranteCreateForm(forms.Form):
    nome = forms.CharField()
    morada = forms.CharField()
    numerotelefone = forms.IntegerField() 



class EditFormSala(forms.ModelForm):
    nomesala = forms.CharField(label='Nome da Sala')
    capacidade = forms.IntegerField(label='Capacidade da Sala')
    tiposala = forms.ChoiceField(label='Tipo de sala', choices = CHOICE_TIPO_SALA)
    fumador = forms.BooleanField(label='Zona de Fumadores', required=False)

    def __init__(self, *args, **kwargs):
        self.sala = kwargs.pop('sala', None)
        self.nomesala = self.sala.nomesala
        self.capacidade = self.sala.capacidade
        self.tiposala = self.sala.tiposala
        self.fumador = self.sala.fumador

        super().__init__(*args, **kwargs)

    class Meta:
        model = Sala
        fields = [
            'nomesala',
            'capacidade',
            'tiposala',
            'fumador',
        ]
    
    def clean(self):
        nomesala = self.cleaned_data.get('nomesala')
        capacidade = self.cleaned_data.get('capacidade')
        tiposala = self.cleaned_data.get('tiposala')
        fumador = self.cleaned_data.get('fumador')

        erros = []
        if nomesala == "" or capacidade=="" or tiposala=="" or fumador=="":
            raise forms.ValidationError(f'Todos os campos são obrigatórios!')

        if nomesala and Sala.objects.filter(nomesala=nomesala).exists():
            if nomesala != self.nomesala:
                erros.append(forms.ValidationError(f'1'))

        if len(erros)>0:
            raise ValidationError([erros])

class CreateMesa(forms.ModelForm):
    numero = forms.IntegerField(label='Número da mesa')
    posicaox = forms.IntegerField(label='X')
    posicaoy = forms.IntegerField(label='Y')
    posicaox1 = forms.IntegerField(label='X')
    posicaoy1 = forms.IntegerField(label='Y')
    maximopessoas = forms.IntegerField(label='Capacidade da mesa', min_value=1)

    def __init__(self, *args, **kwargs):
        self.salaID = kwargs.pop('salaID', None)
        self.capMax = kwargs.pop('capMax', None)
        self.capAtu = kwargs.pop('capAtu', None)

        super().__init__(*args, **kwargs)

    class Meta:
        model = Mesa
        fields = [
            'numero',
            'posicaox',
            'posicaoy',
            'posicaox1',
            'posicaoy1',
            'maximopessoas',
        ]

    def clean(self):
        numero = self.cleaned_data.get('numero')
        maximopessoas = self.cleaned_data.get('maximopessoas')

        erros = []
        if numero == "" or maximopessoas=="":
            raise forms.ValidationError(f'0')

        if numero and Mesa.objects.filter(salaid=self.salaID, numero=numero).exists():
            erros.append(forms.ValidationError(f'1'))
        
        if maximopessoas and self.capAtu + maximopessoas > self.capMax:
            erros.append(forms.ValidationError(f'2'))
        if len(erros)>0:
            raise ValidationError([erros])

class EditMesa(forms.ModelForm):
    numero = forms.IntegerField(label='Número da mesa')
    posicaox = forms.IntegerField(label='X')
    posicaoy = forms.IntegerField(label='Y')
    posicaox1 = forms.IntegerField(label='X')
    posicaoy1 = forms.IntegerField(label='Y')
    maximopessoas = forms.IntegerField(label='Capacidade da mesa', min_value=1)

    def __init__(self, *args, **kwargs):
        self.mesa = kwargs.pop('mesa', None)
        self.numero = self.mesa.numero
        self.posicaox = self.mesa.posicaox
        self.posicaoy = self.mesa.posicaoy
        self.posicaox1 = self.mesa.posicaox1
        self.posicaoy1 = self.mesa.posicaoy1
        self.maximopessoas = self.mesa.maximopessoas
        self.salaID = kwargs.pop('salaID', None)

        self.capMax = kwargs.pop('capMax', None)
        self.capAtu = kwargs.pop('capAtu', None)

        super().__init__(*args, **kwargs)

    class Meta:
        model = Mesa
        fields = [
            'numero',
            'posicaox',
            'posicaoy',
            'posicaox1',
            'posicaoy1',
            'maximopessoas',
        ]
    
    def clean(self):
        numero = self.cleaned_data.get('numero')
        maximopessoas = self.cleaned_data.get('maximopessoas')

        erros = []
        if numero == "" or maximopessoas=="":
            raise forms.ValidationError(f'0')

        print(maximopessoas)
        print("---------")
        print(self.capAtu)
        if numero and Mesa.objects.filter(salaid=self.salaID, numero=numero).exists():
            if numero != self.numero:
                erros.append(forms.ValidationError(f'1'))
        
        if maximopessoas and (self.capAtu - self.maximopessoas + maximopessoas) > self.capMax:
            erros.append(forms.ValidationError(f'2'))
        
        if len(erros)>0:
            raise ValidationError([erros])