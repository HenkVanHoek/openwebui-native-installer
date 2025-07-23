# 🔁 Autostart Open WebUI at Boot (systemd)

To run Open WebUI automatically when the VM boots:

---

## 1. Create a systemd service file

```bash
sudo nano /etc/systemd/system/openwebui.service
```

Paste the following content:

```ini
[Unit]
Description=Open WebUI Backend
After=network.target

[Service]
User=your-username
WorkingDirectory=/home/your-username/open-webui/backend
EnvironmentFile=/home/your-username/open-webui/backend/.env
ExecStart=/home/your-username/open-webui/backend/venv/bin/python3 main.py
Restart=always

[Install]
WantedBy=multi-user.target
```

> Replace `your-username` with your actual Ubuntu username.

---

## 2. Reload systemd and enable the service

```bash
sudo systemctl daemon-reload
sudo systemctl enable openwebui
sudo systemctl start openwebui
```

---

## 3. Verify

Check the status:

```bash
systemctl status openwebui
```

---

You can now reboot your VM and Open WebUI will start automatically.
