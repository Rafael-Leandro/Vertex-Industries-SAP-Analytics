import pandas as pd
from faker import Faker
import random

# Load and exhibit dataframe
df = pd.read_csv('../clientes.csv')
print(df.head())

# Search for 'id_cliente' to create a new dataframe
clientes_id = df['id_cliente']

# Available Products
produtos = {
    1: 1200.00,
    2: 3500.00,
    3: 450.00,
    4: 2800.00,
    5: 5200.00,
    6: 2700.00,
    7: 700.00,
    8: 4800.00,
    9: 900.00,
    10: 4600.00
}

status_pedido = [
    'Processando',
    'Faturado',
    'Entregue',
    'Em Transporte'
]

# Generate Orders
fake = Faker('pt_BR')

pedidos = []

for _ in range(300):

    id_cliente = random.choice(clientes_id.tolist())

    quantidade_produtos = random.randint(1, 5)

    valor_total = 0

    for _ in range(quantidade_produtos):

        produto = random.choice(list(produtos.keys()))

        quantidade = random.randint(1, 10)

        valor_total += produtos[produto] * quantidade

    pedidos.append({
        'id_cliente': id_cliente,
        'data_pedido': fake.date_between(
            start_date='-6M',
            end_date='today'
        ),
        'valor_total': round(valor_total, 2),
        'status_pedido': random.choice(status_pedido)
    })

df_pedidos = pd.DataFrame(pedidos)

# Export to CSV
df_pedidos.to_csv('pedidos.csv', index=False)