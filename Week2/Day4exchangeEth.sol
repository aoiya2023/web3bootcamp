// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

contract vault {
    address payable creator;

    constructor() payable {
        creator = payable(msg.sender);
    }

    modifier onlyOwner() {
        require(msg.sender == creator, "You are not the owner");
        _;
    }

    receive() external payable{}

    function depositSomeMoney() public payable returns(uint) {
        return msg.value;
    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }

    // 2300 gas used
    function takeOutWithTransfer(uint amount) public onlyOwner {
        address payable mine = payable(msg.sender);
        mine.transfer(amount * (10 **18));
    } 

    // 2300 gas used
    function takeOutWithSend(uint amount) public  onlyOwner returns(bool){
        address payable mine = payable(msg.sender);
        bool tryToSend = mine.send(amount * (10 **18));
        return tryToSend;
    }

    // recommended
    function takeOutWithCall(uint amount) public onlyOwner returns(bool, bytes memory) {
        address payable mine = payable(msg.sender);
        (bool tryToSend, bytes memory data) = mine.call{value: amount * (10 **18), gas: 5000}("");

        return (tryToSend, data);
    }
}