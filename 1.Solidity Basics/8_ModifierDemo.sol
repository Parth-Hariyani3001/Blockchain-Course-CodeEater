// SPDX-License-Identifier: GPL-3.0
pragma solidity >0.8.0;

contract ModifierDemo{
    uint public sum;

    //modifier without param
    modifier notZero(){
        require(true==false,"a is not equal to zero");
        _;
    }

    function isZero1() public notZero(){
        sum = 1;
    }

    //Modifiers with Params
    modifier notOne(uint value){
        require(value == 0,"a not equal to zero");
        _;
    }

     function isZero2(uint a) public notOne(a){
        sum = 1;
    }


}