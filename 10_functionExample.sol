pragma solidity ^0.6.8;

contract FunctionExample {

    // We havn't declared the below variables as public,
    // so that means when I initiate this contract, I'm not going to have any setter and getter functions for this.
    string ownerName;
    uint8 ownerAge;

    // Constructor
    constructor (string memory name, uint8 age) public {
        ownerName = name;
        ownerAge = age;
    }

    // We are changing owner name and age
    // It's a public function means it is going to be visible, anyone can call this function
    function setOwnerInfo (string memory name, uint8 age) public {
        ownerName = name;
        ownerAge = age;
    }

    // I'm not doing anything to this function but I wanted to show you this function is marked as private.
        // That means if this function is ever inherited, or this contract is inherited, this function will not be visible.
        // So it's only visible inside this contract and that is how you play with the word private.
    // Pure means this function does not look at an information of the contract.
        // It does not try to change an information of the contract, it's a pure function.
    function secreatFunction () private pure {
        // Not available outside the contract
    }

    // Get Owner name and age
    function getOwnerInfo() public view returns (string memory name, uint8 age) {
        name = ownerName;
        age = ownerAge;
    }

    // Get the name
    // 2 ways to return the value from a function
    function getOwnerName() public view returns (string memory) {
        // 1st way return the value with return statement
        return ownerName;
    }

    function getOwnnerage() public view returns (uint8 age) {
        // 2nd way define the return variable in returns above and just set the value
        age = ownerAge;
    }

}