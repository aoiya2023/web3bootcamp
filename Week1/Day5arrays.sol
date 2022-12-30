// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

contract day5{

    // array functions
    string[] public alphabet = ["A", "B", "C"];
    // push
    function addToEnd(string calldata all) public{
        alphabet.push(all);
    }
    // pop
    function removeEnd() public{
        alphabet.pop();
    }
    // length
    function getLength() view public returns(uint) {
        return alphabet.length;
    }

    // conditionals
    bool[] public isOverTen;

    function overTen(int number) public{

        if(number >= 10) {
            isOverTen.push(true);
        } else {
            isOverTen.push(false);
        }
    }

    function overTenShort(int number) public {
        number >= 10 ? isOverTen.push(true) : isOverTen.push(false);
    }

    // for loops
    function funLoops(uint cycles) public pure returns(uint) {
        uint count = 0;

        for(uint i = 0; i < cycles; i++) {
            if (i==5) {
                continue;
            }

            if (i == 7) {
                break;
            }
            count = i;

            
        }

        return count;
    }

    function addTogether(uint loops) public pure returns(uint) {
        uint total = 0;

        for (uint i=0; i < loops; i++) {
            total = total + i;
        }

        return total;
    }
}