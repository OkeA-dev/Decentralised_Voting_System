//// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Script, console} from "forge-std/Script.sol";
import {Voting} from "../src/VotingSystem.sol";

contract DeployVoting is Script {

    Voting voting;

    string[] _candidatesName = ["John Doe", "Jane Smith"];
    string[] _partyNames = ["Party A", "Party B"];
    string[] _cities = ["City 1", "City 2"];
    uint256 durationInMin = 60 * 24 * 30;



    function run() external returns (Voting) {
        vm.startBroadcast();
        voting = new Voting(
            _candidatesName,
            _partyNames,
            _cities,
            durationInMin
        );
        vm.stopBroadcast();

        return voting;
    }
}