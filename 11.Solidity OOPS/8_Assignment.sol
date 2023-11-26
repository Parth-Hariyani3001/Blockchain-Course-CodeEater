// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Assignment {
    address public teacher;

    constructor() {
        teacher = msg.sender;
    }

    struct Student {
        uint roll;
        string name;
        uint[3] marks;
    }

    mapping(uint => Student) public studentDetails;

    uint nextStudentID = 1;

    //To add records
    function addRecord(
        uint _roll,
        string memory _name,
        uint[3] memory _marks
    ) public {
        require(teacher == msg.sender, "You are not a teacher");
        studentDetails[nextStudentID] = Student(_roll, _name, _marks);
        nextStudentID++;
    }

    //To get a particular record
    function getRecord(uint _roll) public view returns (Student memory) {
        require(teacher == msg.sender, "You are not a teacher");
        return studentDetails[_roll];
    }

    //To get all records
    function getAllRecords() public view returns (Student[] memory) {
        require(teacher == msg.sender, "You are not a teacher");
        Student[] memory studDetails = new Student[](nextStudentID - 1);
        for (uint i = 0; i < nextStudentID; i++) {
            studDetails[i] = studentDetails[i];
        }
        return studDetails;
    }

    //To delete a record
    function deleteRecord(uint _roll) public {
        require(teacher == msg.sender, "You are not a teacher");
        studentDetails[_roll].roll = 0;
        studentDetails[_roll].name = "";
        studentDetails[_roll].marks[0] = 0;
        studentDetails[_roll].marks[1] = 0;
        studentDetails[_roll].marks[2] = 0;
    }
}
