// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

contract demo{
    struct Student{
        string name;
        bool pass;
        uint roll;
    }

    Student public s1;

    function insert(string memory _name,bool _pass,uint _roll) public{
        // s1.name = _name;
        // s1.pass = _pass;
        // s1.roll = _roll;
        s1 = Student(_name,_pass,_roll);
    }

    function studeName() public view returns(string memory){
        return s1.name;
    }

    function structureReturn() public view returns(Student memory){
        return s1;
    }
}