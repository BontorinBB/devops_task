#!/bin/bash
set -e

echo "🔧 CORRIGINDO API..."

# Corrigir requirements.txt
cat > /app/requirements.txt << 'REQEOF'
flask==3.0.0
requests==2.31.0
REQEOF

# Instalar dependências
pip install -r /app/requirements.txt

# Corrigir app.py - mudar porta para 5000 e retornar fixed_key
cat > /app/app.py << 'PYEOF'
from flask import Flask
import os

app = Flask(__name__)

@app.route("/")
def home():
    return {"message": "fixed_key"}

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
PYEOF

# Iniciar a API na porta 5000
cd /app
nohup python app.py > /tmp/app.log 2>&1 &

sleep 5

echo "✅ API corrigida e rodando na porta 5000"
