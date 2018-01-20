pragma solidity ^0.4.19;

contract TicketGen {

    uint32 public constant VERSION = 1;
    uint public ticketSupply;
    uint public ticketsSold;
    address public organizer;

    //For first iteration, using one ticket price. Later iteration can add special funtion to define ticket tiers
    //ticket price is in wei
    uint public ticketPrice;
    string public description;

    //Ticket struct. Still need to decide data model / add to it
    struct Ticket {
        address ticketOwner;
    }

    //Mapping ticket Ids to the Ticket struct
    mapping (bytes32 => Ticket) public tickets;

    //Array of ticketIds, that will be used to validate length against ticketSupply
    bytes32[] public ticketIds;


    //Constructor function. Will be used a separate contract per event.
    function TicketGen (uint _ticketSupply, string _description, uint _ticketPrice){
        ticketSupply = _ticketSupply;
        description = _description;
        ticketPrice = _ticketPrice;
        organizer = msg.sender;
    }

    function buyTicket () external payable returns (bool) {
        //Checking if tickets are sold out
        require(ticketsSold < ticketSupply);

        //Checking if buyer has sent enough funds
        require(msg.value >= ticketPrice );

        //pay organizer for ticket
        organizer.transfer(msg.value);

        //Now that all checks are complete, paid, can increase ticketsSold, generate Id, update Id array, update ticket mapping
        ticketsSold++;
        bytes32 _ticketId = keccak256(ticketsSold,VERSION);
        ticketIds.push(_ticketId);
        tickets[_ticketId].ticketOwner = msg.sender;

        return true;

        //Figure out which tier of ticket they want to buy in future

    }


    // Add a ticket transfer function


    //Add a function which validates the ticket holder for presenting at the door - or do they send a signed message?

    //Add a function for tickets left

    //Add solidity events

    //Add admin functions to manage ticketSupply or tiers of tickets?

    //How to deal with events that have multiple different tiers of tickets? Probably need a function to allow admin to set price and different arrays or tiers
}
