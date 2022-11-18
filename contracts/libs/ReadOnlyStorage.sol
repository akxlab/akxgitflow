// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

abstract contract ReadOnlyStorage {
   /**
     * @dev Reads `length` bytes of storage in the currents contract
     *
     * @param offset The offset in the current contract's storage in words to start reading from
     * @param length The number of words (32 bytes) of data to read
     * @return the bytes that were read.
     */
    function getStorageAt(uint256 offset, uint256 length) external view returns (bytes memory) {
        bytes memory result = new bytes(length * 32);
        for (uint256 index = 0; index < length; index++) {
            assembly {
                let word := sload(add(offset, index))
                mstore(add(add(result, 0x20), mul(index, 0x20)), word)
            }
        }
        return result;
    }

}