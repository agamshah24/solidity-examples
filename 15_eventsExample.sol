pragma solidity ^0.6.8;

contract EventsExample {
    // Represent the time when bidding ends
    uint biddingEnds = now + 5 days; 
    // now is a global variable that gives us a time in seconds since 1970.
    // as we want to end the bid in the next 5 days we have added 5 days in the now.


    // Struct to store the highest bidder details
    struct HighBidder {
        address bidder;
        string bidderName;
        uint bid;
    }

    // Variable of type HighBidder
    HighBidder public highBidder;

    // Events emitted by contract
    // Whenever a high bid is received
    event NewHighBid(address indexed who, string name, uint howMuch);

    // High bid preceded by this event
    event BidFailed(address indexed who, string name, uint howmuch);

    // Ensures that bid can be received (i.e, auction is not ended yet)
    modifier timed {
        if (now < biddingEnds) {
            _;
        } else {
            /* Throw an exception */
            revert("Sorry, the bidding time is over.");
        }
    }

    constructor() public {
        // start a bidding at 100 wei
        highBidder.bid = 100 wei;
    }

    // Payable since ether should be coming along
    // Timed, we need to end this bidding in 5 days
    function bid(string memory bidderName) public payable timed {
        if (msg.value > highBidder.bid) {
            highBidder.bidder = msg.sender;
            highBidder.bidderName = bidderName;
            highBidder.bid = msg.value;

            // Received a higher bid - emit event
            emit NewHighBid(msg.sender, bidderName, msg.value);
            //if you have a front-end application watching for this, you can see high bid event has been issued.
        } else {
            // Received bid less than high bid - emit event
            emit BidFailed(msg.sender, bidderName, msg.value);
            //if you have a front-end application watching for this, you can see bid failed event has been issued.

            // throwing exception would return the ethers
            revert("Sorry, Your Bid amount is less than then the current highest bid.");
        }
    }
}