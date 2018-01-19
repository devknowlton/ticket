pragma solidity ^0.4.0;

contract Ticket{

    //Some identifier for the event
    uint public eventId;
    uint public ticketNum;
    address[] ticketHolders;

    event TicketSuccess ();

    function Ticket (uint _eventId, uint _ticketNum){
        eventId = _eventId;
        ticketNum = _eventId;
    }

    function buyTicket () public{

    }

    // Add a ticket transfer function

    //Add an array which holds each ticket holder which is likely a struct

    //Add a function which validates the ticket holder for presenting at the door - or do they send a signed message?

    //Add a function for tickets left
}
