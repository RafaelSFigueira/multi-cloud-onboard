# Generated by Django 4.0.3 on 2022-05-03 21:54

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('estatistica', '0003_cliente_funcionarionotificacao_and_more'),
    ]

    operations = [
        migrations.CreateModel(
            name='NotificacaoRestaurante',
            fields=[
                ('notificacaoid', models.OneToOneField(db_column='NotificacaoID', on_delete=django.db.models.deletion.CASCADE, primary_key=True, serialize=False, to='estatistica.notificacao')),
            ],
            options={
                'db_table': 'notificacao_restaurante',
                'managed': False,
            },
        ),
    ]
