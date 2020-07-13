pragma solidity ^0.6.8;

contract constructorExample {
    uint8 public amount;

    constructor(uint8 value) public {
        amount = value;
    }
}