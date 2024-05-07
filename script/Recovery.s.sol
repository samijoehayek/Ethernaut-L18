// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {SimpleToken} from "../src/Recovery.sol";

contract RecoveryScript is Script {
    SimpleToken public simpleToken =
        SimpleToken(payable(0xb1e4eD054cd8BCF2D7528a2845b81c8D560E3153));
    // This contract address represents the RecoveryToken Contract deployed: 0xBD0530dB8ef579cC129b2e4C132aBb54DDE0c4fF
    // This contract address represents the SimpleToken Contract deployed: 0xb1e4eD054cd8BCF2D7528a2845b81c8D560E3153
    function run() public {
        vm.startBroadcast(vm.envUint("PRIVATE_KEY"));
        console.log(address(simpleToken).balance);
        simpleToken.destroy(
            payable(address(0xA86Ea1be0A43Ea977dd7489c7c91247B1a7bC50b))
        );
        console.log(address(simpleToken).balance);

        vm.stopBroadcast();
    }
}