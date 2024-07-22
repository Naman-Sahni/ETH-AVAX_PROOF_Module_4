# ETH-AVAX_PROOF_Module_4
Module 4 Project: Degen Token (ERC-20): Unlocking the Future of Gaming


# DegenToken Smart Contract

## Overview

`DegenToken` is an ERC20 token with additional functionalities for purchasing, transferring, and redeeming tokens for collectible cards. The contract uses OpenZeppelin's libraries for secure and standard implementations.

## Contract Details

### Inheritance

- **ERC20**: Standard ERC20 token functionalities.
- **Ownable**: Exclusive access to certain functions for the contract owner.
- **ERC20Burnable**: Enables burning of tokens.

### Constructor

Initializes the token with the name "Degen" and symbol "DGN", and sets the deployer as the owner.

### Enums and Structs

- **CardType**: Types of redeemable cards (`rare`, `super_rare`, `epic`, `mythic`, `legendary`).
- **PurchaseRequest**: Contains the buyer's address and token amount.
- **PlayerCardCollection**: Tracks the number of each type of card a player has.

### State Variables

- **purchase_queue**: Array of `PurchaseRequest` structs, representing token purchase requests.
- **player_card_collections**: Mapping of player addresses to their card collections.

### Functions

- `request_purchase(address buyer, uint256 token_amount)`: Adds a purchase request to the queue.
- `mint_tokens() public onlyOwner`: Mints tokens for players in the queue. Only callable by the owner.
- `transfer_tokens(address recipient, uint256 token_amount)`: Transfers tokens to another address.
- `redeem_card(CardType card_type)`: Redeems tokens for cards, burning the tokens in the process.
- `burn_tokens(address account, uint256 amount)`: Burns tokens from a specific address.
- `check_balance() public view returns (uint256)`: Returns the caller's token balance.

## Example Usage

1. **Requesting Token Purchase:**
    ```solidity
    DegenToken.request_purchase(playerAddress, amount);
    ```

2. **Minting Tokens:**
    ```solidity
    DegenToken.mint_tokens();
    ```

3. **Transferring Tokens:**
    ```solidity
    DegenToken.transfer_tokens(recipientAddress, amount);
    ```

4. **Redeeming Cards:**
    ```solidity
    DegenToken.redeem_card(DegenToken.CardType.rare);
    ```

5. **Burning Tokens:**
    ```solidity
    DegenToken.burn_tokens(playerAddress, amount);
    ```

6. **Checking Balance:**
    ```solidity
    uint256 balance = DegenToken.check_balance();
    ```


