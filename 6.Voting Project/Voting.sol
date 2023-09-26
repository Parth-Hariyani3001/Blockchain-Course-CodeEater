// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract voting{
    address electionComission;
    address public winner;

    struct Voter{
        string name;
        uint age;
        uint voterId;
        string gender;
        uint voteCandidateId;   //To which candidate, the voter has voted for -> 1,2
        address voterAddress;
    }

    struct Candidate{
        string name;
        string party;
        uint age;
        string gender;
        uint candidateId;
        address candidateAddress;
        uint votes;
    }

    uint nextVoterID = 1;
    uint nextCandidateId = 1;

    uint startTime;
    uint endTime;

    mapping(uint => Voter) voterDetails;
    mapping(uint => Candidate) candidateDetails;
    bool stopVoting;

    constructor(){
        electionComission = msg.sender;
    }

    modifier isVotingOver(){
        require(block.timestamp > endTime && stopVoting == true, "Voting is not over");
        _;
    }

    modifier onlycommissioner(){
        require(electionComission == msg.sender , "Not from the election commision");
        _;
    }

    function candidateRegister(string calldata _name,string calldata _party,uint _age,string calldata _gender) external {
        require(msg.sender != electionComission,"You are from election commission");
        require(candidateVerification(msg.sender) == true, "Candidate Already Registered");
        require(_age >= 18, "You are not eligible");
        require(nextCandidateId <= 2,"Maximum number of candidate registered");
        candidateDetails[nextCandidateId] = Candidate(_name,_party,_age,_gender,nextCandidateId,msg.sender,0);
        nextCandidateId++;
    }

    

    function candidateVerification(address _person) internal view returns(bool){
        for(uint i = 1; i < nextCandidateId; i++){
            if(candidateDetails[i].candidateAddress == _person){    
                return false;   //loop enter - candidate exist
            }
        }
        return true;    //candidate does not exist
    }

    function candidateList() public view returns(Candidate[] memory){
        Candidate[] memory candidatesArr = new Candidate[](nextCandidateId - 1);
        for(uint i = 1; i < nextCandidateId; i++){
            candidatesArr[i-1] = candidateDetails[i];
        }
        return candidatesArr;
    }

    function voterRegister(string calldata _name,uint _age,string calldata _gender) external {
        require(voterVerification(msg.sender) == true, "You are already registered");
        require(_age >= 18, "You are not eligible to vote");
        voterDetails[nextVoterID] = Voter(_name,_age,nextVoterID,_gender,0,msg.sender);   
        nextVoterID++;     
    }

    function voterVerification(address _person) internal view returns(bool){
        for(uint i = 1; i < nextVoterID; i++){
            if(voterDetails[i].voterAddress == _person){
                return false;   //loop enter - voter exist
            }
        }
        return true;  //Voter does not exist
    }
    
    function voterList() public view returns(Voter[] memory){
        Voter[] memory voterArray = new Voter[](nextVoterID - 1);
        for(uint i = 1; i <  nextVoterID; i++){
            voterArray[i-1] = voterDetails[i];
        }
        return voterArray;
    }

    function vote(uint _voterId,uint _id) external isVotingOver() {
        require(voterDetails[_voterId].voteCandidateId == 0,"Already voted");
        require(voterDetails[_voterId].voterAddress == msg.sender,"You are not a voter yet, please register yourself first");
        require(startTime != 0,"Voting not started");
        require(nextCandidateId==3,"Candidate registrations have not been completed yet");
        require(_id>0 && _id<3,"Invalid candidate ID");
        voterDetails[_voterId].voteCandidateId = _id;
        candidateDetails[_id].votes++;
    }

    function voteTime(uint _startTime,uint _endTime) external onlycommissioner() {
        startTime = block.timestamp + _startTime; //4PM + 2 hours = 6PM
        endTime = startTime + _endTime; //6 PM + 2 hours = 8PM
        stopVoting = false;
    }

    function votingStatus() public view returns(string memory){
        if(startTime == 0){
            return "Voting has not started";
        } else if ((startTime != 0 && endTime > block.timestamp) && stopVoting == false){
            return "In Progress";
        } else {
            return "Ended";
        }
    }

    // function result() external onlycommissioner(){
    //     Candidate storage candidate1 = candidateDetails[1];
    //     Candidate storage candidate2 = candidateDetails[2];
    //     if(candidate1.votes > candidate2.votes){
    //         winner = candidate1.candidateAddress;
    //     }   else{
    //         winner = candidate2.candidateAddress;
    //     }
    // }

    function result() external onlycommissioner() isVotingOver() {
        uint max = type(uint).min;
        address currentWinner;
        for(uint i = 1; i < nextCandidateId; i++){
            if(candidateDetails[i].votes > max){
                max = candidateDetails[i].votes;
                currentWinner = candidateDetails[i].candidateAddress;
            }
        }
        winner = currentWinner;
    }

    function emergency() public onlycommissioner() {
        stopVoting = true;
    }
}