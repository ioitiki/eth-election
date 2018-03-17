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

    event votedEvent (
        uint indexed _candidateId
    );

    function Election() public {
        addCandidate("Candidate 1");
        addCandidate("Candidate 2");
    }

    function addCandidate(string _name) private {
        candidatesCount++;
        candidates[candidatesCount] = Candidate(candidatesCount, _name, 0);
    }

    function vote(uint _candidateId) public {
        // Requre that they haven't voted before
        require(!voters[msg.sender]);

        // Require that they are voting for a valid candidate
        require(_candidateId > 0 && _candidateId <= candidatesCount);

        // Record that voter has voted
        voters[msg.sender] = true;

        // Upadate our candidates vote count
        candidates[_candidateId].voteCount ++;

        // Trigger votedEvent
        votedEvent(_candidateId);
    }
}
