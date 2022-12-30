// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

contract week2day1 {

    function getInfo() public view returns(uint, uint, uint, address) {

        return (block.chainid, block.difficulty, block.number, msg.sender);
    }

    uint public value = 100;

    // error
    function getValue() public view returns(uint) {

        // caller needs to be this address
        require(msg.sender == 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, "not owner");
        return value;
    }

    function getValue2() public view returns(uint) {

        if (msg.sender != 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4) {
            revert("you are not the owner");
        }

        return value;
    }

    function assertValue() public view returns(bool) {
        assert(value == 100);
        return true;
    }

    // modifier
    address public contractCreator = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;

    modifier onlyOwner() {
        require(msg.sender == contractCreator);
        _;
    }

    function getValue3() public view onlyOwner returns(uint) {
        return value;
    }

    bool public lightSwitch = false;
    string public password = "coffee";

    modifier checkLightSwitch() {
        require(lightSwitch == true, "Light Switch is not on");
        _;
    }

    function flipLightSwitch(bool option) public {
        lightSwitch = option;
    }

    function getPassword() public view checkLightSwitch returns(string memory) {
        return password;
    }
    
    // constructor
    address public contractOwner;
    constructor(address addy) {
        contractOwner = addy;

    }

    modifier onlyOwner2() {
        require(msg.sender == contractOwner);
        _;
    }

    function getValueModifierConstructor() public view onlyOwner2 returns(uint) {
        return value;
    }

 }