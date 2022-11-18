// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "@openzeppelin/contracts-upgradeable/utils/cryptography/EIP712Upgradeable.sol";
import "@openzeppelin/contracts/proxy/Clones.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/token/ERC1155/ERC1155Upgradeable.sol";
import "./AKXID.sol";

contract AKXIDCreator {

    address _impl;
    mapping(address => bytes32) internal _salt;
    mapping(address => address) internal _clones;
    mapping(bytes32 => bool) internal _existSalt;
    mapping(address => bool) internal _alreadyDone;

    constructor(address _implementation) {
        _impl = _implementation;
    }

    function cloneAkxID(bytes memory deterministicData, address _sender) external returns(address newAkxIDContract) {

        bytes32 dData = keccak256(abi.encode(deterministicData));
        if(_existSalt[dData]) {
            revert("invalid deterministic data for akx id");
        }
        _existSalt[dData] = true;
        address dAddress = Clones.predictDeterministicAddress(_impl, dData, _sender);
        if(_alreadyDone[_sender]) {
            revert("only one akxid by address");
        }
        _clones[_sender] = dAddress;
        
        newAkxIDContract = Clones.cloneDeterministic(_impl, dData);

    }

}
