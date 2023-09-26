// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

contract swap{
    function Swap(uint x,uint y) public pure returns(uint,uint){
        x = x + y;
        y = x - y;
        x = x - y;
        return (x,y);
    }
}