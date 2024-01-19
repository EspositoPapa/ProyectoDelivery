import pandas AS pd

# Lee el archivo de texto
df = pd.read_csv('tu_archivo.txt', delimiter='\t')  # Cambia '\t' al delimitador correcto

# Guarda el DataFrame como un archivo Excel
df.to_excel('tu_archivo.xlsx', index=False)
