//SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

contract multiSig {
    address[] public owners;
    mapping(address => bool) public ownerlist;
    uint public approvalNeeded = 3;
    mapping(uint => mapping(address => bool)) public alreadyVoted;

    constructor() {
        owners.push(msg.sender);
        ownerlist[msg.sender] = true;
    }
    modifier onlyOwner {
        require(ownerlist[msg.sender] == true, "Not an owner of this contract.");
        _;
    }
    receive() external payable{}

    struct Transaction {
        address sendingTo;
        uint value;
        bool alreadyExecuted;
        uint approvals;
    }

    Transaction[] public proposedTransactions;

    function proposeTX(address to, uint amount) public onlyOwner {
        proposedTransactions.push(Transaction({
            sendingTo: to,
            value: amount,
            alreadyExecuted: false,
            approvals: 0
        }));
    }

    function voteOnTransaction(uint index) public {
        require(alreadyVoted[index][msg.sender] == false, "You've already voted");
        proposedTransactions[index].approvals += 1;
        alreadyVoted[index][msg.sender] = true;

        if (proposedTransactions[index].approvals >= approvalNeeded) {
            executeTX(index);
        }
    }

    function retractFromTransaction(uint index) public {
        require(alreadyVoted[index][msg.sender] == true, "You haven't voted yet.");
        proposedTransactions[index].approvals -= 1;
        alreadyVoted[index][msg.sender] = false;
    }

    function executeTX(uint index) public {
        require(proposedTransactions[index].alreadyExecuted == false, "Already executed");
        address payable toSend = payable(proposedTransactions[index].sendingTo);
        (bool tryToSend, ) = toSend.call{value: proposedTransactions[index].value, gas: 5000}("");
        require(tryToSend, "You don't have enough ETH to send");
        proposedTransactions[index].alreadyExecuted = true;
    }
}