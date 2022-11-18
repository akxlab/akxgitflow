// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

interface IAsset {

    event AssetAssigned(bytes32 minId, bytes32 akxid, bytes32 signature);
    event AssetBurned(bytes32 mintId, address to);


    function id() external view returns(bytes memory _aId);

    function assign(bytes32 akxid, bytes calldata data) external returns(bool success);

    function verify(bytes32 akxid, address assetAddress) external view returns(bool verified);

    function chainIds() external view returns (uint256[] memory _ids);

    function verifiedBytes() external view returns (bytes memory _vbytes);

    function assetAlias() external view returns (string memory _alias);

    function extra() external view returns (bytes memory eBytes);

    function burn() external view returns (bool success);

    function lock() external;

    function unlock() external;

    function assetUri() external returns (string memory _uri);

    function assetType() external returns(uint8 aType);
}