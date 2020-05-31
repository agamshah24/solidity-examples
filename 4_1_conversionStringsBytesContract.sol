pragma solidity ^0.6.8;

contract ConversionStringBytesContract {

    // Dynamic bytes array
    bytes bytes_array;

    function convert (string memory _name) internal view {
        // Converting bytes _array into string
        string storage data = string(bytes_array);

        // Converting string _name into bytes
        bytes memory data1 = bytes(_name);
    }
}