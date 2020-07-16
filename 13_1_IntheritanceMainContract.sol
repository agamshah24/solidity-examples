pragma solidity ^0.6.8;

contract mainContract {

    uint internal value;

    constructor (uint amount) public {
        value = amount;
    }

    function deposite (uint amount) public {
        value += amount;
    }

    function withdraw (uint amount) public {
        value -= amount;
    }

}