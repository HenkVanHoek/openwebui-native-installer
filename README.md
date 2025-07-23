# Native Open WebUI Installer (No Docker)

This project provides a lightweight script to install [Open WebUI](https://github.com/open-webui/open-webui) **natively** on a minimal Ubuntu Server 22.04 LTS machine — **without using Docker**.

It’s perfect for:
- Lightweight VirtualBox or Proxmox VMs
- Headless local servers
- Developers who prefer native environments over containers

> ❗ This setup assumes you already have [Ollama](https://ollama.com) running on another machine (e.g. a Windows PC), accessible from the VM over the local network.

---

## ✅ Features

- 📦 Native installation without Docker
- ⚙️ Installs all required dependencies (Python, Node.js, etc.)
- 🔌 Connects to an external Ollama instance
- 🖥️ Web interface available on port `3000`
- 🔁 Optional `systemd` service to run at boot

---

## 🖥 Requirements

- Ubuntu Server 22.04 LTS (minimal install recommended)
- Access to a running Ollama instance (e.g., `http://192.168.1.100:11434`)
- At least **2 GB RAM**
- Internet access during installation

---

## 🚀 Installation

SSH into your Ubuntu VM or use the VirtualBox console, then run:

```bash
curl -sL https://your-github-username.github.io/openwebui-native-installer/install.sh | bash
```

The script will:
1. Install required packages
2. Clone the Open WebUI repository
3. Set up the Python backend
4. Build the frontend
5. Create a basic `.env` file with a placeholder IP address

---

## ⚙️ Configuration

After installation, update the `.env` file located at:

```bash
~/open-webui/backend/.env
```

Change the line:

```env
OLLAMA_API_BASE_URL=http://192.168.1.100:11434
```

Replace `192.168.1.100` with the actual IP address of the machine running Ollama.

Then start the app:

```bash
cd ~/open-webui/backend
source venv/bin/activate
python3 main.py
```

---

## 🌐 Access the Web Interface

Open a browser (on your host PC or Android device) and go to:

```
http://<your-vm-ip>:3000
```

You’ll now be able to chat via Open WebUI, backed by the Ollama server on your Windows PC.

---

## 🔁 Optional: Auto-start at Boot

To run Open WebUI automatically after reboot, set up a `systemd` service.

See instructions in:

📄 [`postinstall.md`](postinstall.md)

---

## 🧹 Uninstall Instructions

To completely remove the setup:

```bash
rm -rf ~/open-webui
sudo apt remove --purge -y nodejs npm python3-pip git
```

If you created a `systemd` service, disable and remove it:

```bash
sudo systemctl disable openwebui
sudo rm /etc/systemd/system/openwebui.service
sudo systemctl daemon-reload
```

---

## 📸 Screenshots

You can add screenshots here showing:
- The terminal installation
- The web interface in your browser
- Sample chats powered by Ollama

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).
