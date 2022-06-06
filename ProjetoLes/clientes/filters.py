from cgitb import lookup
import django_filters
from django_filters import CharFilter, NumberFilter, DateFilter
from .models import *


class RestaurantesFilter(django_filters.FilterSet):

    nome = CharFilter(field_name='nome', lookup_expr='icontains', label = 'Nome')
    numerotelefone = NumberFilter(field_name='numerotelefone', lookup_expr='icontains', label='Número de telefone')
    cidade = CharFilter(field_name='cidade', lookup_expr='icontains', label = 'Nome')
    class Meta:
        model = Restaurante
        fields = [
            'nome',
            'numerotelefone',
            'cidade',
        ]

class MesasFilter(django_filters.FilterSet):
    numero = NumberFilter(field_name='numero', label='Número')
    cidade = CharFilter(field_name='cidade', lookup_expr='icontains', label = 'Nome')
    class Meta:
        model = Restaurante
        fields = [
            'nome',
            'numerotelefone',
            'cidade',
        ]

class ReservasFiler(django_filters.FilterSet):
    DataInicio = DateFilter(field_name='dia', lookup_expr='gte')
    DataFim = DateFilter(field_name='dia', lookup_expr='lte')
    class Meta:
        model = Reserva
        fields = [
            'restauranteid',
            'dia',
        ]