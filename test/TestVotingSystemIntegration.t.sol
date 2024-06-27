//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {Voting} from "../src/VotingSystem.sol";
import {DeployVoting} from "../script/DeployVotingSystem.s.sol";
import {VoteForCandidateToVotingSystem, AddCandidateToVotingSystem} from "../script/Interaction.s.sol";

contract InteractionTest is Test {
    Voting voting;

    function setUp() external {
        DeployVoting deployVoting = new DeployVoting();
        voting = deployVoting.run();
    }

    function testAddCandidateToVotingSystem_I() public {
        AddCandidateToVotingSystem addCandidateToVotingSystem = new AddCandidateToVotingSystem();
        addCandidateToVotingSystem.addCandidateToVoting(address(voting));

        console.log(voting.getNumberOfCandidate());
        assertEq(voting.getNumberOfCandidate(), 3);
        
    }

    function testvoteForCandidateInVoting() public {
        VoteForCandidateToVotingSystem voteForCandidateToVotingSystem = new VoteForCandidateToVotingSystem();
        voteForCandidateToVotingSystem.voteForCandidateInVoting(address(voting));

        assertEq(voting.getVotingStatus(), true);

        
    }

    function testvoteForCandidateInVotingNotTwice() public {
        VoteForCandidateToVotingSystem voteForCandidateToVotingSystem = new VoteForCandidateToVotingSystem();
        voteForCandidateToVotingSystem.voteForCandidateInVoting(address(voting));

        vm.expectRevert();
        voteForCandidateToVotingSystem.voteForCandidateInVoting(address(voting));


    }
}