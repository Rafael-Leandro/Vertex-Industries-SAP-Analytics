# Required libraries
from faker import Faker
import pandas as pd
import random

# Generate Customers
fake = Faker('pt_BR')

setores = [
    'Tecnologia',
    'Logistica',
    'Varejo',
    'Industria',
    'Automacao'
]

clientes = []

for _ in range(100):

    clientes.append({
        'nome_cliente': fake.company(),
        'cnpj': fake.cnpj(),
        'cidade': fake.city(),
        'estado': fake.estado_sigla(),
        'setor': random.choice(setores)
    })

df_clientes = pd.DataFrame(clientes)

# Visualize Dataframe
print(df_clientes.head())

# Export to CSV
df_clientes.to_csv('clientes.csv', index=False)