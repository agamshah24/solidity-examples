pragma solidity ^0.6.8;

contract ExceptionExample {
    // Public variable lastCaller, with value of none
    string public lastCaller;

    // Function revertBehavior takes in a name as an argument
        //and sets the lastCaller variable to this argument received.
    function revertBehavior(string memory name) public returns (bool) {
        lastCaller = name;

        // Check if length of the string is zero,
        // If the arugment received has zero length, it throws an exception...
        // Once an Exception is thrown, the variable lastCaller rolls back to its initial state
        if(bytes(name).length == 0) {
            revert("Name cannot be blank!");
        }

        // This is the same thing...
            // Just using the require to check the length of the input string.
            // The next code will be only executed if the length is greater than zero.
            // The above line of code we can replace it with,
        // require(bytes(name).length > 0, "Name cannot be blank!");

        return true;
    }

    // So, what is going on is that in the function revertBehavior
    // lastCaller is being changed to the input argument
    // and then an exception is thrown, and the lastCaller revert back to its original value, thus nullifying the effect.

}