// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "../interfaces/IAKXERC1155.sol";
import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/utils/Counters.sol";
import "@openzeppelin/contracts/utils/Strings.sol";
import "./utils/AKXERC1155Metadata.sol";

contract AKXERC1155 is IAKXERC1155, ERC1155, AKXERC1155Metadata, Ownable {


    constructor(string memory uri_) ERC1155(uri_) {
        
    }

    function mint(address to, bytes calldata data)
        external
        override
        returns (bool success)
    {}

    function burn(address to, bytes calldata data)
        external
        override
        returns (bool success)
    {}

    function assetsURI() external override returns (string memory _uri) {}
}