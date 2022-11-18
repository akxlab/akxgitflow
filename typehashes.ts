import { ethers } from "ethers";

const typehash = ethers.utils.solidityKeccak256(["string"], ["namedAlias(bytes32 akxid)"]);
console.log(typehash);