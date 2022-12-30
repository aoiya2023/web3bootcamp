//SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract token is ERC20("WBCTEST", "WBCT") {
    mapping (address => uint) public points;
    address public owner;

    constructor() payable {
        owner = msg.sender;
    }
    modifier onlyOwner {
        require(msg.sender == owner, "You are not the owner");
        _;
    }

    function mintNewTokens(uint amount) public onlyOwner {
        _mint(msg.sender, amount);
    }

    function burnAndAdd(uint amount) public {
        _burn(msg.sender, amount);
        points[msg.sender] += amount;
    }

    function burned(address addy) public view returns(uint) {
        return points[addy];
    }

    function win() public {
        if(points[msg.sender] >= 5) {
            // selfdestruct takes the contract off the blockchain
            // sends the ETH to an address
            selfdestruct(payable(msg.sender));
        } else {
            revert("You don't have enough points to win");
        }
    }
}