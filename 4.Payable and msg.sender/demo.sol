// SPDX-License-Identifier: MIT
pragma solidity >0.8.19;

contract Demo{
     
    function addressCaller() public view returns(address){
        return msg.sender;
    }

    //msg.value
    //payable - contract becomes capable of receiving ether
    function sendEthToContract() public payable {
        //sender to contract
    }

    //send ether from one address to another
    //transfer takes place from 
    //sender -> Contract -> Receiver
    //that is the reason why we keep the function payable
    function sendEthToUser(address payable receiver) public payable{
        receiver.transfer(msg.value);
    }
}

//payable function - makes our contract capable of sending and receiving ether
//Payable variable - makes the address capable fo sending and receiving ether