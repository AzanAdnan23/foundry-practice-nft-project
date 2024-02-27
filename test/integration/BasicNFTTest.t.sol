//SPDX-License-Identifier: MIT

pragma solidity ^0.8.20;

import {Test} from "forge-std/Test.sol";
import {BasicNFT} from "../src/BasicNFT.sol";
import {DeployBasicNFT} from "../script/DeployBasicNFt.s.sol";

contract BasicNFTTest is Test {
    string constant NFT_NAME = "Mano";
    string constant NFT_SYMBOL = "CAT";

    DeployBasicNFT public deployBasicNFT;
    BasicNFT public basicNFT;

    string public constant PUG_URI =
        "ipfs://bafybeig37ioir76s7mg5oobetncojcm3c3hxasyd4rvid4jqhy4gkaheg4/?filename=0-PUG.json";

    address public USER = makeAddr("USER");

    function setUp() public {
        deployBasicNFT = new DeployBasicNFT();
        basicNFT = deployBasicNFT.run();
    }

    function testInitializedCorrectly() public view {
        assert(
            keccak256(abi.encodePacked(basicNFT.name())) ==
                keccak256(abi.encodePacked((NFT_NAME)))
        );
        assert(
            keccak256(abi.encodePacked(basicNFT.symbol())) ==
                keccak256(abi.encodePacked((NFT_SYMBOL)))
        );
    }

    function testCanMintAndHaveABalance() public {
        vm.prank(USER);
        basicNFT.mintNft(PUG_URI);

        assert(basicNFT.balanceOf(USER) == 1);
        assert(
            keccak256(abi.encodePacked(basicNFT.tokenURI(0))) ==
                keccak256(abi.encodePacked(PUG_URI))
        );
    }
}
