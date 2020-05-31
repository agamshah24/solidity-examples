pragma solidity ^0.6.8;

contract IndexWithString {
    string stringStorage = "solidityStringExamples";

    // Send the length of the string - convert the string to bytes first
    function convert (string memory _name) public pure returns (uint _length) {
        bytes memory temp = bytes(_name);
        _length = temp.length;
    }

    // Retrive an element at an index
    function getElementAt(uint _index) public view returns(byte _letter) {
        // convert string to bytes 
        bytes memory temp = bytes(stringStorage);
        // Get the ASCII for the element at the index
        _letter = temp[_index];
    }
}