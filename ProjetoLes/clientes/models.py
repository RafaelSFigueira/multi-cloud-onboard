# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class Cadeira(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    mesaid = models.ForeignKey('Mesa', on_delete=models.CASCADE, db_column='MesaID')  # Field name made lowercase.
    ocupado = models.IntegerField(db_column='Ocupado')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'cadeira'


class Estadosmenu(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    estado = models.CharField(db_column='Estado', max_length=30, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'estadosmenu'


class Fatura(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    nomecliente = models.CharField(db_column='NomeCliente', max_length=30, blank=True, null=True)  # Field name made lowercase.
    numerocontribuinte = models.BigIntegerField(db_column='NumeroContribuinte')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'fatura'


class Funcionario(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    tipofuncionarioid = models.ForeignKey('Tipofuncionario', on_delete=models.CASCADE, db_column='TipoFuncionarioID')  # Field name made lowercase.
    restauranteid = models.ForeignKey('Restaurante', on_delete=models.CASCADE, db_column='RestauranteID', blank=True, null=True)  # Field name made lowercase.
    nome = models.CharField(db_column='Nome', max_length=30, blank=True, null=True)  # Field name made lowercase.
    telefone = models.BigIntegerField(db_column='Telefone', blank=True, null=True)  # Field name made lowercase.
    email = models.CharField(db_column='Email', max_length=100, blank=True, null=True)  # Field name made lowercase.
    password = models.CharField(db_column='Password', max_length=150, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'funcionario'


class FuncionarioNotificacao(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    funcionarioid_recetor = models.ForeignKey(Funcionario, on_delete=models.CASCADE, db_column='FuncionarioID_Recetor')  # Field name made lowercase.
    funcionarioid = models.IntegerField()  # Field name made lowercase.
    visto = models.IntegerField()
    menurestauranteid = models.ForeignKey('Menurestaurante', on_delete=models.CASCADE, db_column='MenuRestauranteID', blank=True, null=True)  # Field name made lowercase.
    pedidoid = models.ForeignKey('Pedido', on_delete=models.CASCADE, db_column='PedidoID', blank=True, null=True)  # Field name made lowercase.
    data = models.DateTimeField(db_column='Data')  # Field name made lowercase.
    notificacaoid = models.ForeignKey('Notificacao', on_delete=models.CASCADE, db_column='NotificacaoID')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'funcionario_notificacao'


class Ingredientes(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    nome = models.CharField(db_column='Nome', max_length=30, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'ingredientes'


class Menurestaurante(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    funcionarioid = models.ForeignKey(Funcionario, on_delete=models.CASCADE, db_column='FuncionarioID')  # Field name made lowercase.
    estadosmenuid = models.ForeignKey(Estadosmenu, on_delete=models.CASCADE, db_column='EstadosMenuID')  # Field name made lowercase.
    datainicio = models.DateField(db_column='DataInicio', blank=True, null=True)  # Field name made lowercase.
    datafim = models.DateField(db_column='DataFim', blank=True, null=True)  # Field name made lowercase.
    restauranteid = models.ForeignKey('Restaurante', on_delete=models.CASCADE, db_column='RestauranteID')  # Field name made lowercase.
    nome = models.CharField(db_column='Nome', max_length=30, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'menurestaurante'


class Mesa(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    salaid = models.ForeignKey('Sala', on_delete=models.CASCADE, db_column='SalaID', blank=True, null=True)  # Field name made lowercase.
    numero = models.IntegerField(db_column='Numero', blank=True, null=True)  # Field name made lowercase.
    maximopessoas = models.IntegerField(db_column='MaximoPessoas')  # Field name made lowercase.
    limpeza = models.IntegerField(db_column='Limpeza')  # Field name made lowercase.
    ocupada = models.IntegerField(db_column='Ocupada')  # Field name made lowercase.
    reservada = models.IntegerField(db_column='Reservada')  # Field name made lowercase.
    posicaox = models.IntegerField(db_column='Posicaox')  # Field name made lowercase.
    posicaoy = models.IntegerField(db_column='Posicaoy')  # Field name made lowercase.
    posicaox1 = models.IntegerField(db_column='Posicaox1')  # Field name made lowercase.
    posicaoy1 = models.IntegerField(db_column='Posicaoy1')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'mesa'


class Notificacao(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    template = models.CharField(db_column='Template', max_length=255, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'notificacao'


class NotificacaoRestaurante(models.Model):
    notificacaoid = models.OneToOneField(Notificacao, on_delete=models.CASCADE, db_column='NotificacaoID', primary_key=True)  # Field name made lowercase.
    restauranteid = models.ForeignKey('Restaurante', on_delete=models.CASCADE, db_column='RestauranteID')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'notificacao_restaurante'
        unique_together = (('notificacaoid', 'restauranteid'),)


class Pedido(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    funcionarioid = models.ForeignKey(Funcionario, on_delete=models.CASCADE, db_column='FuncionarioID')  # Field name made lowercase.
    faturaid = models.ForeignKey(Fatura, on_delete=models.CASCADE, db_column='FaturaID')  # Field name made lowercase.
    reservaid = models.ForeignKey('Reserva', on_delete=models.CASCADE, db_column='ReservaID', blank=True, null=True)  # Field name made lowercase.
    cadeiraid = models.ForeignKey(Cadeira, on_delete=models.CASCADE, db_column='CadeiraID', blank=True, null=True)  # Field name made lowercase.
    precototal = models.FloatField(db_column='PrecoTotal')  # Field name made lowercase.
    dataabertura = models.DateField(db_column='DataAbertura', blank=True, null=True)  # Field name made lowercase.
    dataencerramento = models.DateField(db_column='DataEncerramento', blank=True, null=True)  # Field name made lowercase.
    takeaway = models.IntegerField(db_column='TakeAway')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'pedido'


class Produto(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    tipoprodutoid = models.ForeignKey('Tipoproduto', on_delete=models.CASCADE, db_column='TipoProdutoID')  # Field name made lowercase.
    nome = models.CharField(db_column='Nome', max_length=30, blank=True, null=True)  # Field name made lowercase.
    preco = models.FloatField(db_column='Preco')  # Field name made lowercase.
    quantidade = models.BigIntegerField(db_column='Quantidade')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'produto'


class ProdutoIngredientes(models.Model):
    produtoid = models.OneToOneField(Produto, on_delete=models.CASCADE, db_column='ProdutoID', primary_key=True)  # Field name made lowercase.
    ingredientesid = models.ForeignKey(Ingredientes, on_delete=models.CASCADE, db_column='IngredientesID')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'produto_ingredientes'
        unique_together = (('produtoid', 'ingredientesid'),)


class ProdutoMenurestaurante(models.Model):
    produtoid = models.OneToOneField(Produto, on_delete=models.CASCADE, db_column='ProdutoID', primary_key=True)  # Field name made lowercase.
    menurestauranteid = models.ForeignKey(Menurestaurante, on_delete=models.CASCADE, db_column='MenuRestauranteID')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'produto_menurestaurante'
        unique_together = (('produtoid', 'menurestauranteid'),)


class ProdutoPedido(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    produtoid = models.OneToOneField(Produto, on_delete=models.CASCADE, db_column='ProdutoID')  # Field name made lowercase.
    pedidoid = models.ForeignKey(Pedido, on_delete=models.CASCADE, db_column='PedidoID')  # Field name made lowercase.
    quantidade = models.IntegerField()

    class Meta:
        managed = False
        db_table = 'produto_pedido'
        unique_together = (('produtoid', 'pedidoid'),)


class Reserva(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    funcionarioid = models.ForeignKey(Funcionario, on_delete=models.CASCADE, db_column='FuncionarioID')  # Field name made lowercase.
    restauranteid = models.ForeignKey('Restaurante', on_delete=models.CASCADE, db_column='RestauranteID')  # Field name made lowercase.
    nomecliente = models.CharField(db_column='NomeCliente', max_length=30, blank=True, null=True)  # Field name made lowercase.
    telefonecliente = models.BigIntegerField(db_column='TelefoneCliente', blank=True, null=True)  # Field name made lowercase.
    numeropessoas = models.IntegerField(db_column='NumeroPessoas', blank=True, null=True)  # Field name made lowercase.
    nota = models.CharField(db_column='Nota', max_length=255, blank=True, null=True)  # Field name made lowercase.
    dia = models.DateField(db_column='Dia', blank=True, null=True)  # Field name made lowercase.
    horainicio = models.TimeField(db_column='HoraInicio', blank=True, null=True)  # Field name made lowercase.
    mesaid = models.ForeignKey(Mesa, on_delete=models.CASCADE, db_column='MesaID',null=True)  # Field name made lowercase.
    clienteid = models.IntegerField()  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'reserva'


class ReservaMesa(models.Model):
    reservaid = models.OneToOneField(Reserva, on_delete=models.CASCADE, db_column='ReservaID', primary_key=True)  # Field name made lowercase.
    mesaid = models.ForeignKey(Mesa, on_delete=models.CASCADE, db_column='MesaID')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'reserva_mesa'
        unique_together = (('reservaid', 'mesaid'),)


class Restaurante(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    nome = models.CharField(db_column='Nome', max_length=30, blank=True, null=True)  # Field name made lowercase.
    
    numerotelefone = models.BigIntegerField(db_column='NumeroTelefone')  # Field name made lowercase.
    rua = models.CharField(db_column='Rua', max_length=100, blank=True, null=True)  # Field name made lowercase.
    numero_andar = models.CharField(db_column='Numero_andar', max_length=30, blank=True, null=True)  # Field name made lowercase.
    codigo = models.CharField(db_column='Codigo', max_length=10,blank=True, null=True)  # Field name made lowercase.
    cidade = models.CharField(db_column='Cidade', max_length=30, blank=True, null=True)  # Field name made lowercase.
    distrito = models.CharField(db_column='Distrito', max_length=30, blank=True, null=True)  # Field name made lowercase.
    abertura = models.TimeField(db_column='Abertura', blank=True, null=True)  # Field name made lowercase.
    fecho = models.TimeField(db_column='Fecho', blank=True, null=True)  # Field name made lowercase.
    imagem = models.ImageField(upload_to="images/")
    abertura_tarde = models.TimeField(db_column='Abertura_Tarde', blank=True, null=True)  # Field name made lowercase.
    fecho_tarde = models.TimeField(db_column='Fecho_Tarde', blank=True, null=True)  # Field name made lowercase.
    
    def __str__(self):
        return self.nome

    class Meta:
        managed = False
        db_table = 'restaurante'


class Sala(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    restauranteid = models.ForeignKey(Restaurante, on_delete=models.CASCADE, db_column='RestauranteID', blank=True, null=True)  # Field name made lowercase.
    capacidade = models.IntegerField(db_column='Capacidade')  # Field name made lowercase.
    nomesala = models.CharField(db_column='NomeSala', max_length=30, blank=True, null=True)  # Field name made lowercase.
    fumador = models.IntegerField(db_column='Fumador')  # Field name made lowercase.
    tiposala = models.CharField(db_column='TipoSala', max_length=20, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'sala'


class Tipofuncionario(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    nome = models.CharField(db_column='Nome', max_length=30, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'tipofuncionario'


class Tipoproduto(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    nome = models.CharField(db_column='Nome', max_length=30, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'tipoproduto'
