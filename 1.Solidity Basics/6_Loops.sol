// SPDX-License-Identifier: GPL-3.0
pragma solidity >0.8.0;

contract Loops{
    function loops() public pure returns(uint){
        uint count;
        uint sum;

        //While Loop
        while(count < 5){
            sum = sum + 1;
            count++;
        }

        //Do while loop
        do{
            sum = sum + 1;
            count++;
        } while(count < 10);

        //For loop
        for(uint i = 0; i < 10;i++){
            sum = sum + 1;
        }

        return sum;
    }
}