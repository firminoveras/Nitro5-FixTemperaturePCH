#!/usr/bin/env bash
yay -Syu
yay -S nbfc-linux-git

# Move files
sudo cp pch_temp_hammer.sh /usr/local/bin/
sudo cp pch_temp.service /etc/systemd/system

# Change exec 
sudo chmod +x /usr/local/bin/pch_temp_hammer.sh

# Enable service
sudo systemctl daemon-reload
sudo systemctl start pch_temp.service
sudo systemctl enable pch_temp.service
