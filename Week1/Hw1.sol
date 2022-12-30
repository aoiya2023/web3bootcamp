// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract Hw1 {
    function add60and40() public pure returns(uint){
        return 60 + 40;
    }

    function myName() public pure returns(string memory) {
        return "Aoi";
    }

    function loveCookie(string memory things) public pure returns(string memory) {
        if (bytes(things).length == 6 || keccak256(abi.encodePacked(things)) != keccak256(abi.encodePacked("cookie"))) {
            return "yuck";
        } else {
            return "yum";
        }
    }

    function addTwoNum(uint num1, uint num2) public pure returns(string memory) {
        if (num1 + num2 == 10) {
            return "party";
        }
        return "nah";
    }

    function doubler(uint x) public pure returns(uint) {
        uint count = 1;

        for (uint i = 0; i < x; i++) {
            count = count * 2;
        }

        return count;
    }
}