//SPDX-License-Identifier: MIT
pragma solidity >=0.5.0<0.9.0;

contract Demo{
    mapping(address => mapping(address => bool)) public names;

    function insert(address index,address index2,bool num) public{
        names[index][index2] = num;
    }

    function ReturnMapping(address index,address index2) public view returns(bool){
        return names[index][index2];
    }
}