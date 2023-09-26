// SPDX-License-Identifier: GPL-3.0
pragma solidity >0.8.0;

contract avg{
    function calcAverage(uint a,uint b,uint c) public pure returns(uint){
        return (a+b+c)/3;
        //Will not return a floating point number
    }
}