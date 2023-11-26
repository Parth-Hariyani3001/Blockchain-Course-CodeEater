// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract payableContract {
    function sendETHToContract() public payable {}

    function sendETHTOAccount(address payable receiver) public payable {
        receiver.transfer(msg.value);
    }
    //Call -> send Ether to Contract -> 2 eth -> 2 eth transfer contract balance
}
