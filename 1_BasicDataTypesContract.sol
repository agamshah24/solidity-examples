pragma solidity ^0.4.25;

contract BasicDataTypesContract {
 
 uint8 a=255; // 1 byte unsigned integer
 
 address public owner; // Address type variable, called owner
 
 bool public flag = true;
 
 uint ownerInitialBalance; // uint type variable
 
 // Function takes in an address, and returns the balance of this address
 function test (address _address) public returns (uint) {
     
     owner = _address;
     
     ownerInitialBalance = owner.balance;
     
     /*if(1) {} // will not compile*/
     
     if( 1 > 0 ) { //This will work because expression evalutes to boolean
        // Do something
     }
     
     return ownerInitialBalance;
 }
}