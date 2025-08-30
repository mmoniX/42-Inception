#!/bin/bash

set -e

HOST_ENTRY="127.0.0.1 mmonika.42.fr"
DATA_DIR="/home/mmonika/data"
WP_DIR="$DATA_DIR/wordpress"
DB_DIR="$DATA_DIR/mariadb"

if [ ! -d "$DATA_DIR" ]; then
	echo "Creating data directories..."
	mkdir -p "$WP_DIR" "$DB_DIR"
else
	echo "Data Directory Exists"
fi

chmod -R 755 "$DATA_DIR"

if [ -f "/etc/hosts" ]; then
	if ! grep -q "$HOST_ENTRY" /etc/hosts; then
		echo "Adding entry URL"
		sudo sh -c "echo '$HOST_ENTRY' >> /etc/hosts"
	else
		echo "URL already added"
	fi
else
	echo "Error: /etc/hosts not found"
	exit 1
fi
