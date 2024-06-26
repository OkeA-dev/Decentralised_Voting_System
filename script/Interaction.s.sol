// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Voting} from "../src/VotingSystem.sol";
import {DevOpsTools} from "lib/foundry-devops/src/DevOpsTools.sol";
import {Script, console} from "forge-std/Script.sol";

contract AddCandidateToVotingSystem is Script {

    function addCandidateToVoting(address mostRecentlyDeployed) public {
        vm.startBroadcast();
        Voting(mostRecentlyDeployed).addCandidate("Fredick", "Party H", "City 5");

        vm.stopBroadcast();
    }

    function run() external {
        address mostRecentlyDeploy = DevOpsTools.get_most_recent_deployment(
            "Voting",
            block.chainid
        );
        addCandidateToVoting(mostRecentlyDeploy);
    }
}

contract VoteForCandidateToVotingSystem is Script {

    function voteForCandidateInVoting(address mostRecentlyDeployed) public {

        vm.startBroadcast();
        Voting(mostRecentlyDeployed).vote(1);
        vm.stopBroadcast();
    }

    function run() external {
        address mostRecentlyDeployed = DevOpsTools.get_most_recent_deployment(
            "Voting",
            block.chainid
        );
        voteForCandidateInVoting(mostRecentlyDeployed);
    }
}