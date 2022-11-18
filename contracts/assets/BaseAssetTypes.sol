// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

abstract contract BaseAssetTypes {
    uint8 TYPE_NONE = 0; // rarely used if at all
    uint8 TYPE_TEXT = 1;
    uint8 TYPE_IPFS_URI_IMAGE = 2;
    uint8 TYPE_IPFS_URI_VIDEO = 3;
    uint8 TYPE_OFFLINE_CUSTOM = 4;
    uint8 TYPE_TOKEN = 5;
    uint8 TYPE_NFT = 6;
    uint8 TYPE_REWARD = 7;
    uint8 TYPE_REP = 8;
    uint8 TYPE_PROFILE_DATA = 9;
    uint8 TYPE_APPLICATION = 10;
    uint8 TYPE_NAMED_ALIAS = 11;

    function TypeToString(uint8 typeByte) public pure returns (string memory) {
        if (typeByte == 0) return "NONE";
        if (typeByte == 1) return "TEXT";
        if (typeByte == 2) return "IPFS_IMAGE";
        if (typeByte == 3) return "IPFS_VIDEO";
        if (typeByte == 4) return "OFFLINE_CUSTOM";
        if (typeByte == 5) return "TOKEN";
        if (typeByte == 6) return "NFT";
        if (typeByte == 7) return "REWARD";
        if (typeByte == 8) return "REP";
        if (typeByte == 9) return "PROFILE_DATA";
        revert("invalid type");
    }
}
