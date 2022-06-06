# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey and OneToOneField has `on_delete` set to the desired behavior
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
from django.db import models


class AuthGroup(models.Model):
    name = models.CharField(unique=True, max_length=150)

    class Meta:
        managed = False
        db_table = 'auth_group'


class AuthGroupPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)
    permission = models.ForeignKey('AuthPermission', models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_group_permissions'


class AuthPermission(models.Model):
    name = models.CharField(max_length=255)
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING)
    codename = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'auth_permission'
        unique_together = (('content_type', 'codename'),)


class AuthUser(models.Model):
    password = models.CharField(max_length=128)
    last_login = models.DateTimeField(blank=True, null=True)
    is_superuser = models.IntegerField()
    username = models.CharField(unique=True, max_length=150)
    first_name = models.CharField(max_length=150)
    last_name = models.CharField(max_length=150)
    email = models.CharField(max_length=254)
    is_staff = models.IntegerField()
    is_active = models.IntegerField()
    date_joined = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'auth_user'


class AuthUserGroups(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    group = models.ForeignKey(AuthGroup, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_groups'
        unique_together = (('user', 'group'),)


class AuthUserUserPermissions(models.Model):
    id = models.BigAutoField(primary_key=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)
    permission = models.ForeignKey(AuthPermission, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'auth_user_user_permissions'
        unique_together = (('user', 'permission'),)


class Cadeira(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    mesaid = models.ForeignKey('Mesa', models.DO_NOTHING, db_column='MesaID')  # Field name made lowercase.
    ocupado = models.IntegerField(db_column='Ocupado')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'cadeira'


class CodigosPostaisParcial(models.Model):
    cod_distrito = models.IntegerField(blank=True, null=True)
    cod_concelho = models.IntegerField(blank=True, null=True)
    nome_localidade = models.CharField(max_length=27, blank=True, null=True)
    num_cod_postal = models.IntegerField(blank=True, null=True)
    ext_cod_postal = models.IntegerField(blank=True, null=True)
    desig_postal = models.CharField(max_length=12, blank=True, null=True)
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'codigos_postais_parcial'


class Concelhos(models.Model):
    cod_distrito = models.CharField(max_length=2, blank=True, null=True)
    cod_concelho = models.CharField(max_length=2, blank=True, null=True)
    nome_concelho = models.CharField(max_length=27, blank=True, null=True)
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'concelhos'


class Distritos(models.Model):
    cod_distrito = models.CharField(max_length=2, blank=True, null=True)
    nome_distrito = models.CharField(max_length=19, blank=True, null=True)
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'distritos'


class DjangoAdminLog(models.Model):
    action_time = models.DateTimeField()
    object_id = models.TextField(blank=True, null=True)
    object_repr = models.CharField(max_length=200)
    action_flag = models.PositiveSmallIntegerField()
    change_message = models.TextField()
    content_type = models.ForeignKey('DjangoContentType', models.DO_NOTHING, blank=True, null=True)
    user = models.ForeignKey(AuthUser, models.DO_NOTHING)

    class Meta:
        managed = False
        db_table = 'django_admin_log'


class DjangoContentType(models.Model):
    app_label = models.CharField(max_length=100)
    model = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'django_content_type'
        unique_together = (('app_label', 'model'),)


class DjangoMigrations(models.Model):
    id = models.BigAutoField(primary_key=True)
    app = models.CharField(max_length=255)
    name = models.CharField(max_length=255)
    applied = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_migrations'


class DjangoSession(models.Model):
    session_key = models.CharField(primary_key=True, max_length=40)
    session_data = models.TextField()
    expire_date = models.DateTimeField()

    class Meta:
        managed = False
        db_table = 'django_session'


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
    tipofuncionarioid = models.ForeignKey('Tipofuncionario', models.DO_NOTHING, db_column='TipoFuncionarioID')  # Field name made lowercase.
    restauranteid = models.ForeignKey('Restaurante', models.DO_NOTHING, db_column='RestauranteID', blank=True, null=True)  # Field name made lowercase.
    nome = models.CharField(db_column='Nome', max_length=30, blank=True, null=True)  # Field name made lowercase.
    telefone = models.BigIntegerField(db_column='Telefone', blank=True, null=True)  # Field name made lowercase.
    email = models.CharField(db_column='Email', max_length=100, blank=True, null=True)  # Field name made lowercase.
    password = models.CharField(db_column='Password', max_length=150, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'funcionario'


class FuncionarioNotificacao(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    funcionarioid_recetor = models.ForeignKey(Funcionario, models.DO_NOTHING, db_column='FuncionarioID_Recetor')  # Field name made lowercase.
    funcionarioid = models.ForeignKey(Funcionario, models.DO_NOTHING, db_column='FuncionarioID')  # Field name made lowercase.
    visto = models.IntegerField()
    menurestauranteid = models.ForeignKey('Menurestaurante', models.DO_NOTHING, db_column='MenuRestauranteID', blank=True, null=True)  # Field name made lowercase.
    pedidoid = models.ForeignKey('Pedido', models.DO_NOTHING, db_column='PedidoID', blank=True, null=True)  # Field name made lowercase.
    data = models.DateTimeField(db_column='Data')  # Field name made lowercase.
    notificacaoid = models.ForeignKey('Notificacao', models.DO_NOTHING, db_column='NotificacaoID')  # Field name made lowercase.
    nome_restaurante = models.CharField(db_column='Nome restaurante', max_length=30, blank=True, null=True)  # Field name made lowercase. Field renamed to remove unsuitable characters.

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
    funcionarioid = models.ForeignKey(Funcionario, models.DO_NOTHING, db_column='FuncionarioID')  # Field name made lowercase.
    estadosmenuid = models.ForeignKey(Estadosmenu, models.DO_NOTHING, db_column='EstadosMenuID')  # Field name made lowercase.
    datainicio = models.DateField(db_column='DataInicio', blank=True, null=True)  # Field name made lowercase.
    datafim = models.DateField(db_column='DataFim', blank=True, null=True)  # Field name made lowercase.
    restauranteid = models.ForeignKey('Restaurante', models.DO_NOTHING, db_column='RestauranteID')  # Field name made lowercase.
    nome = models.CharField(db_column='Nome', max_length=30, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'menurestaurante'


class Mesa(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    salaid = models.ForeignKey('Sala', models.DO_NOTHING, db_column='SalaID', blank=True, null=True)  # Field name made lowercase.
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
    notificacaoid = models.OneToOneField(Notificacao, models.DO_NOTHING, db_column='NotificacaoID', primary_key=True)  # Field name made lowercase.
    restauranteid = models.ForeignKey('Restaurante', models.DO_NOTHING, db_column='RestauranteID')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'notificacao_restaurante'
        unique_together = (('notificacaoid', 'restauranteid'),)


class Pedido(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    funcionarioid = models.ForeignKey(Funcionario, models.DO_NOTHING, db_column='FuncionarioID')  # Field name made lowercase.
    faturaid = models.ForeignKey(Fatura, models.DO_NOTHING, db_column='FaturaID', blank=True, null=True)  # Field name made lowercase.
    reservaid = models.ForeignKey('Reserva', models.DO_NOTHING, db_column='ReservaID', blank=True, null=True)  # Field name made lowercase.
    cadeiraid = models.ForeignKey(Cadeira, models.DO_NOTHING, db_column='CadeiraID', blank=True, null=True)  # Field name made lowercase.
    precototal = models.FloatField(db_column='PrecoTotal')  # Field name made lowercase.
    dataabertura = models.DateTimeField(db_column='DataAbertura', blank=True, null=True)  # Field name made lowercase.
    dataencerramento = models.DateTimeField(db_column='DataEncerramento', blank=True, null=True)  # Field name made lowercase.
    takeaway = models.IntegerField(db_column='TakeAway')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'pedido'


class Produto(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    tipoprodutoid = models.ForeignKey('Tipoproduto', models.DO_NOTHING, db_column='TipoProdutoID')  # Field name made lowercase.
    nome = models.CharField(db_column='Nome', max_length=30, blank=True, null=True)  # Field name made lowercase.
    preco = models.FloatField(db_column='Preco')  # Field name made lowercase.
    quantidade = models.BigIntegerField(db_column='Quantidade')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'produto'


class ProdutoIngredientes(models.Model):
    produtoid = models.OneToOneField(Produto, models.DO_NOTHING, db_column='ProdutoID', primary_key=True)  # Field name made lowercase.
    ingredientesid = models.ForeignKey(Ingredientes, models.DO_NOTHING, db_column='IngredientesID')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'produto_ingredientes'
        unique_together = (('produtoid', 'ingredientesid'),)


class ProdutoMenurestaurante(models.Model):
    produtoid = models.OneToOneField(Produto, models.DO_NOTHING, db_column='ProdutoID', primary_key=True)  # Field name made lowercase.
    menurestauranteid = models.ForeignKey(Menurestaurante, models.DO_NOTHING, db_column='MenuRestauranteID')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'produto_menurestaurante'
        unique_together = (('produtoid', 'menurestauranteid'),)


class ProdutoPedido(models.Model):
    produtoid = models.OneToOneField(Produto, models.DO_NOTHING, db_column='ProdutoID', primary_key=True)  # Field name made lowercase.
    pedidoid = models.ForeignKey(Pedido, models.DO_NOTHING, db_column='PedidoID')  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'produto_pedido'
        unique_together = (('produtoid', 'pedidoid'),)


class Reserva(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    funcionarioid = models.ForeignKey(Funcionario, models.DO_NOTHING, db_column='FuncionarioID', blank=True, null=True)  # Field name made lowercase.
    restauranteid = models.ForeignKey('Restaurante', models.DO_NOTHING, db_column='RestauranteID')  # Field name made lowercase.
    nomecliente = models.CharField(db_column='NomeCliente', max_length=30, blank=True, null=True)  # Field name made lowercase.
    telefonecliente = models.BigIntegerField(db_column='TelefoneCliente', blank=True, null=True)  # Field name made lowercase.
    numeropessoas = models.IntegerField(db_column='NumeroPessoas', blank=True, null=True)  # Field name made lowercase.
    nota = models.CharField(db_column='Nota', max_length=255, blank=True, null=True)  # Field name made lowercase.
    dia = models.DateField(db_column='Dia', blank=True, null=True)  # Field name made lowercase.
    horainicio = models.TimeField(db_column='HoraInicio', blank=True, null=True)  # Field name made lowercase.
    mesaid = models.ForeignKey(Mesa, models.DO_NOTHING, db_column='MesaID')  # Field name made lowercase.
    clienteid = models.ForeignKey(Funcionario, models.DO_NOTHING, db_column='ClienteID', blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'reserva'


class ReservaMesa(models.Model):
    reservaid = models.OneToOneField(Reserva, models.DO_NOTHING, db_column='ReservaID', primary_key=True)  # Field name made lowercase.
    mesaid = models.ForeignKey(Mesa, models.DO_NOTHING, db_column='MesaID')  # Field name made lowercase.

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
    codigo = models.CharField(db_column='Codigo', max_length=10, blank=True, null=True)  # Field name made lowercase.
    cidade = models.CharField(db_column='Cidade', max_length=30, blank=True, null=True)  # Field name made lowercase.
    abertura = models.TimeField(db_column='Abertura', blank=True, null=True)  # Field name made lowercase.
    fecho = models.TimeField(db_column='Fecho', blank=True, null=True)  # Field name made lowercase.
    distrito = models.CharField(db_column='Distrito', max_length=30, blank=True, null=True)  # Field name made lowercase.
    imagem = models.CharField(db_column='Imagem', max_length=150, blank=True, null=True)  # Field name made lowercase.
    abertura_tarde = models.TimeField(db_column='Abertura_Tarde', blank=True, null=True)  # Field name made lowercase.
    fecho_tarde = models.TimeField(db_column='Fecho_Tarde', blank=True, null=True)  # Field name made lowercase.
    dia_fecho = models.CharField(db_column='Dia_Fecho', max_length=30, blank=True, null=True)  # Field name made lowercase.

    class Meta:
        managed = False
        db_table = 'restaurante'


class Sala(models.Model):
    id = models.AutoField(db_column='ID', primary_key=True)  # Field name made lowercase.
    restauranteid = models.ForeignKey(Restaurante, models.DO_NOTHING, db_column='RestauranteID', blank=True, null=True)  # Field name made lowercase.
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
