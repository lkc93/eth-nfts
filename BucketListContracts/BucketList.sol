// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./RandomlyAssigned.sol";

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract BucketList is ERC721URIStorage, Ownable, RandomlyAssigned {
    using Counters for Counters.Counter;
    uint256 private MAX_TOKEN_SUPPLY = 10000;
    uint256 public price = 700000000000000000; // ~10 bucks - removed 2 0s for now to preserve matic

    string private baseTokenURI = "https://api.thebucketliststudios.com/nfts/wildlife/series-1/";

    constructor()
        ERC721("BucketListFamily", "BucketListFamily")
        RandomlyAssigned(MAX_TOKEN_SUPPLY, 1)
    {}

    function mintNFT(address recipient)
        public payable
        returns (uint256)
    {
        require(msg.value == price, "Tried to mint with the wrong amount");

        uint256 newItemId = nextToken(); // RandomlyAssigned will give us a token.

        _mint(recipient, newItemId);
        
        _setTokenURI(newItemId, string(abi.encodePacked(baseTokenURI, Strings.toString(newItemId))));

        return newItemId;
    }

    function mintNFTOwner(address recipient)
        public
        onlyOwner
        returns (uint256)
    {
        uint256 newItemId = nextToken();
        _mint(recipient, newItemId);
        _setTokenURI(newItemId, string(abi.encodePacked(baseTokenURI, Strings.toString(newItemId))));

        return newItemId;
    }
}
