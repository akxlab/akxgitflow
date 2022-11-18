// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

interface IAkxId {

    event AKXIDCreated(address indexed to, bytes32 akxid);
    event NamedAliasClaimed(bytes32 akxid, string namedAlias);


    function embedImmutableData(bytes calldata extraData) external returns(bool success);

    function embedModifiableData(bytes memory extraData) external returns(bool success);






}