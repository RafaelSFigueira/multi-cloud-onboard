# Generated by Django 4.0.3 on 2022-05-03 21:54

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
    ]

    operations = [
        migrations.CreateModel(
            name='Cadeira',
            fields=[
                ('id', models.AutoField(db_column='ID', primary_key=True, serialize=False)),
                ('ocupado', models.IntegerField(db_column='Ocupado')),
            ],
            options={
                'db_table': 'cadeira',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Cliente',
            fields=[
                ('id', models.AutoField(db_column='ID', primary_key=True, serialize=False)),
                ('nome', models.CharField(blank=True, db_column='Nome', max_length=40, null=True)),
                ('numerotelefone', models.IntegerField(db_column='NumeroTelefone')),
                ('email', models.CharField(blank=True, db_column='Email', max_length=100, null=True)),
                ('password', models.CharField(blank=True, db_column='Password', max_length=30, null=True)),
            ],
            options={
                'db_table': 'cliente',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Estadosmenu',
            fields=[
                ('id', models.AutoField(db_column='ID', primary_key=True, serialize=False)),
                ('estado', models.CharField(blank=True, db_column='Estado', max_length=30, null=True)),
            ],
            options={
                'db_table': 'estadosmenu',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Fatura',
            fields=[
                ('id', models.AutoField(db_column='ID', primary_key=True, serialize=False)),
                ('nomecliente', models.CharField(blank=True, db_column='NomeCliente', max_length=30, null=True)),
                ('numerocontribuinte', models.BigIntegerField(db_column='NumeroContribuinte')),
            ],
            options={
                'db_table': 'fatura',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Funcionario',
            fields=[
                ('id', models.AutoField(db_column='ID', primary_key=True, serialize=False)),
                ('nome', models.CharField(blank=True, db_column='Nome', max_length=30, null=True)),
                ('telefone', models.BigIntegerField(blank=True, db_column='Telefone', null=True)),
                ('email', models.CharField(blank=True, db_column='Email', max_length=100, null=True)),
                ('password', models.CharField(blank=True, db_column='Password', max_length=150, null=True)),
            ],
            options={
                'db_table': 'funcionario',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='FuncionarioNotificacao',
            fields=[
                ('id', models.AutoField(db_column='ID', primary_key=True, serialize=False)),
                ('funcionarioid', models.IntegerField()),
                ('visto', models.IntegerField()),
                ('data', models.DateTimeField(db_column='Data')),
            ],
            options={
                'db_table': 'funcionario_notificacao',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Ingredientes',
            fields=[
                ('id', models.AutoField(db_column='ID', primary_key=True, serialize=False)),
                ('nome', models.CharField(blank=True, db_column='Nome', max_length=30, null=True)),
            ],
            options={
                'db_table': 'ingredientes',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Menurestaurante',
            fields=[
                ('id', models.AutoField(db_column='ID', primary_key=True, serialize=False)),
                ('datainicio', models.DateField(blank=True, db_column='DataInicio', null=True)),
                ('datafim', models.DateField(blank=True, db_column='DataFim', null=True)),
                ('nome', models.CharField(blank=True, db_column='Nome', max_length=30, null=True)),
            ],
            options={
                'db_table': 'menurestaurante',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Mesa',
            fields=[
                ('id', models.AutoField(db_column='ID', primary_key=True, serialize=False)),
                ('numero', models.IntegerField(blank=True, db_column='Numero', null=True)),
                ('maximopessoas', models.IntegerField(db_column='MaximoPessoas')),
                ('limpeza', models.IntegerField(db_column='Limpeza')),
                ('ocupada', models.IntegerField(db_column='Ocupada')),
                ('reservada', models.IntegerField(db_column='Reservada')),
                ('posicaox', models.IntegerField(db_column='Posicaox')),
                ('posicaoy', models.IntegerField(db_column='Posicaoy')),
                ('posicaox1', models.IntegerField(db_column='Posicaox1')),
                ('posicaoy1', models.IntegerField(db_column='Posicaoy1')),
            ],
            options={
                'db_table': 'mesa',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Notificacao',
            fields=[
                ('id', models.AutoField(db_column='ID', primary_key=True, serialize=False)),
                ('template', models.CharField(blank=True, db_column='Template', max_length=255, null=True)),
            ],
            options={
                'db_table': 'notificacao',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Pedido',
            fields=[
                ('id', models.AutoField(db_column='ID', primary_key=True, serialize=False)),
                ('precototal', models.FloatField(db_column='PrecoTotal')),
                ('dataabertura', models.DateField(blank=True, db_column='DataAbertura', null=True)),
                ('dataencerramento', models.DateField(blank=True, db_column='DataEncerramento', null=True)),
                ('takeaway', models.IntegerField(db_column='TakeAway')),
            ],
            options={
                'db_table': 'pedido',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Produto',
            fields=[
                ('id', models.AutoField(db_column='ID', primary_key=True, serialize=False)),
                ('nome', models.CharField(blank=True, db_column='Nome', max_length=30, null=True)),
                ('preco', models.FloatField(db_column='Preco')),
                ('quantidade', models.BigIntegerField(db_column='Quantidade')),
            ],
            options={
                'db_table': 'produto',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Reserva',
            fields=[
                ('id', models.AutoField(db_column='ID', primary_key=True, serialize=False)),
                ('nomecliente', models.CharField(blank=True, db_column='NomeCliente', max_length=30, null=True)),
                ('telefonecliente', models.BigIntegerField(blank=True, db_column='TelefoneCliente', null=True)),
                ('numeropessoas', models.IntegerField(blank=True, db_column='NumeroPessoas', null=True)),
                ('nota', models.CharField(blank=True, db_column='Nota', max_length=255, null=True)),
                ('dia', models.DateField(blank=True, db_column='Dia', null=True)),
                ('horainicio', models.TimeField(blank=True, db_column='HoraInicio', null=True)),
            ],
            options={
                'db_table': 'reserva',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Restaurante',
            fields=[
                ('id', models.AutoField(db_column='ID', primary_key=True, serialize=False)),
                ('nome', models.CharField(blank=True, db_column='Nome', max_length=30, null=True)),
                ('morada', models.CharField(blank=True, db_column='Morada', max_length=100, null=True)),
                ('numerotelefone', models.BigIntegerField(db_column='NumeroTelefone')),
                ('rua', models.CharField(blank=True, db_column='Rua', max_length=30, null=True)),
                ('numero_andar', models.CharField(blank=True, db_column='Numero_andar', max_length=30, null=True)),
                ('codigo', models.IntegerField(blank=True, db_column='Codigo', null=True)),
                ('postal', models.IntegerField(blank=True, db_column='Postal', null=True)),
                ('cidade', models.CharField(blank=True, db_column='Cidade', max_length=30, null=True)),
                ('abertura', models.TimeField(blank=True, db_column='Abertura', null=True)),
                ('fecho', models.TimeField(blank=True, db_column='Fecho', null=True)),
                ('distrito', models.CharField(blank=True, db_column='Distrito', max_length=30, null=True)),
                ('imagem', models.CharField(blank=True, db_column='Imagem', max_length=30, null=True)),
            ],
            options={
                'db_table': 'restaurante',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Sala',
            fields=[
                ('id', models.AutoField(db_column='ID', primary_key=True, serialize=False)),
                ('capacidade', models.IntegerField(db_column='Capacidade')),
                ('nomesala', models.CharField(blank=True, db_column='NomeSala', max_length=30, null=True)),
                ('fumador', models.IntegerField(db_column='Fumador')),
                ('tiposala', models.CharField(blank=True, db_column='TipoSala', max_length=20, null=True)),
            ],
            options={
                'db_table': 'sala',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Tipofuncionario',
            fields=[
                ('id', models.AutoField(db_column='ID', primary_key=True, serialize=False)),
                ('nome', models.CharField(blank=True, db_column='Nome', max_length=30, null=True)),
            ],
            options={
                'db_table': 'tipofuncionario',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='Tipoproduto',
            fields=[
                ('id', models.AutoField(db_column='ID', primary_key=True, serialize=False)),
                ('nome', models.CharField(blank=True, db_column='Nome', max_length=30, null=True)),
            ],
            options={
                'db_table': 'tipoproduto',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='NotificacaoRestaurante',
            fields=[
                ('notificacaoid', models.OneToOneField(db_column='NotificacaoID', on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to='clientes.notificacao')),
            ],
            options={
                'db_table': 'notificacao_restaurante',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='ProdutoIngredientes',
            fields=[
                ('produtoid', models.OneToOneField(db_column='ProdutoID', on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to='clientes.produto')),
            ],
            options={
                'db_table': 'produto_ingredientes',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='ProdutoMenurestaurante',
            fields=[
                ('produtoid', models.OneToOneField(db_column='ProdutoID', on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to='clientes.produto')),
            ],
            options={
                'db_table': 'produto_menurestaurante',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='ProdutoPedido',
            fields=[
                ('produtoid', models.OneToOneField(db_column='ProdutoID', on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to='clientes.produto')),
            ],
            options={
                'db_table': 'produto_pedido',
                'managed': False,
            },
        ),
        migrations.CreateModel(
            name='ReservaMesa',
            fields=[
                ('reservaid', models.OneToOneField(db_column='ReservaID', on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to='clientes.reserva')),
            ],
            options={
                'db_table': 'reserva_mesa',
                'managed': False,
            },
        ),
    ]
