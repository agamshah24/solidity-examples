pragma solidity ^0.6.8;

import "./14_1_multipleIntheritanceContract.sol";

// We have an interfaceContract, that has a function sendMoney... but there is no function body.
interface interfaceContract {
    // No function body, only declaring it.

    function sendMoney(uint amount, address _address) external payable returns (bool);
}

// This is a baseContract has a constructor, and deposite & withdraw functions.
contract baseContract {

    // IMP: Change the name of the variable else it will create ambiguity with mainContract
    uint public valueBase;

    // Anytime base contract has a constructor,
    // we will need to initialize this using the derived contract constructor function
    constructor (uint money) public {
        valueBase = money;
    }

    // IMP: add the virtual
    function deposite (uint amount) public virtual {
        valueBase += amount;
    }

    function withdraw (uint amount) public virtual {
        valueBase -= amount;
    }
}

// How to resolve inheritance ambiguity
contract derivedContractNew is baseContract(100), mainContract(100), interfaceContract {

    string public contractName;

    constructor(string memory _name) public {
        contractName = _name;
    }

    function getValue() public view returns(uint) {
        return value;
    }

    function deposite (uint amount) public override (baseContract, mainContract) {
        baseContract.deposite(amount);
    }

    function withdraw (uint amount) public override (baseContract, mainContract) {
        mainContract.withdraw(amount);
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