pragma solidity ^0.6.8;

contract Modifiers {

    // Initialize a public variable that sets a minimum bidding amount
    uint32 public minBiddingAmount = 100;

    modifier minimumAmount() {
        if (msg.value >= minBiddingAmount) {
            _;
        } else {
            /** Throw an exception */
            revert("Minimum bidding amount is 100");
        }
    }

    function bid() public payable minimumAmount returns (bool) {
        return true;
    }
}