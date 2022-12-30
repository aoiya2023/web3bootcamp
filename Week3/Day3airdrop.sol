//SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract Airdrop is ERC20("Airdrop", "AIR") {
    address public owner;

    constructor() {
        owner = msg.sender;
    }
    modifier onlyOwner {
        require(msg.sender == owner, "not the owner");
        _;
    }

    function mintSomeTokens(address[] memory addy, uint amount) public {
        for (uint i = 0; i < addy.length; i++) {
            _mint(addy[i], amount * 10**18);
        }
    }
}