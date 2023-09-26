// SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

contract StructDemo{
    struct Student{
        string name;
        uint roll;
        bool pass;
    }
    //Array of struct
    Student[4] public s1;

    function insert(uint index,string memory _name,uint _roll,bool _pass) public {
        // s1[index].name = _name;
        // s1[index].roll = _roll;
        // s1[index].pass = _pass;
        s1[index] = Student(_name,_roll,_pass);
        //For dynamic array
        // s1.push(Student(_name,_roll,_pass));
    }
   
    //To get the name from any struct
    function name(uint index) public view returns(string memory){
        return s1[index].name;
    }

    //To get a specific struct from the array
    function specificStruct(uint index) public view returns(Student memory){
        return s1[index];
    }

    //To get all of the struct from the array 
    function returnStruct() public view returns(Student[4] memory){
        return s1;
    }

}