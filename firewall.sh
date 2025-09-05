#!/bin/bash

# 1️⃣ Update system
apt update -y && apt upgrade -y

# 2️⃣ Install UFW (Uncomplicated Firewall)
apt install ufw -y

# 3️⃣ Set default policies
sudo ufw default deny incoming
sudo ufw default allow outgoing

# 4️⃣ Allow essential ports

# SSH (အရေးကြီး - မဟုတ်ရင် lock ဖြစ်နိုင်တယ်)
sudo ufw allow ssh

# Outline server ports
# Outline Manager uses 12345 TCP by default (change if yours is different)
sudo ufw allow 12345/tcp

# Outline Shadowsocks (dynamic ports used by clients)
# TCP + UDP range for Outline server
# Example: 1024-65535 for client connections
sudo ufw allow 1024:65535/tcp
sudo ufw allow 1024:65535/udp

# HTTP/HTTPS if you run web server
sudo ufw allow http
sudo ufw allow https

# 5️⃣ Enable UFW
sudo ufw --force enable

# 6️⃣ Show status
sudo ufw status verbose

echo "✅ Firewall setup complete for Outline server!"
