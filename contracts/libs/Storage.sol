// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.17;

import "./ReadOnlyStorage.sol";

abstract contract Storage is ReadOnlyStorage {

   mapping(address => bytes32) internal akxIds;
   mapping(bytes32 => uint256) internal signedMessages;
   mapping(address => mapping(bytes32 => uint256)) internal approvedHashes;

   mapping(uint256 => bool) internal allowedChains;

   uint256 internal idCount;

   uint256 internal _nonce;

  /**
     * @dev Performs a delegatecall on a targetContract in the context of self.
     * Internally reverts execution to avoid side effects (making it static).
     *
     * This method reverts with data equal to `abi.encode(bool(success), bytes(response))`.
     * Specifically, the `returndata` after a call to this method will be:
     * `success:bool || response.length:uint256 || response:bytes`.
     *
     * @param targetContract Address of the contract containing the code to execute.
     * @param calldataPayload Calldata that should be sent to the target contract (encoded method name and arguments).
     */
    function simulateAndRevert(address targetContract, bytes memory calldataPayload) external {
        // solhint-disable-next-line no-inline-assembly
        assembly {
            let success := delegatecall(gas(), targetContract, add(calldataPayload, 0x20), mload(calldataPayload), 0, 0)

            mstore(0x00, success)
            mstore(0x20, returndatasize())
            returndatacopy(0x40, 0, returndatasize())
            revert(0, add(returndatasize(), 0x40))
        }
    }

}