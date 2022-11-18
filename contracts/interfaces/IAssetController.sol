// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

interface IAssetController {

    event AssetMintingRequested(address indexed _from, bytes32 akxid, bytes32 request_id);
    event AssetMinted(address indexed _from, bytes32 akxId, uint256 assetId);
    event AssetBurned(address indexed _from, bytes32 akxid, uint256 assetId);
    event AssetViewed(uint256 assetId);


    struct NewAssetRequest {
        bytes signature;
        uint8 asset_type;
        bytes32 akxid;
        bytes assetHash;
        bool modifiable;
    }

    function mintAndAssign(bytes calldata data) external returns(uint256 assetId);

    function burnAndTrash(uint256 assetId, bytes32 akxId, bytes calldata signedRequest) external returns(bool success);

    function views() external returns(uint256);
    function viewed(uint256 assetId) external;
    function checkAcl(bytes32 akxId, uint256 assetId) external returns(bool allowed);


}

