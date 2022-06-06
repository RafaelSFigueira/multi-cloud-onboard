from datetime import datetime
import calendar
from .models import *

##############################################################################################################################
#########                                                                                                            #########
#########                                    Número médio de pessoas por grupo                                       #########
#########                                                                                                            #########
##############################################################################################################################

def grupo_ciclo(reservas_2):
    count = 0
    data = 0
    for reserva in reservas_2:
        count += reserva.numeropessoas
    if count != 0:
        data = float(count/reservas_2.count())
    else:
        data = 0
    return data
def grupo_horas(horaInicio, HoraFim, reservas):
    dias = []
    data = []
    horas = horaInicio.split(":")
    inicio = int(horas[0])
    horas = HoraFim.split(":")
    fim = int(horas[0])
    for hora in range(inicio, fim+1):
        dias.append(str(hora) + ":00")
        reservas_2 = reservas.filter(horainicio__hour = hora)
        data.append(grupo_ciclo(reservas_2=reservas_2))
    return dias, data

def grupo_dias(data_inicio, data_fim, reservas):
    meses_arr = ["janeiro", "fevereiro", "março", "abril", "maio", "junho", "julho", "agosto", "setembro", "outubro", "novembro", "dezembro"]
    dias = []
    data = []
    dateStart = datetime.strptime(data_inicio,"%Y-%m-%d").date() 
    dateEnd = datetime.strptime(data_fim,"%Y-%m-%d").date()
    edge = calendar.monthrange(dateStart.year, dateStart.month)
    count = 0
    if dateEnd.month != dateStart.month:
        dias = [k for k in range(dateStart.day, edge[1]+1)]
        dias2 = [k for k in range(1, dateEnd.day + 1)]
        for dia in dias:
            reser = reservas.filter(dia__year=dateStart.year, dia__month=dateStart.month, dia__day=dia)
            data.append(grupo_ciclo(reservas_2=reser))

            dias[count] = str(dia) + " " + meses_arr[dateStart.month-1]
            count +=1
        count = 0
        for dia in dias2:
            reser = reservas.filter(dia__year=dateEnd.year, dia__month=dateEnd.month, dia__day=dia)
            data.append(grupo_ciclo(reservas_2=reser))
            dias2[count] = str(dia) + " " + meses_arr[dateEnd.month-1]
            count +=1
        dias = dias + dias2
    else:
        dias = [k for k in range(dateStart.day, dateEnd.day + 1)]
        for dia in dias:
            reser = reservas.filter(dia__year=dateStart.year, dia__month=dateStart.month, dia__day=dia)
            data.append(grupo_ciclo(reservas_2=reser))
    return dias, data

def grupo_meses(data_inicio, data_fim, reservas):
    meses_arr = ["janeiro", "fevereiro", "março", "abril", "maio", "junho", "julho", "agosto", "setembro", "outubro", "novembro", "dezembro"]
    dias = []
    data = []
    dateStart = datetime.strptime(data_inicio,"%Y-%m-%d").date() 
    dateEnd = datetime.strptime(data_fim,"%Y-%m-%d").date()
    if dateStart.year == dateEnd.year:
        for mes in range(dateStart.month, dateEnd.month+1):
            dias.append(meses_arr[mes-1])
            reservas2 = reservas.filter(dia__year = dateStart.year, dia__month = mes)
            data.append(grupo_ciclo(reservas_2=reservas2))
        return dias, data

    for mes in range(dateStart.month, 13):
        texto = str(meses_arr[mes-1]) + "  " + str(dateStart.year)
        dias.append(texto)
        reservas2 = reservas.filter(dia__year = dateStart.year, dia__month = mes)
        data.append(grupo_ciclo(reservas_2=reservas2))
    if (dateStart.year + 1) != dateEnd.year:
        for mes in range(1, 13):
            texto = str(meses_arr[mes-1]) + "  " + str(dateStart.year + 1)
            dias.append(texto)
            reservas2 = reservas.filter(dia__year = dateStart.year + 1, dia__month = mes)
            data.append(grupo_ciclo(reservas_2=reservas2))

    for mes in range(1, dateEnd.month+1):
        texto = str(meses_arr[mes-1]) + "  " + str(dateEnd.year)
        dias.append(texto)
        reservas2 = reservas.filter(dia__year = dateEnd.year, dia__month = mes)
        data.append(grupo_ciclo(reservas_2=reservas2))

    return dias, data
