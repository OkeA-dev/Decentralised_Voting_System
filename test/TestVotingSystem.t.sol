//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import {Test, console} from "forge-std/Test.sol";
import {Voting} from "../src/VotingSystem.sol";
import {DeployVoting} from "../script/DeployVotingSystem.s.sol";

contract TestVotingSystem is Test {
    Voting voting;
    address USER = makeAddr("user");

    function setUp() public {
        DeployVoting deployVoting = new DeployVoting();
        voting = deployVoting.run();
    }

    function testIsOwner() public view {
        console.log(msg.sender);
        console.log(voting.owner());

        assertEq(msg.sender, voting.owner());
    }

    function testOnlyOwnerCanAddCandidate() public {
        vm.prank(USER);
        vm.expectRevert();
        voting.addCandidate("John", "Party F", "city 3");
    }

    function testCanNotVoteTwice() public {
        vm.prank(USER);
        voting.vote(0);
        console.log(voting.checkVoterVote(USER));

        vm.prank(USER);
        vm.expectRevert();
        voting.vote(1);
    }
    
}
