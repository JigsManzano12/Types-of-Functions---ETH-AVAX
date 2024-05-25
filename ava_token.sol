// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;
import "@openzeppelin/contracts@4.9.0/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.9.0/access/Ownable.sol";
contract MyJStoken is ERC20, Ownable {
    constructor() ERC20("JigSaw", "JS") {
        _mint(msg.sender, 1000000000 * 10**18); // Mint 1,000,000,000 tokens to the contract deployer
    }
    //Gerard Jose L
    function mint(address account, uint256 amount) public onlyOwner {
        _mint(account, amount);
    }

    function transfer(address recipient, uint256 amount) public override returns (bool) {
        _transfer(_msgSender(), recipient, amount);
        return true;
    }
    //Gerard Jose L
    function burn(uint256 amount) public {
        _burn(_msgSender(), amount);
    }
}
