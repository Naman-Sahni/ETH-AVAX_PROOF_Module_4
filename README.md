# ETH-AVAX_PROOF_Module_4
Module 4 Project: Degen Token (ERC-20): Unlocking the Future of Gaming


# DEGEN Token Contract

This Solidity smart contract implements a basic ERC-20 token named DEGEN (DGN). It allows for token minting, burning, transferring, and redeeming based on specified game items.

## Overview

- **Token Name:** DEGEN
- **Token Symbol:** DGN
- **Decimals:** 18

## Features

1. **Minting Tokens:**
   - Only the contract owner can mint new tokens.
   - Tokens are minted and added to the recipient's balance.

2. **Burning Tokens:**
   - Tokens can be burned from a specified address.
   - Ensures the amount burned does not exceed the address's balance.

3. **Transferring Tokens:**
   - Allows tokens to be transferred between addresses.
   - Checks that the sender has sufficient balance and that the recipient address is valid.

4. **Redeeming Tokens for Game Items:**
   - Tokens can be redeemed based on specified game item requirements.
   - Validates the amount of tokens against the requirements of each game item before burning them.

## Usage

To deploy the contract:
- Deploy the contract using a Solidity compiler that supports version ^0.8.18 or compatible.

### Functions

- **mint_tokens(address recipient, uint256 amount):** Allows the contract owner to mint tokens and assign them to a recipient.
- **burn_tokens(address from, uint256 amount):** Burns tokens from a specified address.
- **transfer_tokens(address to, uint256 amount):** Transfers tokens from the sender's address to a specified address.
- **redeem_tokens(address recipient, uint256 amount, uint256 game_item):** Redeems tokens based on game item requirements, burning them from the recipient's address.

## Deployment

Deploy the contract on a compatible Ethereum network using tools like Remix, Truffle, or Hardhat.

## Security Considerations

- Ensure only trusted parties have access to the contract owner's private key to prevent unauthorized minting.
- Use proper access control mechanisms and thoroughly test all contract interactions before deployment.



