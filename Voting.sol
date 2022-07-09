pragma solidity >=0.5.2;

contract Voting {
    //constructor to initialize candidates
    //vote for cacndidates
    //get count of votes for each candidates
    	mapping (bytes32 => uint8) public votesReceived;
	bytes32[] public candidateList;

    constructor(bytes32[] memory candidateNames) public {
        candidateList = candidateNames;
    }

    function voteForCandidate(bytes32 candidate) public {
        require(validCandidate(candidate));
        votesReceived[candidate] += 1;
    }

    function totalVotesFor(bytes32 candidate) view public returns(uint8){
        require(validCandidate(candidate));
	return votesReceived[candidate];
    }

    function validCandidate(bytes32 candidate) view public returns (bool){
        for(uint i=0; i<candidateList.length; i++){
            if(candidateList[i] == candidate){
                return true;
            }
        }
        return false;
    }
}
