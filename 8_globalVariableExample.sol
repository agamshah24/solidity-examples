pragma solidity ^0.6.8;

contract GlobalVariableExample {

    string public lastCaller = "not-set";

    // Demonstrates the use of the ether subdenominations
    function etherUnitsTest() public pure returns(bool) {
        // Now, what I am doing is that I'm actually comparing if 1 ether equal to 1,000 finney.
        bool value = (1 ether == 1000 finney); //True
        // So that's how we can convert from one denomination do another denomination,
            // just write the word after the numeric number and it's going to convert it for you.

        return value;
    }

    // Demonstrates the use of the time units
    function timeUnitsTest() public view returns(uint) {
        //So, what I'm doing here in this function, I'm actually setting a variable, uint-time, called timeNow to now.

        uint timeNow = now;
        // now -> will return the time in seconds since 1970.

        // So, what it's doing, it's comparing if time now equal to 1,000 days,
            // which not the case, so this function is going to return false.
        if (timeNow == 1000 days) { // Converting 1000 literal to days, using the suffix days
            return timeNow;
        }
    }

    // Demonstrates the use of Block object
    // This function will return the number of blocks, the hash of the block and current block address & difficulty
    function getBlockInformation() public view returns(uint number, bytes32 hash, address coinbase, uint difficulty) {

        // block is global variable, we don't have to import them.
            //They're just available in the contract for us to use.
        number = block.number; // previous block

        hash = blockhash(number - 1); // -1 because excluding current... same as block.blockhash()

        //Current block
        coinbase = block.coinbase;
        difficulty = block.difficulty;
    }

    // Demonstrates the use of Msg object
    function getMsgInformation() public view returns(bytes memory msgData, bytes4 sig, address sender) {
        //It returns the data of the current block, signature, and the sender.
        msgData = msg.data;
        sig = msg.sig;
        sender = msg.sender;
    }

}