# Native Open WebUI Installer (No Docker)

This project provides a lightweight script to install [Open WebUI](https://github.com/open-webui/open-webui) natively on **Ubuntu Server 22.04 LTS**, without using Docker. Ideal for use in a small VirtualBox VM or minimal VPS.

> ✅ Ollama itself must be running on another machine (e.g., a Windows PC).

---

## ✅ Requirements

- Ubuntu Server 22.04 (minimal install)
- External Ollama server running and reachable (e.g., at `192.168.1.10:11434`)
- At least 2 GB RAM recommended
- Internet connection

---

## 🚀 Installation

```bash
curl -sL https://<your-github-pages-url>/install.sh | bash
