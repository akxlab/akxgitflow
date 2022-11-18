// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "./Storage.sol";
import "../AKXID.sol";

contract SignInternalMsgs is Storage {

    // keccak256("AKXIDMessage(bytes message)")
    bytes32 private constant AKXID_MSG_TYPEHASH = 0x53009cb08647d8eb49de5b27674db23fcdf7de28d4f4faa22527a2e43382e089;

    function signMessage(bytes calldata _data) external {
        bytes32 msgHash = getMessageHash(_data);
        signedMessages[msgHash] = 1;
    }

    function getMessageHash(bytes memory message) public returns (bytes32) {
        bytes32 akxIdMsgHash = keccak256(abi.encode(AKXID_MSG_TYPEHASH, keccak256(message)));
        return keccak256(abi.encodePacked(bytes1(0x19), bytes1(0x01), AKXID(payable(address(this))).domainSeparator(), akxIdMsgHash));

    }

}