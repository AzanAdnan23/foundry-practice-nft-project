// SPDX-License-Identifier: MIT

pragma solidity ^0.8.24;

import {Test, console} from "forge-std/Test.sol";
import {DeployMoodNft} from "../../script/DeployMoodNft.s.sol";

contract DeployNftTest is Test {
    DeployMoodNft deployMoodNft;

    function setUp() public {
        deployMoodNft = new DeployMoodNft();
    }

    function testSvgToImageURI() public {}
}