def grupo_anos(data_inicio, data_fim, reservas):
    dias = []
    data = []
    dateStart = datetime.strptime(data_inicio,"%Y-%m-%d").date() 
    dateEnd = datetime.strptime(data_fim,"%Y-%m-%d").date()
    for ano in range(dateStart.year, dateEnd.year+1):
        dias.append(ano)
        reservas2 = reservas.filter(dia__year = ano)
        data.append(grupo_ciclo(reservas_2=reservas2))


    return dias, data
def grupos_estatistica(dateInicio, dateFim, horInicio, horFim, reservas):
    dateStart = datetime.strptime(dateInicio,"%Y-%m-%d").date() 
    dateEnd = datetime.strptime(dateFim,"%Y-%m-%d").date() 
    k = dateEnd - dateStart
    if(k.days <= 1): #horas
        tipo = "Horas"
        valores = grupo_horas(horaInicio= horInicio, HoraFim= horFim, reservas=reservas)
    elif(k.days <= 31): #dias
        tipo = "Dias"
        valores = grupo_dias(data_inicio = dateInicio, data_fim = dateFim, reservas=reservas)
    elif k.days <= 730: #meses
        tipo = "Meses"
        valores = grupo_meses(data_inicio= dateInicio, data_fim= dateFim, reservas=reservas)
    else:
        tipo = "Anos"
        valores = grupo_anos(data_inicio= dateInicio, data_fim= dateFim, reservas=reservas)
    return valores[0], valores[1], tipo



##############################################################################################################################
#########                                                                                                            #########
#########                        Tempo médio que os clientes permanecem no restaurante                               #########
#########                                                                                                            #########
##############################################################################################################################
def ciclo_cond(pedidos_2):
    count_min = 0
    count_horas = 0
    data = 0
    for pedido in pedidos_2:
        t_inicial_hora = pedido.dataabertura.hour
        t_inicial_min = pedido.dataabertura.minute
        t_final_hora = pedido.dataencerramento.hour
        t_final_min = pedido.dataencerramento.minute

        count_horas += t_final_hora - t_inicial_hora
        count_min += t_final_min - t_inicial_min
    if count_horas == 0 and count_min == 0:
        data = 0
    else:
        count_horas /= pedidos_2.count()
        count_min /= pedidos_2.count()
        while count_min < 0:
            count_min += 60
            count_horas -= 1
        while count_min >= 60:
            count_min -= 60
            count_horas += 1
        count_min = float(count_min)


        data = (count_horas * 60) + count_min
    return data
    

def permanecem_horas(horaInicio, HoraFim, pedidos):
    dias = []
    data = []
    horas = horaInicio.split(":")
    inicio = int(horas[0])
    horas = HoraFim.split(":")
    dados = 0
    fim = int(horas[0])
    for hora in range(inicio, fim+1):
        dias.append(str(hora) + ":00")
        pedidos_2 = pedidos.filter(dataabertura__hour = hora)
        dados = ciclo_cond(pedidos_2=pedidos_2)
        data.append(dados)
    return dias, data

def permanecem_dias(data_inicio, data_fim, pedidos):
    meses_arr = ["janeiro", "fevereiro", "março", "abril", "maio", "junho", "julho", "agosto", "setembro", "outubro", "novembro", "dezembro"]
    dias = []
    data = []
    dateStart = datetime.strptime(data_inicio,"%Y-%m-%d").date() 
    dateEnd = datetime.strptime(data_fim,"%Y-%m-%d").date()
    edge = calendar.monthrange(dateStart.year, dateStart.month)
    count = 0
    if dateEnd.month != dateStart.month:
        dias = [k for k in range(dateStart.day, edge[1]+1)]
        dias2 = [k for k in range(1, dateEnd.day + 1)]
        for dia in dias:
            pedidos_2 = pedidos.filter(dataabertura__year=dateStart.year, dataabertura__month = dateStart.month, dataabertura__day = dia)
            dados = ciclo_cond(pedidos_2=pedidos_2)
            data.append(dados)
            dias[count] = str(dia) + " " + meses_arr[dateStart.month-1]
            count +=1

        count = 0
        for dia in dias2:
            pedidos_2 = pedidos.filter(dataabertura__year=dateEnd.year, dataabertura__month = dateEnd.month, dataabertura__day = dia)
            dados = ciclo_cond(pedidos_2=pedidos_2)
            data.append(dados)
            dias2[count] = str(dia) + " " + meses_arr[dateEnd.month-1]
            count +=1
        dias = dias + dias2
    else:
        dias = [k for k in range(dateStart.day, dateEnd.day + 1)]
        for dia in dias:
            pedidos_2 = pedidos.filter(dataabertura__year=dateStart.year, dataabertura__month = dateStart.month, dataabertura__day = dia)
            dados = ciclo_cond(pedidos_2=pedidos_2)
            data.append(dados)
    return dias, data




