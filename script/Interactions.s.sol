//SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {Script} from "forge-std/Script.sol";
import {BasicNFT} from "../src/BasicNFT.sol";

contract MintBasicNFT is Script {
    string public constant PUG_URI =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    function run() external {
        vm.startBroadcast();
        address mostRecentDeployed = DevOpsTools.get_most_recent_deployment(
            "BasicNFT",
            block.chainid
        );
        mintNftOnContract(mostRecentDeployed);

        vm.stopBroadcast();
    }

    function mintNftOnContract(address contractAddress) internal {
        vm.startBroadcast();
        BasicNFT(contractAddress).mintNft(PUG_URI);
        vm.stopBroadcast();
    }
}
