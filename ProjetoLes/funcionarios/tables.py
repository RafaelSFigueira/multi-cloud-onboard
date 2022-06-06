import django_tables2 as tables
from .models import *

class FuncionariosTable(tables.Table):
    class Meta:
        model = Funcionario
        sequence = ("id", "tipofuncionarioid", "restauranteid", "nome", "telefone", "email" )
        exclude = ("password", )