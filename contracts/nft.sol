// SPDX-License-Identifier: MIT
pragma solidity ^0.8.9;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
//
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Enumerable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721Burnable.sol";
// 
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";

interface Token {

function transfer(address, uint256) external returns (bool);
function approve(address, uint256) external returns (bool);

function transferFrom(
    address,
    address,
    uint256
) external returns (bool);

function totalSupply() external view returns (uint256);

function balanceOf(address) external view returns (uint256);

function allowance(address, address) external view returns (uint256);

event Transfer(address indexed from, address indexed to, uint256 value);
event Approval(
    address indexed owner,
    address indexed spender,
    uint256 value
);
}


contract EstateNFT is ERC721, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

     address internal cUsdTokenAddress =
        0x874069Fa1Eb16D44d622F2e0Ca25eeA172369bC1;

    struct Property {
                address payable owner;
                string location;
        uint256 id;
        uint256 price;
        bool forSale;
    }

    mapping(uint256 => Property) public properties;

    event PropertyRegistered(uint256 indexed tokenId);
    event PropertyPurchased(uint256 indexed tokenId, address indexed buyer);
    event PropertyUpdated(uint256 indexed tokenId);
    event PropertyWithdrawn(uint256 indexed tokenId);

    constructor() ERC721("EstateNFT", "NFT") {}

// Registering a property to be registered on the marketplace
    function registerEstate(string memory location, uint256 price) public  {
        _tokenIds.increment();
        uint256 tokenId = _tokenIds.current();

        _mint(msg.sender, tokenId);

        Property memory newProperty = Property(
            payable(msg.sender),
            location,
             tokenId,
            price,
            true
        );
        properties[tokenId] = newProperty;

        emit PropertyRegistered(tokenId);
    }

    // 
function buyProperty(uint256 tokenId) public payable  {
        Property storage property = properties[tokenId];

        require(property.forSale, "Property is not for sale.");

         require(
            Token(cUsdTokenAddress).transferFrom(
                msg.sender,
                property.owner,
                property.price
            ),
            "Transfer failed."
        );
         _transfer(property.owner, msg.sender, tokenId);
        property.owner = payable(msg.sender);
        property.forSale = false;

        emit PropertyPurchased(tokenId, msg.sender);
    }

    function updatePropertyPrice(uint256 tokenId, uint256 newPrice) public  {
        Property storage property = properties[tokenId];

        require(msg.sender == property.owner, "Not authorized to update the price.");
        require(property.forSale, "Property is not for sale.");

        property.price = newPrice;

        emit PropertyUpdated(tokenId);
    }

    function putPropertyForSale(uint256 tokenId, uint256 price) public  {
        Property storage property = properties[tokenId];

        require(msg.sender == property.owner, "Not authorized to put the property for sale.");
        require(!property.forSale, "Property is already for sale.");

        property.price = price;
        property.forSale = true;
    }

    function withdrawProperty(uint256 tokenId) public  {
        Property storage property = properties[tokenId];

        require(msg.sender == property.owner, "Not authorized to withdraw the property from sale.");
        require(property.forSale, "Property is not for sale.");

        property.forSale = false;

        emit PropertyWithdrawn(tokenId);
    }

    function getPropertyDetails(uint256 tokenId) public view returns (Property memory) {
        return properties[tokenId];
    }
}