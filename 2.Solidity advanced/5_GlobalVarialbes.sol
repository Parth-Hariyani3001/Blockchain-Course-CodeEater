// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

contract demo{
    //msg.sender -> global vairalbe - caller address

    address public manager;
    
    constructor(){
        manager = msg.sender;
    }

    function returnFunctionCallerAddress() public view returns(address){
        return msg.sender;
    }
}