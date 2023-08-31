# Custom ERC-20 Token Contract - README

This repository contains the source code for a custom ERC-20 token contract named `CustomToken`. The contract implements basic ERC-20 token functionality including minting, transferring, and burning tokens. The token contract is built with Solidity and follows the Ethereum standards.

## Features

- Mint new tokens only by the owner.
- Transfer tokens to other addresses.
- Burn (destroy) tokens you own.
- Check your token balance.

## Getting Started

### Prerequisites

- Solidity development environment (e.g., Remix, Hardhat, Truffle).
- Basic knowledge of Solidity and Ethereum.

### Deployment

1. Deploy the `CustomToken` contract on an Ethereum-compatible blockchain.
2. Set the initial supply and owner.

### Usage

- Use the `mint` function to mint new tokens for the owner.
- Use the `transfer` function to send tokens to other addresses.
- Use the `burn` function to destroy tokens you own.

## Example Code

```solidity
// Deploy the CustomToken contract
CustomToken customToken = new CustomToken("Custom Token", "CTKN");

// Mint tokens to the contract owner
customToken.mint(msg.sender, 1000);

// Transfer tokens to another address
customToken.transfer(anotherAddress, 500);

// Burn tokens you own
customToken.burn(200);
```

### License
This project is licensed under the MIT License. See the LICENSE file for details.
