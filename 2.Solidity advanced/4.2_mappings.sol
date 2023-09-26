// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

contract Demo{
    //Mapping with fixed array
    mapping(uint => uint[10]) public marks;

    //Insert marks inside of the mapping
    function insert(uint mapIndex,uint arrIndex,uint mark) public{
        marks[mapIndex][arrIndex] = mark;
    }

    //Return the entire array inside of mapping
    function returnMarksArray(uint mapIndex) public view returns(uint[10] memory){
       return marks[mapIndex];
    }

    //Return specific marks from the array
    function returnMarks(uint mapIndex,uint arrIndex) public view returns(uint){
        return marks[mapIndex][arrIndex];
    }
}