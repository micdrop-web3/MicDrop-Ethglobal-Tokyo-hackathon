//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.4;

import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/security/ReentrancyGuard.sol"; // security control
import "@openzeppelin/contracts/token/ERC721/ERC721.sol";

import "hardhat/console.sol";

contract Micdrop is ReentrancyGuard {
    using Counters for Counters.Counter;
    Counters.Counter private _eventId;
    Counters.Counter private _ticketInfoSold;

    address payable owner;

    constructor() {
        owner = payable(msg.sender);
    }

    struct CreatorEvents {
        uint256 eventId;
        uint256 tokenId;
        address mintEventContract;
        address payable seller;
        address payable owner;
        uint256 eventPrice;
    }

    mapping(uint256 => CreatorEvents) private streamEvent;

    event EventCreated(
        uint256 indexed eventId,
        uint256 indexed tokenId,
        address mintEventContract,
        address seller,
        address owner,
        uint256 indexed eventPrice
    );

    function createEventTickets(
        address mintEventContract,
        uint256 tokenId,
        uint256 eventPrice
    ) public payable nonReentrant {
        _eventId.increment();
        uint256 eventId = _eventId.current();

        streamEvent[eventId] = CreatorEvents(
            eventId,
            tokenId,
            mintEventContract,
            payable(msg.sender), 
            payable(address(0)), 
            eventPrice
        );

        IERC721(mintEventContract).transferFrom(
            msg.sender,
            address(this),
            tokenId
        );

        emit EventCreated(
            eventId,
            tokenId,
            mintEventContract,
            msg.sender,
            address(0),
            eventPrice
        );
    }

    function purchaseTicket(address mintEventContract, uint256 eventId)
        public
        payable
        nonReentrant
    {
        uint256 eventPrice = streamEvent[eventId].eventPrice;
        uint256 tokenId = streamEvent[eventId].tokenId;
        require(
            msg.value == eventPrice,
            "Please submit the correct amount in order to complete purchase"
        );

        streamEvent[eventId].seller.transfer(msg.value);
        IERC721(mintEventContract).transferFrom(
            address(this),
            msg.sender,
            tokenId
        );
        streamEvent[eventId].owner = payable(msg.sender);
        _ticketInfoSold.increment();
        payable(owner).transfer(eventPrice);
    }

    function checkForTicket() public view returns (CreatorEvents[] memory) {
        uint totalticketCount = _eventId.current();
        uint ticketCount = 0;
        uint currentIndex = 0;

        // find out the size of the array - because no dynamic arrays allowed in Solidity
        for (uint i = 0; i < totalticketCount; i++) {
            if (streamEvent[i + 1].owner == msg.sender) {
                ticketCount += 1;
            }
        }

        CreatorEvents[] memory ticketInfo = new CreatorEvents[](ticketCount);

        for (uint i = 0; i < totalticketCount; i++) {
            if (streamEvent[i + 1].owner == msg.sender) {
                uint currentId = streamEvent[i + 1].eventId;
                CreatorEvents storage currentTicketInfo = streamEvent[currentId];
                ticketInfo[currentIndex] = currentTicketInfo;
                currentIndex += 1;
            }
        }

        return ticketInfo;
    }
}
 
