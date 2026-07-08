import pandas as pd
import random

# Load and exhibit dataframe
df = pd.read_csv('../pedidos.csv')
print(df.head())

# Search for 'id_pedido' to create a new dataframe
pedidos_id = df['id_pedido']

# Products and prices
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

# Generate order items
itens = []

for pedido in pedidos_id:

    quantidade_itens = random.randint(1, 4)

    for _ in range(quantidade_itens):

        id_produto = random.choice(list(produtos.keys()))

        quantidade = random.randint(1, 5)

        preco = produtos[id_produto]

        subtotal = preco * quantidade

        itens.append({
            'id_pedido': pedido,
            'id_produto': id_produto,
            'quantidade': quantidade,
            'preco_unitario': preco,
            'subtotal': subtotal
        })

df_itens = pd.DataFrame(itens)

# Export to CSV
df_itens.to_csv('itens_pedido.csv', index=False)