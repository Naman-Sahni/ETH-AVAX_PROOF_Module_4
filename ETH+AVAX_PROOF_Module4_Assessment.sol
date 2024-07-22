// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";

contract DegenToken is ERC20, Ownable, ERC20Burnable {

    constructor() ERC20("Degen", "DGN") Ownable(msg.sender) {}

    // Redeemable items
    enum CardType { rare, super_rare, epic, mythic, legendary }

    struct PurchaseRequest {
        address buyer;
        uint256 token_amount;
    }

    // Queue of purchase requests for buying degen tokens
    PurchaseRequest[] public purchase_queue;

    struct PlayerCardCollection {
        uint256 rare;
        uint256 super_rare;
        uint256 epic;
        uint256 mythic;
        uint256 legendary;        
    }

    // Mapping to store redeemed cards for each player
    mapping(address => PlayerCardCollection) public player_card_collections;

    function request_purchase(address buyer, uint256 token_amount) public {
        purchase_queue.push(PurchaseRequest({ buyer: buyer, token_amount: token_amount }));
    }

    // Mint tokens for the buyers in the queue
    function mint_tokens() public onlyOwner {
        // Loop to mint tokens for buyers in queue
        while (purchase_queue.length != 0) {
            uint256 index = purchase_queue.length - 1;
            if (purchase_queue[index].buyer != address(0)) { // Check for non-zero address
                _mint(purchase_queue[index].buyer, purchase_queue[index].token_amount);
                purchase_queue.pop();
            }
        }
    }
    
    // Transfer tokens to another player
    function transfer_tokens(address recipient, uint256 token_amount) public {
        require(token_amount <= balanceOf(msg.sender), "Insufficient token balance");
        _transfer(msg.sender, recipient, token_amount);
    }

    // Redeem different cards
    function redeem_card(CardType card_type) public {
        if (card_type == CardType.rare) {
            require(balanceOf(msg.sender) >= 10, "Insufficient tokens for rare card");
            player_card_collections[msg.sender].rare += 1;
            burn(10);
        } else if (card_type == CardType.super_rare) {
            require(balanceOf(msg.sender) >= 20, "Insufficient tokens for super rare card");
            player_card_collections[msg.sender].super_rare += 1;
            burn(20);
        } else if (card_type == CardType.epic) {
            require(balanceOf(msg.sender) >= 30, "Insufficient tokens for epic card");
            player_card_collections[msg.sender].epic += 1;
            burn(30);
        } else if (card_type == CardType.mythic) {
            require(balanceOf(msg.sender) >= 40, "Insufficient tokens for mythic card");
            player_card_collections[msg.sender].mythic += 1;
            burn(40);
        } else if (card_type == CardType.legendary) {
            require(balanceOf(msg.sender) >= 50, "Insufficient tokens for legendary card");
            player_card_collections[msg.sender].legendary += 1;
            burn(50);
        } else {
            revert("Invalid card type selected");
        }
    }

    // Function to burn tokens
    function burn_tokens(address account, uint256 amount) public {
        _burn(account, amount);
    }

    // Function to check the token balance of the caller
    function check_balance() public view returns (uint256) {
        return balanceOf(msg.sender);
    }
}
