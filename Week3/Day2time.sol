//SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract timedToken is ERC20("TimedTest", "TT") {
    // _transfer (from, to, amount)
    uint public totalPerDayToSpend = 5;
    mapping(address => uint)  public lastTimeSpent;
    mapping(address => uint) public alreadySpentToday;
    mapping(address => bool) public exclusions;

    function timedTransfer(address to, uint amount) public {
        require(amount < totalPerDayToSpend, "You can't spend that much in one day");

        if (exclusions[msg.sender] == true) {
            _transfer(msg.sender, to, amount);
        } else {
            if(block.timestamp - lastTimeSpent[msg.sender] >= 1 minutes) {
                // transfer our tokens
                lastTimeSpent[msg.sender] = block.timestamp;
                alreadySpentToday[msg.sender] = amount;
                _transfer(msg.sender, to, amount);
            } else {
                //check how many they've already spent today
                if(alreadySpentToday[msg.sender] + amount >= totalPerDayToSpend) {
                    //can't spend b/c they're over their limit allowance
                    revert("You've spent more than 5 tokens, can't spend now");
                } else {
                    //can spend
                    lastTimeSpent[msg.sender] = block.timestamp;
                    alreadySpentToday[msg.sender] += amount;
                    _transfer(msg.sender, to, amount);
                }
            }
        }

        
    }

    function mintFive() public {
        _mint(msg.sender, 5);
    }
    function addToExclusions(address account) public {
        exclusions[account] = !exclusions[account];
    }
}
