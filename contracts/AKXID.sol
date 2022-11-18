// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "./interfaces/IAkxId.sol";
import "./tokens/AKXERC1155.sol";
import "@openzeppelin/contracts/utils/introspection/ERC165.sol";


contract AKXID is IAkxId, ERC165 {

    string private _namedAlias;
    bytes32 private _AKX_ID;
    string public name;
    string public symbol;

   

   

    function embedImmutableData(bytes calldata extraData)
        external
        override
        returns (bool success)
    {}

    function embedModifiableData(bytes memory extraData)
        external
        override
        returns (bool success)
    {}

    function setGeneratedId(bytes calldata data) internal {
        _AKX_ID = keccak256(data);
    }

   
    function getAssets() public returns(uint256[] memory assetIds) {

    }

}
