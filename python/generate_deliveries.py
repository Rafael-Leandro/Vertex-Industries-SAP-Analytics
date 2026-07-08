import pandas as pd
import random
from faker import Faker

# Load and exhibit dataframe
df = pd.read_csv('../pedidos.csv')
print(df.head())

# Search for 'id_pedido' to create a new dataframe
pedidos_id = df['id_pedido']

transportadoras = [
    'RapidExpress',
    'LogMaster',
    'CargoFly',
    'PrimeLog'
]

status_entrega = [
    'Entregue',
    'Em Transporte',
    'Separacao'
]

# Generate deliveries
fake = Faker('pt_BR')

entregas = []

for pedido in pedidos_id:

    data_envio = fake.date_between(
        start_date='-6M',
        end_date='today'
    )

    entregas.append({
        'id_pedido': pedido,
        'transportadora': random.choice(transportadoras),
        'data_envio': data_envio,
        'data_entrega': fake.date_between(
            start_date=data_envio,
            end_date='today'
        ),
        'status_entrega': random.choice(status_entrega)
    })

df_entregas = pd.DataFrame(entregas)

# Correcting the results of some columns
df_entregas.loc[df_entregas['status_entrega'] == 'Separacao', 'data_envio'] = 'NULL'

df_entregas.loc[df_entregas['status_entrega'] == 'Separacao', 'data_entrega'] = 'NULL'

df_entregas.loc[df_entregas['status_entrega'] == 'Em Transporte', 'data_entrega'] = 'NULL'

# Export to CSV
df_entregas.to_csv('entregas.csv', index=False)