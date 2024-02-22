// SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import "../src/BasicNFT.sol";
import {Script} from "forge-std/Script.sol";

contract DeployBasicNFT is Script {
    BasicNFT public basicNFT;

    function run() external returns (BasicNFT) {
        vm.startBroadcast();

        basicNFT = new BasicNFT();

        vm.stopBroadcast();
        return basicNFT;
    }
}
