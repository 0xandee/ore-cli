#!/bin/bash

# Set default values
RPC_URLS=("https://cold-thrilling-glade.solana-mainnet.quiknode.pro/XXX/" "https://quick-rough-sound.solana-mainnet.quiknode.pro/XXX/"")

DEFAULT_KEY="~/.config/solana/id.json"
DEFAULT_FEE=200000
DEFAULT_THREADS=20

KEY=${2:-$DEFAULT_KEY}
FEE=${3:-$DEFAULT_FEE}
THREADS=${4:-$DEFAULT_THREADS}

# Loop indefinitely
while true; do
  echo "Checking reward per 5 minute(s)..."
  RPC_URL=${RPC_URLS[$RANDOM % ${#RPC_URLS[@]}]}

  # Execute the command
  eval "./target/release/ore --rpc ${RPC_URL} --keypair ${KEY} --priority-fee ${FEE} rewards"

  sleep 300
done