// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

contract Demo{
    string public str = "hello world";

    function returnString() public view returns(string memory){
        return str;
    }
}