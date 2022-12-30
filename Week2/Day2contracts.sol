// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract A {

    string private start = "one";

    function getValue() public view returns(string memory) {
        return start;
    }

    function changeValue(string calldata change) public {
        start = change;
    }
}

