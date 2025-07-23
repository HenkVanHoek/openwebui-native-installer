# 🧠 Native Open WebUI Installer (No Docker)

This project provides a lightweight script to install **Open WebUI** natively on a minimal Ubuntu Server 22.04 LTS machine — without Docker.

It’s perfect for:
- Lightweight VirtualBox or Proxmox VMs  
- Headless local servers  
- Developers who prefer native over container-based deployment  

> ⚠️ This assumes you already have **Ollama** running on another machine (e.g. a Windows PC), accessible from the VM over the local network.

---

## ✅ Features

- Native install — no Docker  
- Python + Node.js stack  
- Web UI on port **3000**  
- Optional autostart with `systemd`  

---

## 🖥 Requirements

- Ubuntu Server 22.04 LTS (minimal install recommended)  
- Ollama running elsewhere (e.g. `http://192.168.1.100:11434`)  
- At least 2 GB RAM  
- Internet access during setup  

---

## 🚀 Installation

SSH into your Ubuntu VM or use the VirtualBox console, then run:

```bash
# Download the installer script
curl -O https://your-github-username.github.io/openwebui-native-installer/install.sh

# Make it executable
chmod +x install.sh

# Run the installer
./install.sh
```

> 💡 If you cloned the repo instead of downloading:
> ```bash
> chmod +x install.sh
> ./install.sh
> ```

This will:
- Install Python, Node.js, npm, etc.
- Clone the Open WebUI repo
- Set up Python venv and Node frontend
- Create a `.env` file with default Ollama URL

---

## ⚙️ Configuration

After install, edit the `.env` file in:

```bash
~/open-webui/backend/.env
```

Set the correct IP address for your Ollama server:

```env
OLLAMA_API_BASE_URL=http://192.168.1.100:11434
```

Replace the IP with the actual address of your Ollama machine.

---

## ▶️ Running the App

Start Open WebUI manually with:

```bash
cd ~/open-webui/backend
source venv/bin/activate
python3 main.py
```

---

## 🌐 Access the UI

From your browser (on the same network):

```
http://<your-vm-ip>:3000
```

---

## 🔁 Autostart on Boot (Optional)

To auto-start Open WebUI when the VM boots, see [postinstall.md](postinstall.md):

```bash
sudo systemctl enable openwebui
sudo systemctl start openwebui
```

---

## 🧹 Uninstall

To fully remove everything:

```bash
rm -rf ~/open-webui
sudo apt remove --purge -y nodejs npm python3-pip git
```

Also remove the systemd service if created:

```bash
sudo systemctl disable openwebui
sudo rm /etc/systemd/system/openwebui.service
sudo systemctl daemon-reload
```

---

## 📄 License

This project is licensed under the MIT License — see [LICENSE](LICENSE)

---

## 🙌 Credits

Open WebUI is developed at [github.com/open-webui/open-webui](https://github.com/open-webui/open-webui)

This installer project is a community contribution for native deployment.
