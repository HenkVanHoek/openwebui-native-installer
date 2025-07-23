#!/bin/bash
# Make sure this file is executable. Use chmod +x install.sh
set -e

echo "🔧 Updating package lists..."
sudo apt update

echo "📦 Installing required packages..."
sudo apt install -y git python3 python3-venv python3-pip curl nodejs npm

echo "🌐 Cloning Open WebUI repository..."
git clone https://github.com/open-webui/open-webui.git ~/open-webui

cd ~/open-webui

echo "🐍 Setting up Python backend..."
cd backend
python3 -m venv venv
source venv/bin/activate
pip install --upgrade pip
pip install -r requirements.txt

echo "📝 Creating default .env file..."
cat > .env <<EOF
OLLAMA_API_BASE_URL=http://192.168.1.100:11434
OPENWEBUI_SECRET_KEY=$(openssl rand -hex 32)
EOF

echo "💻 Setting up frontend..."
cd ../frontend
npm install
npm run build

echo "✅ Installation complete!"
echo "➡️  To start Open WebUI:"
echo "    cd ~/open-webui/backend"
echo "    source venv/bin/activate"
echo "    python3 main.py"
