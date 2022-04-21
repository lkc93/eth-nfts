pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/token/ERC721/extensions/ERC721URIStorage.sol";

contract BucketListFamily is ERC721URIStorage, Ownable {
    using Counters for Counters.Counter;
    Counters.Counter private _tokenIds;

    constructor() ERC721("BucketListFamily", "BucketListFamily") {}

    uint256 private MAX_TOKEN_SUPPLY = 10000;
    uint256 public price = 70000000000000000; // ~10 bucks 

    string private baseTokenURI = "https://api.thebucketliststudios.com/nfts/wildlife/series-1/";

    function mintNFT(address recipient)
        public payable
        returns (uint256)
    {
        require(msg.value == price, "Tried to mint with the wrong amount");
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        require(newItemId<=MAX_TOKEN_SUPPLY);
        _mint(recipient, newItemId);
        
        _setTokenURI(newItemId, string(abi.encodePacked(baseTokenURI, Strings.toString(newItemId))));

        return newItemId;
    }

    function mintNFTOwner(address recipient)
        public
        onlyOwner
        returns (uint256)
    {
        _tokenIds.increment();

        uint256 newItemId = _tokenIds.current();
        _mint(recipient, newItemId);
        _setTokenURI(newItemId, string(abi.encodePacked(baseTokenURI, Strings.toString(newItemId))));

        return newItemId;
    }
}
