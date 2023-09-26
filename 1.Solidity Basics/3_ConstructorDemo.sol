// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0;

contract ConstructorDemo{
    uint8 public a = 12;
    
    constructor(uint8 value){
        a = value;
    }
}


