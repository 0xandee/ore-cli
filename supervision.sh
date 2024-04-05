#!/bin/bash

# Set default values
RPC_URLS=("https://cold-thrilling-glade.solana-mainnet.quiknode.pro/XXX/" "https://quick-rough-sound.solana-mainnet.quiknode.pro/XXX/")
# DEFAULT_RPC_URL="https://silent-wispy-replica.solana-mainnet.quiknode.pro/XXX/" 

DEFAULT_KEY="~/.config/solana/id.json"
DEFAULT_FEE=200000
DEFAULT_THREADS=20

# Assign arguments with defaults
# RPC_URL=${1:-$DEFAULT_RPC_URL}
KEY=${2:-$DEFAULT_KEY}
FEE=${3:-$DEFAULT_FEE}
THREADS=${4:-$DEFAULT_THREADS}

# Command and its arguments, with dynamic values
# COMMAND="./target/release/ore --rpc ${RPC_URL} --keypair ${KEY} --priority-fee ${FEE} mine --threads ${THREADS}"

# Loop indefinitely
while true; do
  echo "Starting the process..."
  RPC_URL=${RPC_URLS[$RANDOM % ${#RPC_URLS[@]}]}
  echo "Using RPC URL: ${RPC_URL}"

  # Execute the command
  eval "./target/release/ore --rpc ${RPC_URL} --keypair ${KEY} --priority-fee ${FEE} mine --threads ${THREADS}"
  
  # If the command was successful, exit the loop
  # Remove this if you always want to restart regardless of exit status
  # [ $? -eq 0 ] && break
  
  echo "Process exited with an error. Restarting in 5 seconds..."
  sleep 1
done