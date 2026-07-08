import pandas as pd
import random
from faker import Faker

# Load and exhibit dataframe
df = pd.read_csv('../pedidos.csv')
print(df.head())

# Search for 'id_pedido' and 'valor_total' to create a new dataframe
df_pedidos = df[['id_pedido', 'valor_total]]

formas_pagamento = [
    'PIX',
    'Boleto',
    'Cartao Corporativo',
    'Transferencia Bancaria'
]

status_pagamento = [
    'Pago',
    'Pendente',
    'Processando'
]

# Generate payments
fake = Faker('pt_BR')

pagamentos = []

for _, pedido in df_pedidos.iterrows():

    pagamentos.append({
        'id_pedido': pedido['id_pedido'],
        'forma_pagamento': random.choice(formas_pagamento),
        'valor_pago': pedido['valor_total'],
        'data_pagamento': fake.date_between(
            start_date='-6M',
            end_date='today'
        ),
        'status_pagamento': random.choice(status_pagamento)
    })

df_pagamentos = pd.DataFrame(pagamentos)

# Correcting the column 'id_pedido' to INT value
df_pagamentos['id_pedido'] = df_pagamentos['id_pedido'].astype(int)

# As 'PIX' is a immediate form of payment its value always need to be 'Pago'
df_pagamentos.loc[df_pagamentos['forma_pagamento'] == 'PIX', 'status_pagamento'] = 'Pago'

# Export to CSV
df_pagamentos.to_csv('pagamentos.csv', index=False)