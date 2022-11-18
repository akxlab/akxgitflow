// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "./BaseAsset.sol";
import "./BaseAssetTypes.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract AssetNamedAlias is BaseAsset, BaseAssetTypes, Ownable {


    mapping(bytes32 => string) internal namedAliases;

    /// @dev keccak256("namedAlias(bytes32 akxid)")
    bytes32 public constant ASSET_NAMED_ALIAS_TYPE_HASH = 0xbff15cf90d67922a3273e0be051e311aba24f6233c95443021dfbab0398d3a86;


    constructor() {
        _mutable = false; // cannot mutate named alias
        typeId = TYPE_NAMED_ALIAS;
    }

    function createNewAsset(string memory name, bytes32 akxid, bytes calldata signature) public onlyOwner {

    }

    function createNewAsset(string memory name, bytes32 akxid, bytes calldata signature, uint256 chainId) public onlyOwner {

    }

    function namedAlias(bytes32 akxid) public returns(string memory) {

    }



}