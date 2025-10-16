# Imagem base oficial do Python
FROM python:3.11-slim

# Evita buffers no output
ENV PYTHONUNBUFFERED=1

# Diretório de trabalho
WORKDIR /app

# Atualizar e instalar dependências do sistema
RUN apt-get update && apt-get install -y libgomp1 && rm -rf /var/lib/apt/lists/*

# Copiar requirements.txt e instalar dependências Python
COPY requirements.txt .
RUN pip install --upgrade pip
RUN pip install --no-cache-dir -r requirements.txt

# Copiar todo o projeto
COPY . .

# Expor porta do Jupyter
EXPOSE 8888

# Comando padrão para iniciar Jupyter Notebook
CMD ["jupyter", "notebook", "--ip=0.0.0.0", "--port=8888", "--allow-root", "--NotebookApp.token=''", "--NotebookApp.password=''"]
