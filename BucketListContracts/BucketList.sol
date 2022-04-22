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
    string public baseTokenURI;

    constructor()
        ERC721("BucketListFamily", "BucketListFamily")
        RandomlyAssigned(MAX_TOKEN_SUPPLY, 1)
    {
        baseTokenURI = "https://api.thebucketliststudios.com/nfts/wildlife/series-1/";
    }

    function mintNFT(address recipient, uint256 numberOfTokens)
        public payable
    {
        require(msg.value == numberOfTokens * price, "Tried to mint with the wrong amount");

        for (uint256 i = 0; i < numberOfTokens; i++) {
            uint256 newItemId = nextToken(); // RandomlyAssigned will give us a token.

            _mint(recipient, newItemId);
        
            _setTokenURI(newItemId, string(abi.encodePacked(baseTokenURI, Strings.toString(newItemId))));
        }
    }

    function setBaseUri(string memory _uri) external onlyOwner {
        baseTokenURI = _uri;
    }
}
