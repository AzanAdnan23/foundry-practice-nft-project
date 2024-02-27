// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {Script} from "forge-std/Script.sol";
import {MoodNft} from "../src/MoodNft.sol";
import {Base64} from "@openzeppelin/contracts/utils/Base64.sol";

contract DeployMoodNft is Script {
    function run() external returns (MoodNft) {
        string memory Sadsvg = vm.readFile("./img/sad.svg");
        string memory Happysvg = vm.readFile("./img/happy.svg");

        vm.startBroadcast();

        MoodNft moodNft = new MoodNft(svgToImageURI(Sadsvg), svgToImageURI(Happysvg);

        vm.endBroadcast();
        return moodNft;
    }

    function svgToImageURI(
        string memory svg
    ) public pure returns (string memory) {
        string memory baseURL = "data:image/svg+xml;base64,";

        string memory svgBase64Encoded = Base64.encode(
            bytes(string(abi.encodePacked(svg)))
        );
        return string(abi.encodePacked(baseURL, svgBase64Encoded));
    }
}