pragma solidity ^0.6.8;

import "./13_1_IntheritanceMainContract.sol";

// We have an interfaceContract, that has a function sendMoney... but there is no function body.
interface interfaceContract {
    // No function body, only declaring it.

    function sendMoney(uint amount, address _address) external payable returns (bool);
}

// This is a baseContract has a constructor, and deposite & withdraw functions.
contract baseContract {

    uint public value;

    // Anytime base contract has a constructor,
    // we will need to initialize this using the derived contract constructor function

    constructor (uint money) public {
        value = money;
    }

    function deposite (uint amount) public {
        value += amount;
    }

    function withdraw (uint amount) public {
        value -= amount;
    }
}


// This shows multiple inheritance

// contract derivedContract is baseContract, interfaceContract, mainContract -> This will give an error... since baseContract & mainContract has a constructor that we need to initialize
// contract derivedContract is baseContract(100), mainContract(100), interfaceContract -> This will give compilation error as baseContact and mainContact has same function name and varaibles which is creating an ambiguity. To resolve ambiguity issue check : 14_1_multipleIntheritanceContract.sol and 14_2_multipleIntheritanceContract.sol
// contract derivedContract is mainContract(100), interfaceContract -> This will works fine.
contract derivedContract is baseContract(100), interfaceContract {

    string public contractName;

    constructor(string memory _name) public {
        contractName = _name;
    }

    function getValue() public view returns(uint) {
        return value;
    }

    // Function that allows you to convert an address into a payable address
    function _make_payable(address x) internal pure returns (address payable) {
        return address(uint160(x));
    }

    // This function has to be implemented, since it is unimplemented in the interfaceContract
    function sendMoney(uint amount, address _address) public payable override returns (bool) {
        _make_payable(_address).transfer(amount);
    }

}

