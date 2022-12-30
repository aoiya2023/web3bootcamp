//SPDX-License-Identifier: MIT
pragma solidity 0.8.17;

import "@openzeppelin/contracts/token/ERC721/ERC721.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract simpleNFT is ERC721, Ownable {

    uint public totalSupply;
    uint public maxSupply;
    string public baseURL;

    constructor(string memory enteredURL, uint max) ERC721("NFTtest", "NFT") {
        maxSupply = max;
        baseURL = enteredURL;
    }

    function _baseURI() internal view override returns (string memory) {
        return baseURL;
    }

    function safeMint(address to) public onlyOwner {
        require(maxSupply > totalSupply, "Already Minted Max");
        uint tokenId = totalSupply;
        totalSupply += 1;
        _mint(to, tokenId);
    } 

    function multiMint(address[] memory addy) public onlyOwner {
        for (uint i = 0; i < addy.length; i++) {
            require(maxSupply > totalSupply, "Already Minted Max");
            uint tokenId = totalSupply;
            totalSupply += 1;
            _mint(addy[i], tokenId);
        }
    } 

}
