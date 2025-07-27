#! /bin/bash

# Exit on error
set -e

# Update packages and install prerequisites
sudo apt update && sudo apt upgrade -y
sudo apt-get install -y gcc build-essential curl pkg-config libssl-dev

# Install Rust
# Check if rustup is already installed
if ! command -v rustup &> /dev/null; then
    echo "Installing Rust using rustup..."
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y

    # Add cargo to PATH for current session
    export PATH="$HOME/.cargo/bin:$PATH"
else
    echo "Rust is already installed."
fi

# Verify installation
echo "Rust version:"
rustc --version

# Install espup (ESP-IDF + Rust toolchain installer)
if ! command -v espup &> /dev/null; then
    echo "Installing espup..."
    cargo install espup --locked
else
    echo "espup is already installed."
fi

# Verify espup installation
echo "espup version:"
espup --version

# Use espup to install the ESP-IDF and Rust toolchain
echo "Installing ESP-IDF and Rust toolchain using espup..."
espup install --export-file ~/.cargo/env-esp

# Install espflash for flashing the target
if ! command -v espflash &> /dev/null; then
    echo "Installing espflash..."
    cargo install espflash --locked
else
    echo "espflash is already installed."
fi