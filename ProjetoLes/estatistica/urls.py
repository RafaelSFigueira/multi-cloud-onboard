from django.urls import path

from . import views

urlpatterns = [
    path('', views.EditorChartView.as_view(), name='index'),
    path("VisualizarEstatisticas_epaco_1", views.VisualizarEstatisticas_epaco_1, name="VisualizarEstatisticas_epaco_1"),

    path("VisualizarEstatisticas_epaco_3", views.VisualizarEstatisticas_epaco_3, name="VisualizarEstatisticas_epaco_3"),
    path("VisualizarEstatisticas", views.VisualizarEstatisticas, name="VisualizarEstatisticas"),
    
]