// SPDX-License-Identifier: MIT
pragma solidity ^0.8.22;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";

contract Token1 is ERC20, Ownable {
    constructor(address initialOwner)
        ERC20("Token1", "TK1")
        Ownable(initialOwner)
    {
        _mint(msg.sender, 10000 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        require(to != address(0), "Address cannot be 0");
        _mint(to, amount);
    }

    function burn(uint256 amount) public {
        require(balanceOf(msg.sender) >= amount, "You cannot burn more than your current balance");
        _burn(msg.sender, amount);
    }

    function transfer(address to, uint256 amount) public override returns (bool) {
        require(to != address(0), "Address cannot be 0");
        require(balanceOf(msg.sender) >= amount, "You cannot transfer more than your current balance");
        
        _transfer(msg.sender, to, amount);
        return true;
    }
}
