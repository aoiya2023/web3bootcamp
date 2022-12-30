// SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

contract hellowWorld{
    // data type variables
    // type accessModifier name = variable;
    // what where who
    string public greet = "Hello world!";
    bool public lightSwitch = true;
    int public students = 30;  // defaults to int256
    int8 public students2 = 10; // (- 2^7) to (2^7 - 1)
    int16 public students3 = 20;
    int256 public students256 = 100000; // (- 2^255) to (2^255 - 1)
    uint public teacher = 1; // 0 up to (2^255 - 1)
    enum cyborgs{turtle, elephant, cat}
    cyborgs public january = cyborgs.turtle;
    bytes1 public exampleByte = 0x40;
    bytes3 public theThirdLetter = "abc";

    // reference type variables
    // array
    uint[5] public fiveItems; // [0,0,0,0,0]
    uint[5] public fiveFilledItems = [1,2,3,4,5];
    uint[] public twoItems = [1,2]; // dynamic size, can grow or shrink
    string[] public friends = ["Kelly", "Yusi", "Kavi"];

    //maps
    mapping(string => int) public points;

    struct car{
        uint wheels;
        uint windows;
        string model;
    }

    car public mycar = car(4,6,"Ford");
}
