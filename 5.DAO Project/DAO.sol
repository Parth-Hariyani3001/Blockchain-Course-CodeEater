// SPDX-License-Identifier: MIT
pragma solidity >0.8.18;

contract DAO{
    //struct for proposal
    struct Proposal{
        uint id;
        string description;
        uint amount;
        address payable receipient;
        uint votes;
        uint end;
        bool isExecuted;
    }
    //to store the list of investor
    mapping(address=>bool) private isInvestor;
    //to store the number of shares per user
    mapping(address=>uint) public numOfShares;
    //to check if a user has voted or not
    mapping(address=>mapping(uint=>bool)) public isVoted;
    //
    // mapping(address=>mapping(address=>bool)) public withdrawlStatus;
    //To store the list of investor
    address[] public investorsList;
    //to store the list of proposals
    mapping(uint=>Proposal) public proposals;
    //
    uint public totalShares;
    //
    uint public availableFunds;
    //
    uint public contributionTimeEnd;
    //
    uint public nextProposalID;
    //
    uint public voteTime;
    //minimum number of votes
    uint public quorum;
    //the address of manager
    address public manager;

    //1 hour = 60 minutes
    //1 minutes = 60 minutes
    //1 hour = 3600 seconds
    constructor(uint _contributionTimeEnd,uint _voteTime,uint _quorum){
        require(_quorum > 0 && _quorum < 100,"Not valid values");
        contributionTimeEnd = block.timestamp + _contributionTimeEnd; //4 PM + 2*3600 seconds
        voteTime = _voteTime;
        quorum = _quorum;
        manager = msg.sender;
    }

    modifier onlyInvestor(){
        require(isInvestor[msg.sender] == true,"You are not an investor");
        _;
    }
     modifier onlyManger(){
        require(msg.sender == manager,"You are not the manager");
        _;
    }

    //Function to contirbute
    function contribution() public payable{
        require(contributionTimeEnd >= block.timestamp,"Contribution time ended");
        require(msg.value > 0,"Send more than 0 ether");
        isInvestor[msg.sender] = true;
        numOfShares[msg.sender] = numOfShares[msg.sender] + msg.value;
        totalShares += msg.value;
        availableFunds += msg.value;
        investorsList.push(msg.sender);
        //Number of shares will be ether in wei 
    } 

    //function to reedem shares
    function reedemShare(uint amount) public onlyInvestor(){
        require(numOfShares[msg.sender] >= amount,"You don't have enough shares to reedem");
        require(availableFunds >= amount,"Not enough funds");
        numOfShares[msg.sender] -= amount;
        if(numOfShares[msg.sender] == 0){
            isInvestor[msg.sender] = false;
        }
        availableFunds -= amount;
        payable(msg.sender).transfer(amount); //Transferring the ether to the investor
    }

    //Function to transfer shares(not ether) to another address
    function transferShare(uint amount,address to) public onlyInvestor(){
        require(numOfShares[msg.sender] >= amount,"You don't have enough shares to Transfer");
        require(availableFunds >= amount,"Not enough funds");
        numOfShares[msg.sender] -= amount;
        if(numOfShares[msg.sender] == 0){
            isInvestor[msg.sender] = false;
        }
        numOfShares[to] += amount;
        isInvestor[to] = true;
        investorsList.push(to);
    }

    //Function to create proposal
    function createProposal(string calldata description,uint amount,address payable receipient) public onlyManger(){
        require(availableFunds >= amount, "Not enough funds");
        proposals[nextProposalID] = Proposal(nextProposalID,description,amount,receipient,0,block.timestamp + voteTime,false);
        nextProposalID++;
    }

    //function to vote for a proposal
    function voteProposal(uint proposalId) public onlyInvestor(){
        Proposal storage proposal = proposals[proposalId];
        require(isVoted[msg.sender][proposalId] == false,"You have already voted for this proposal");
        require(proposal.end >= block.timestamp,"Voting Time Ended");
        require(proposal.isExecuted == false,"It is already executed");
        isVoted[msg.sender][proposalId] = true;
        proposal.votes += numOfShares[msg.sender];
    }

    //votes = 50, totalShares = 100, percentage = (50/100)*100 = 50%
    //quorum = 51
    function executeProposal(uint proposalID) public onlyManger(){
        Proposal storage proposal = proposals[proposalID];
        require(((proposal.votes * 100)/totalShares) >= quorum,"Majority Does not support");
        proposal.isExecuted = true;
        availableFunds -= proposal.amount;
        _transfer(proposal.amount,proposal.receipient);
    }

    function _transfer(uint amount, address payable receipient) private {
        receipient.transfer(amount);
    }

    function proposalList() public view returns(Proposal[] memory){
        Proposal[] memory arr = new Proposal[](nextProposalID - 1); //Empty array of length = nextProposalID - 1
        for(uint i = 0; i < nextProposalID; i++){
            arr[i] = proposals[i];
        }
        return arr;
    }
}