// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Script, console} from "forge-std/Script.sol";
import {MoodNft} from "../src/MoodNft.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";

contract MintMoodNft is Script {
    function run() external {
        vm.startBroadcast();
        address mostRecentDeployed = DevOpsTools.get_most_recent_deployment(
            "MoodNft",
            block.chainid
        );
        vm.stopBroadcast();

        mintNft(mostRecentDeployed);
    }

    function mintNft(address contractAddress) internal {
        vm.startBroadcast();

        MoodNft(contractAddress).mintNft();

        vm.stopBroadcast();
    }
}
