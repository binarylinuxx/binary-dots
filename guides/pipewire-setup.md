# Привет! Этот гайд предназначен для настройки PipeWire на Void Linux без использования runit.

## Шаг 1: Установка компонентов PipeWire

Для начала установите необходимые пакеты PipeWire:

```bash
sudo xbps-install -S pipewire pipewire-devel wireplumber libpulseaudio pulseaudio-utils alsa-pipewire
```

## Шаг 2: Установка xdg-desktop-portal

Вам понадобятся пакеты `xdg-desktop-portal` в зависимости от вашего окружения. Для каждого окружения может быть свой пакет:

- **KDE:** `xdg-desktop-portal-kde`
- **GNOME:** `xdg-desktop-portal-gtk`
- **Wayland WM (например, NEWM или HYPRLAND):** `xdg-desktop-portal-wlr`

Я использую композиторы, такие как NEWM или HYPRLAND, и за Xorg WM не знаю и надеюсь, что не узнаю. Я предпочитаю Wayland, поэтому в моем случае подойдет `xdg-desktop-portal-wlr`.

```bash
sudo xbps-install -S xdg-desktop-portal-wlr
```

## Шаг 3: Настройка конфигурации PipeWire

Создайте необходимые директории и настройте символические ссылки для конфигурационных файлов:

```bash
sudo mkdir -p /etc/pipewire/pipewire.conf.d
sudo ln -s /usr/share/examples/wireplumber/10-wireplumber.conf /etc/pipewire/pipewire.conf.d/
sudo ln -s /usr/share/examples/pipewire/20-pipewire-pulse.conf /etc/pipewire/pipewire.conf.d/
```

## Шаг 4: Настройка автозапуска PipeWire

Создайте файл `pipewire.desktop` для автозапуска PipeWire:

```bash
mkdir -p ~/.config/autostart
touch ~/.config/autostart/pipewire.desktop
```

Теперь откройте файл `pipewire.desktop` в текстовом редакторе и добавьте следующее содержимое:

```ini
[Desktop Entry]
Name=PipeWire
Comment=Start PipeWire
Icon=pipewire
Exec=pipewire
Terminal=false
Type=Application
NoDisplay=true
```

## Шаг 5: Перезапустите сессию

После завершения настройки перезапустите вашу сессию. Затем выполните следующую команду для проверки:

```bash
pactl info
```

Если все настроено правильно, вы увидите информацию о PipeWire. Если нет, возможно, ваш Wayland-композитор не запустится, и вам придется проверить конфигурацию.

## Заключение

Теперь PipeWire установлен и настроен на вашем Void Linux. Если возникли проблемы, убедитесь, что все конфигурации установлены правильно и все необходимые пакеты присутствуют.
```
по вопросам есть issues
