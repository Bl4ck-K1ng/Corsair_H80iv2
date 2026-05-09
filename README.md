# Corsair H80i v2 — Автоматический контроллер помпы

**Bash-скрипт для автоматического управления скоростью помпы Corsair H80i v2 по температуре жидкости.**  
По умолчанию порог — **30°C**.

## 🚀 Установка одной командой

```bash
curl -fsSL https://raw.githubusercontent.com/Bl4ck-K1ng/Corsair_H80iv2/main/install.sh | sudo bash
```

🇷🇺 О проекте
Скрипт предназначен специально для СЖО Corsair H80i v2.
Он каждые 5 секунд проверяет температуру жидкости через liquidctl и автоматически регулирует скорость помпы:

Температура жидкости > 30°C → скорость помпы 100%
Температура жидкости < 30°C → скорость помпы 1% (тихий режим)

Работает в фоне как systemd-сервис.
Возможности

Полностью автоматический режим
Проверка каждые 5 секунд
Автозагрузка при старте системы
Минимальный шум в простое и максимальное охлаждение под нагрузкой


🇬🇧 English
Corsair H80i v2 Pump Controller
Automatic pump speed controller for Corsair H80i v2 based on liquid temperature.
Default threshold is 30°C.

One-command installation
```bash
Bashcurl -fsSL https://raw.githubusercontent.com/Bl4ck-K1ng/Corsair_H80iv2/main/install.sh | sudo bash
```

About
This script is made specifically for the Corsair H80i v2 AIO liquid cooler.
It monitors liquid temperature every 5 seconds using liquidctl and automatically adjusts pump speed:

If liquid temperature > 30°C → pump speed 100%
If liquid temperature < 30°C → pump speed 1% (silent mode)

Runs silently in the background as a systemd service.
Features

Fully automatic
Checks every 5 seconds
Starts on boot
Reduces noise at low temps

Требования / Requirements

Ubuntu / Debian-based Linux
Поддержка Corsair H80i v2 в liquidctl

Всё необходимое устанавливается автоматически.
Настройка / Configuration
После установки отредактируйте основной скрипт:
Bashsudo nano /opt/corsair-h80iv2/water_pump_ctl.sh
Лицензия / License
GNU General Public License v3.0
