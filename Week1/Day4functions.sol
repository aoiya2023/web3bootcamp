// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

contract day4 {
    function addTwos() public pure returns(int) {
        return 2+2;
    }

    function add(int a, int b) public pure returns(int) {
        return a + b;
    }

    int private age = 21;

    function getAge() public view returns(int) {
        return age;
    }

    function changeAge(int newAge) public {
        age = newAge;
    }

    string public name = "Aoi";

    function getName() public view returns(string memory) {
        return name;
    }

    function changeName(string memory newName) public {
        name = newName;
    }

    function changeNameToBasil() public {
        changeName("Basil");
    }
    /* visibility
    * public - anyone
    * private - internally
    * internal - internally and other contracts built on it
    * external - other contracts and EOAs (no internal!)
    */

    /* mutability
    * view - not changing the blockchain, only reading it
    * pure - not changing or reading (computing)
    * payable - requires ETH to run
    * non-payable - default
    */

    /* explicit data location (ONLY needed for referency-type variables)
    * storage - stored on the blockchain
    * memory - temporary 
    * calldata - memory, but can't change it
    */
 }