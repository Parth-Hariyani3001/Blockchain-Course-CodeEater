// SPDX-License-Identifier: GPL-3.0
pragma solidity >0.8.0;

contract Conditionals{
    function isZero(uint a) public pure returns(uint){
        if(a == 0){
            return 0;
        }   else if(a > 0){
            return 1;
        }   else {
            return 2;
        }
    }
}
