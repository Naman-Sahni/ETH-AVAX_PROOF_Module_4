// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Degen {

    uint256 public total_supply;
    address public contract_owner;
    string public token_name = "DEGEN";
    string public token_symbol = "DGN";
    uint8 public decimals = 18;

    constructor() {
        contract_owner = msg.sender;
    }

    mapping(address => uint256) public balances;

    // Mint function
    function mint_tokens(address recipient, uint256 amount) public {
        require(msg.sender == contract_owner, "Only the contract owner can mint tokens.");
        require(amount > 0, "Amount must be greater than 0.");

        balances[recipient] += amount;
        total_supply += amount;
    }

    // Burn function
    function burn_tokens(address from, uint256 amount) public {
        require(amount <= balances[from], "Amount exceeds balance.");

        balances[from] -= amount;
        total_supply -= amount;
    }

    // Transfer function
    function transfer_tokens(address to, uint256 amount) public {
        require(amount <= balances[msg.sender], "Amount exceeds balance.");
        require(to != address(0), "Cannot transfer to the zero address.");

        balances[msg.sender] -= amount;
        balances[to] += amount;
    }

    // Redeem function
    function redeem_tokens(address recipient, uint256 amount, uint256 game_item) public { 
        require(amount <= balances[recipient], "Amount exceeds balance");

        if (game_item == 1) {
            require(amount >= 50, "Insufficient tokens for Game Item 1");
            burn_tokens(recipient, amount);
        } else if (game_item == 2) {
            require(amount >= 100, "Insufficient tokens for Game Item 2");
            burn_tokens(recipient, amount);
        } else if (game_item == 3) {
            require(amount >= 200, "Insufficient tokens for Game Item 3");
            burn_tokens(recipient, amount);
        } else {
            revert("Invalid game item");
        }
    } 
}
