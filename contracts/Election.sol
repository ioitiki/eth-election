pragma solidity ^0.4.2;

contract Election {

    struct Candidate {
        uint id;
        string name;
        uint voteCount;
    }

    // Function for accessing each candidate
    mapping(uint => Candidate) public candidates;

    // Function to lookup who has voted
    mapping(address => bool) public voters;

    // Needed to keep track of the size of candidates
    uint public candidatesCount;

    function Election() public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

    function addCandidate(string _name) private {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    function vote(uint _candidateId) public {
        // Record that voter has voted
        voters[msg.sender] = true;

        // Upadate our candidates vote count
        candidates[_candidateId].voteCount ++;
    }
}
