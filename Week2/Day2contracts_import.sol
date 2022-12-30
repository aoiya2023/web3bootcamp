// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

// import "./Day2contracts.sol";
interface IA {
    function getValue() external view returns(string memory);
}

contract B {

    address public whichAddressToUse;
    constructor(address contractAddress) {
        whichAddressToUse = contractAddress;
    }

    function getValue() public view returns(string memory) {
        IA contractA = IA(whichAddressToUse);

        return contractA.getValue();
    }
}