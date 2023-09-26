// SPDX-License-Identifier: GPL-3.0
pragma solidity >0.8.0;

contract cube{
    function calcCube(uint x) public pure returns(uint){
       x = x ** 3;
       return x;
    }
}
