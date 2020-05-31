pragma solidity ^0.6.8;

contract TypeConversionContract {
    
    uint8 a = 255;      // a is 1 byte unsigned integer
    
    uint ownerInitialBalance; // uint256
    
    function conversion() public { 

        // b is 32bytes signed integer
        int b;          
        
        // Compilation Successful, Since 8bytes type can easily fits in a 32bytes type
        b = a; 
        
        // Fails the Compilation as the maximum value of int256 cannot be accomodated in uint8
        //a = b;        
        
        // Explicit type conversion... converting a 32bytes to 1bytes
        a = uint8(b);   
    }
    
}