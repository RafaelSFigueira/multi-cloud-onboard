from cgitb import lookup
import django_filters
from django_filters import CharFilter, NumberFilter
from .models import *


class NotificacoesFilter(django_filters.FilterSet):
    nome = CharFilter(field_name='nome', lookup_expr='icontains', label = 'Nome')
    class Meta:
        model = Restaurante
        fields = [
            'nome',
        ]
