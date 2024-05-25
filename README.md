# Mytoken

## Description

Mytoken is a Solidity smart contract implementing the ERC20 standard for a custom token named "JigSaw" with the symbol "JS". This contract leverages OpenZeppelin's robust ERC20 and Ownable implementations to provide a secure and feature-rich token experience.

## Features

- **ERC20 Standard Compliance**: Fully adheres to the ERC20 standard for fungible tokens, ensuring compatibility with various wallets and exchanges.
- **Token Name and Symbol**: The token is named "JigSaw" with the symbol "JS".
- **Minting Functionality**: The contract owner has the exclusive ability to mint new tokens, providing flexibility for future token distribution.
- **Initial Supply**: At deployment, 1,000,000,000 (1 billion) JigSaw tokens are minted and allocated to the contract deployer.
- **Token Transfers**: Enables token holders to transfer their JS tokens to any Ethereum address, facilitating easy and secure transactions.
- **Ownership Management**: Utilizes the Ownable contract to restrict certain functions, such as minting, to the contract owner, ensuring control over the token supply.
- **Burning Mechanism**: Allows token holders to burn (destroy) their own JS tokens, providing a mechanism to reduce the total supply if desired.

## Smart Contract Code

```solidity
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

import "@openzeppelin/contracts@4.9.0/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.9.0/access/Ownable.sol";

contract MyJGWtoken is ERC20, Ownable {
    constructor() ERC20("JigSaw", "JS") {
        _mint(msg.sender, 1000000000 * 10**18); // Mint 1,000,000,000 tokens to the contract deployer
    }

    function mint(address account, uint256 amount) public onlyOwner {
        _mint(account, amount);
    }

    // Function to transfer tokens
    function transfer(address recipient, uint256 amount) public override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }

    // Function to burn tokens
    function burn(uint256 amount) public {
        _burn(_msgSender(), amount);
    }
}
