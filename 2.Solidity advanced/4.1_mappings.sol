// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

contract mappingDemo{

    struct Student{
        string name;
    }


    //studData3[0].push([12,432,23,43,54]);

    //Mapping with a dynamic array
    mapping(uint => uint[]) public studData3;
    function insert3(uint index,uint num) public {
        studData3[index].push(num);
    }
    function returnMap2(uint index,uint index2) public view returns(uint){
        return studData3[index][index2];
    }

    //Mapping with a struct
    mapping(uint => Student) public studData2;
    function insert2(uint index, string memory Name) public {
        studData2[index].name = Name;
    }
    function returnMap(uint index) public view returns(string memory){
        return studData2[index].name;
    }

    //Normal Mapping 
    mapping(uint => string) public studData;
    function insert(uint index, string memory Name) public {
        studData[index] = Name;
    }

    function returnMapping(uint index) public view returns(string memory){
        return studData[index];
    }
}