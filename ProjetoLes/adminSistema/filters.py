from cgitb import lookup
import django_filters
from django_filters import CharFilter, NumberFilter
from .models import *


class RestaurantesFilter(django_filters.FilterSet):

    nome = CharFilter(field_name='nome', lookup_expr='icontains', label = 'Nome')
    numerotelefone = NumberFilter(field_name='numerotelefone', lookup_expr='icontains', label='Número de telefone')
    cidade = CharFilter(field_name='cidade', lookup_expr='icontains', label = 'Nome')
    estado = CharFilter(field_name='estado', label = 'Estado')
    class Meta:
        model = Restaurante
        fields = [
            'nome',
            'numerotelefone',
            'cidade',
        ]

class RestaurantesFilter2(django_filters.FilterSet):

    res = CharFilter(field_name='nome', lookup_expr='icontains', label = 'Nome')
    class Meta:
        model = Restaurante
        fields = [
            'res',
        ]


class FuncionariosFilter(django_filters.FilterSet):
    nome = CharFilter(field_name='nome', lookup_expr='icontains', label = 'Nome')
    class Meta:
        model = Funcionario
        fields = [
            'nome',
        ]