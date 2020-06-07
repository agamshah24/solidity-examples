pragma solidity ^0.6.8;

contract StructExample {

    struct Family {
        bytes32 lastName;
        uint8 houseNumber;
        uint16 age;
    }

    // Create a variable of type Family
    Family[] myFamily;

    // Return the complete family details based on the lastName
    // We cannot compare 2 strings in solidity... thats why we took bytes32 here...
    function getFamilyDetail (bytes32 name) public view returns (bytes32, uint8, uint16) {
        //Search an array
        for (uint8 i = 0; i < myFamily.length; i++) {
           if(name == myFamily[i].lastName) {
               return (myFamily[i].lastName, myFamily[i].houseNumber, myFamily[i].age );
           }
         }
    }

    // Structs Cannot be passed as argument so we are passing all elements/attributes of struct as args
    function addName (bytes32 _lastName, uint8 _houseNumber, uint16 _age) public returns (bool) {
        // Declare a struct variable in memory...
        Family memory newFamily;

        newFamily.lastName = _lastName;
        newFamily.houseNumber = _houseNumber;
        newFamily.age = _age;

        // Push the newFamily struct... into our myFamily array.
        myFamily.push(newFamily);
        return true;
    }

}