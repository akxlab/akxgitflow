// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "../interfaces/IAssets.sol";

abstract contract BaseAsset is IAsset {

      bool internal _mutable;
    uint8 public typeId;
    mapping(bytes32 => bytes32) internal assetLinksToAKXID;
    mapping(bytes32 => bytes) internal signatures;
    mapping(bytes32 => bool) internal assetExists;


    function id() external view override returns (bytes memory _aId) {}

    function assign(bytes32 akxid, bytes calldata data)
        external
        override
        returns (bool success)
    {}

    function verify(bytes32 akxid, address assetAddress)
        external
        view
        override
        returns (bool verified)
    {}

    function chainIds()
        external
        view
        override
        returns (uint256[] memory _ids)
    {}

    function verifiedBytes()
        external
        view
        override
        returns (bytes memory _vbytes)
    {}

    function assetAlias()
        external
        view
        override
        returns (string memory _alias)

    {}

    function extra() external view override returns (bytes memory eBytes) {}

    function burn() external view override returns (bool success) {}

    function lock() external override {}

    function unlock() external override {}

    function assetUri() external override returns (string memory _uri) {}

 function assetType() external view override returns(uint8 aType) {
        return typeId;
     }

}