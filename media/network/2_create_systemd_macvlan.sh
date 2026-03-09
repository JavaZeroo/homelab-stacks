tee /etc/systemd/system/macvlan0.service >/dev/null <<'EOF'
[Unit]
Description=Create macvlan0 for host-to-macvlan-container connectivity
After=network-online.target
Wants=network-online.target

[Service]
Type=oneshot
ExecStart=/usr/local/sbin/macvlan0-up.sh
ExecStop=/usr/local/sbin/macvlan0-down.sh
RemainAfterExit=yes

[Install]
WantedBy=multi-user.target
EOF

systemctl daemon-reload
systemctl enable --now macvlan0.service
