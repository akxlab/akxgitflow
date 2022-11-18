// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;
import "@openzeppelin/contracts/access/Ownable.sol";
import "../libs/Storage.sol";

contract AssetRepository is Storage, Ownable {

    struct AssetRecord {
        uint8 AssetType;
        uint64 createdAt;
        bool _mutable;
        bytes32 id;
        bytes data;
    }

    struct Assets {
        mapping(bytes32 => AssetRecord) assets;
    }

  

    function getAssetsStorage() internal pure returns(Assets storage asr) {
        bytes32 ASSET_REPO_SLOT = keccak256("akx.ecosystem.secure.assets");
        unchecked {
            assembly {
                asr.slot := ASSET_REPO_SLOT
            }
        }
    }

    function readStorage(bytes32 akxid) internal view returns(AssetRecord storage asr) {
        asr = getAssetsStorage().assets[akxid];
        return asr;
    }

    function setData(bytes32 akxid, uint8 assetType, bytes calldata data) public {
        
    }



}