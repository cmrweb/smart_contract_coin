// contracts/CMRCoin.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract CMRCoin is ERC20,Ownable {
   
    constructor() ERC20("CMR Coin", "CMRC") {
         uint256 supply = 1000000000000 ether;
        _mint(msg.sender, supply);
    }
    uint256 price = 1 ether;

    function send(address to,uint256 amount) public {
        require(msg.sender != to,"Vous ne pouvez pas vous envoyer vos fonds");
        require(balanceOf(msg.sender) >= amount,"Vous n'avez pas assez de fonds");
        approve(msg.sender,amount);
        transferFrom(msg.sender, to, amount);
    } 
    //add withdraw onlyOwner
    
    function withdraw() external payable onlyOwner() {
        address payable _owner = payable(owner());
        _owner.transfer(address(this).balance);
    }
}