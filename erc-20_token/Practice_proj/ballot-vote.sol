// SPDX License-Identifier: MIT
pragma solidity 0.8.18;

/// @title Voting with delegation

contract Ballot {
// This declares a new complex type which will
// be used for variables later.
// It will represent a single voter.
    struct Voter {
        uint weight; // weight is accumulated by delegation
        bool voted; // if true, that person already voted
        address delegate; // person delegated to
        uint vote; // index of the voted proposal
    }

// This is a type for a single proposal
    struct Proposal {
        bytes32 name; //short name (up to 32 bytes)
        uint voteCount; // number of accumulated votes
    }

    address public chairPerson;

// This declares a state variable that
// stores a `Voter` struct for each possible address.
    mapping(address => Voter) public voters;

// A dynamically-sized array of `Proposal` structs.
  Proposal[] public proposals;

/// Create a new ballot to choose one of `proposalNames`.  
constructor(bytes32[] memory proposalNames){
    chairPerson = msg.sender;
    voters[chairPerson].weight = 1

 // For each of the provided proposal names,
// create a new proposal object and add it
// to the end of the array. 
    for (uint i = 0; i < proposalNames.length; i++){
// `Proposal({...})` creates a temporary
// Proposal object and `proposals.push(...)`
// appends it to the end of `proposals`. 
    proposals.push(Proposal({
        name: proposalNames[i],
        voteCount: 0;
    }));     
    }
}

// Give `voter` the right to vote on this ballot.
// May only be called by `chairperson`.
function giveRightToVote(address voter) external {
// If the first argument of `require` evaluates
// to `false`, execution terminates and all
// changes to the state and to Ether balances
// are reverted.
// It is often a good way to use `require` to check if
// functions are called correctly.
// As a second argument, you can also provide an
// explanation about what went wrong. 
require(
    msg.sender == chairPerson,
    "Only chairPerson can give right to vote."
);
require(
    !voter[voter].voted,
    "The voter already voted"
);
require(voters[voter].weight == 0);
voters[voter].weight =1;

}

 /// Delegate your vote to the voter `to`
 function delegate(address to) external {
    //assigns reference 
    Voter storage sender = voters[msg.sender];
    require(sender.weight != 0, "You have no right to vote");
    require(!sender.voted, "You already voted");
    require(to !=msg.sender, "Self-delegation is disallowed");

// Forward the delegation as long as
// `to` also delegated.  
//In general, such loops are very dangerous,
// because if they run too long, they might
// need more gas than is available in a block.
// In this case, the delegation will not be executed,
// but in other situations, such loops might
// cause a contract to get "stuck" completely  
    while (voters[to].delegate != address(0){
        to = voters[to].delegate;
        
    })

 }

}