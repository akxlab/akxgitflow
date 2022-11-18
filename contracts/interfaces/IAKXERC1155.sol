// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import { IERC1155 } from "@openzeppelin/contracts/token/ERC1155/IERC1155.sol";
import { IERC1155MetadataURI } from "@openzeppelin/contracts/token/ERC1155/extensions/IERC1155MetadataURI.sol";

/// @title AKX ERC1155 interface
/// @notice signed container to manage AKX ID assets and AKX ID Metadatas

interface IAKXERC1155 is IERC1155, IERC1155MetadataURI {

    

    /// @dev mint function that will create and assign new assets to the AKX ID
    function mint(address to, bytes calldata data) external returns(bool success);
    /// @dev burn function that will remove and unassign assets from the AKX ID
    function burn(address to, bytes calldata data) external returns(bool success);

    function assetsURI() external returns(string memory _uri);


}