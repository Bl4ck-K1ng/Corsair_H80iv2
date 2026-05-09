#!/bin/bash
# install.sh — автоматическая установка Corsair H80i v2 Pump Controller

set -e

echo "=== Установка контроллера помпы Corsair H80i v2 ==="

# Зависимости
sudo apt update -qq
sudo apt install -y liquidctl bc

# Папка для скрипта
INSTALL_DIR="/opt/corsair-h80iv2"
sudo mkdir -p "$INSTALL_DIR"

# Скачиваем основной скрипт
echo "Скачивание скрипта..."
sudo curl -fsSL https://raw.githubusercontent.com/Bl4ck-K1ng/Corsair_H80iv2/main/water_pump_ctl.sh -o "$INSTALL_DIR/water_pump_ctl.sh"
sudo chmod +x "$INSTALL_DIR/water_pump_ctl.sh"

# Создаём systemd-сервис
cat << EOF | sudo tee /etc/systemd/system/water_pump_ctl.service > /dev/null
[Unit]
Description=Corsair H80i v2 Pump Controller
After=network.target

[Service]
Type=simple
ExecStart=$INSTALL_DIR/water_pump_ctl.sh
Restart=always
RestartSec=3
User=root

[Install]
WantedBy=multi-user.target
EOF

# Запускаем сервис
sudo systemctl daemon-reload
sudo systemctl enable --now water_pump_ctl.service

echo "✅ Установка завершена!"
echo "Статус сервиса:"
sudo systemctl status water_pump_ctl.service --no-pager -l
