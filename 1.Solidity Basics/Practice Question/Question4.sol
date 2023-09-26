// SPDX-License-Identifier: GPL-3.0
pragma solidity >0.8.0;

contract swap{
    // uint public a = 10;
    // uint public b = 20;
    function Swap(uint a,uint b) public pure returns(uint,uint){
        uint temp = 0;
        temp = a;
        a = b;
        b = temp;
        return (a,b);
    }
}