def permanecem_meses(data_inicio, data_fim, pedidos):
    meses_arr = ["janeiro", "fevereiro", "março", "abril", "maio", "junho", "julho", "agosto", "setembro", "outubro", "novembro", "dezembro"]
    dias = []
    data = []
    dateStart = datetime.strptime(data_inicio,"%Y-%m-%d").date() 
    dateEnd = datetime.strptime(data_fim,"%Y-%m-%d").date()
    if dateStart.year == dateEnd.year:
        for mes in range(dateStart.month, dateEnd.month+1):
            dias.append(meses_arr[mes-1])
            pedidos_2 = pedidos.filter(dataabertura__year=dateStart.year, dataabertura__month = mes)
            dados = ciclo_cond(pedidos_2=pedidos_2)
            data.append(dados)
        return dias, data

    for mes in range(dateStart.month, 13):
        texto = str(meses_arr[mes-1]) + "  " + str(dateStart.year)
        dias.append(texto)
        pedidos_2 = pedidos.filter(dataabertura__year=dateStart.year, dataabertura__month = mes)
        dados = ciclo_cond(pedidos_2=pedidos_2)
        data.append(dados)
    if (dateStart.year + 1) != dateEnd.year:
        for mes in range(1, 13):
            texto = str(meses_arr[mes-1]) + "  " + str(dateStart.year + 1)
            dias.append(texto)
            pedidos_2 = pedidos.filter(dataabertura__year=dateStart.year+1, dataabertura__month = mes)
            dados = ciclo_cond(pedidos_2=pedidos_2)
            data.append(dados)

    for mes in range(1, dateEnd.month+1):
        texto = str(meses_arr[mes-1]) + "  " + str(dateEnd.year)
        dias.append(texto)
        pedidos_2 = pedidos.filter(dataabertura__year=dateEnd.year, dataabertura__month = mes)
        dados = ciclo_cond(pedidos_2=pedidos_2)
        data.append(dados)


    return dias, data
def permanecem_anos(data_inicio, data_fim, pedidos):
    dias = []
    data = []
    dateStart = datetime.strptime(data_inicio,"%Y-%m-%d").date() 
    dateEnd = datetime.strptime(data_fim,"%Y-%m-%d").date()
    for ano in range(dateStart.year, dateEnd.year+1):
        dias.append(ano)
        pedidos_2 = pedidos.filter(dataabertura__year=ano)
        dados = ciclo_cond(pedidos_2=pedidos_2)
        data.append(dados)


    return dias, data
def permanecem_pedidos(dateInicio, dateFim, horInicio, horFim, pedidos):
    dateStart = datetime.strptime(dateInicio,"%Y-%m-%d").date() 
    dateEnd = datetime.strptime(dateFim,"%Y-%m-%d").date() 
    k = dateEnd - dateStart
    tipo = ""
    if(k.days <= 1): #horas
        valores = permanecem_horas(horaInicio= horInicio, HoraFim= horFim, pedidos=pedidos)
        tipo = "Horas"
    elif(k.days <= 31): #dias
        valores = permanecem_dias(data_inicio = dateInicio, data_fim = dateFim, pedidos=pedidos)
        tipo = "Dias"
    elif k.days <= 730: #meses
        tipo = "Meses"
        valores = permanecem_meses(data_inicio= dateInicio, data_fim= dateFim, pedidos=pedidos)

    else:
        tipo = "Anos"
        valores = permanecem_anos(data_inicio= dateInicio, data_fim= dateFim, pedidos=pedidos)
    return valores[0], valores[1], tipo
