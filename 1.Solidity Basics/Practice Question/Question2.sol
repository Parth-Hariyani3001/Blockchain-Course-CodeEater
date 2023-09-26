// SPDX-License-Identifier: GPL-3.0
pragma solidity >0.8.0;

contract evenOdd{
    function evenodd(uint n) public pure returns(bool){
        bool isEven;
        if(n % 2 == 0){
            isEven = true;
        }   else {
            isEven = false;
        }
        return isEven;
    }
}