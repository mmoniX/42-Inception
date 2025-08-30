#!/bin/bash

set -e

if [ -f ".env" ]; then
    source .env
else
    echo "Error: .env file not found"
    exit 1
fi

if [ ! -d "$DATA_DIR" ]; then
	echo "Creating data directories..."
	mkdir -p "$DATA_DIR" "$WP_DIR" "$DB_DIR"
else
	echo "Data Directories Found"
fi

chmod -R 755 "$DATA_DIR"

if [ -f "/etc/hosts" ]; then
	if ! grep -q "$HOST_ENTRY" /etc/hosts; then
		echo "Adding entry to /etc/hosts"
		sudo sh -c "echo '$HOST_ENTRY' >> /etc/hosts"
	else
		echo "Hosts entry already exists"
	fi
else
	echo "Error: /etc/hosts not found"
	exit 1
fi
