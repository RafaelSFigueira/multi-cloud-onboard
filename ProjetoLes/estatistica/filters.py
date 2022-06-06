from cgitb import lookup
from datetime import datetime
import django_filters
from django_filters import CharFilter, NumberFilter, DateFilter, TimeFilter, DateTimeFilter
from .models import *


class EstatitisticasFilter1(django_filters.FilterSet):
    dateStart = DateFilter(field_name='dia', lookup_expr='gte')
    dateEnd = DateFilter(field_name='dia', lookup_expr='lte')

    timeStart = TimeFilter(field_name='horainicio', lookup_expr='gte')
    timeEnd = TimeFilter(field_name='horainicio', lookup_expr='lte')

    class Meta:
        model = Reserva
        fields = [
            'dia',
            'horainicio',
        ]

