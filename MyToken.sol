
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@openzeppelin/contracts@4.5.0/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts@4.5.0/access/Ownable.sol";

contract MyToken is ERC20, Ownable {
    uint256 public rate = 1000 * 10 ** decimals();
     mapping (address => uint256) balances;
    constructor() ERC20("MyToken", "MTK") {
        _mint(msg.sender, 1000000 * 10 ** decimals());
    }

    function mint(address to, uint256 amount) public onlyOwner {
        _mint(to, amount);
    }

    function buyToken(address receiver) public payable returns (bool) {
        uint256 amount = msg.value/10**18 * 1000;
        balances[receiver] += amount;
      
        return true ;
         

    }
}
