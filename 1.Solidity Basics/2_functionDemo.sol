// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract functionDemo{
    uint public x;  //State Variable
    //When you add public to state variable, a getter(view) function is automatically
    //created with the same name of the variable name 

    //Function of pure type
    function setterLocal(uint num) public pure{
        uint a; //Local Variable
        a = num;
    }

    //Function of no type specified
    function setterState(uint num) public{
        x = num;
    }

    //Function with view keyword
    function getterState() public view returns(uint){
        return x;
    }

    //Pure -> neither reading or writing the state Variable
    //View -> Reading form the state variable
    //     -> Writing the state variable


    uint public sum;
    function calcSum() public returns(uint){
        sum = sum + 90;
        return sum;
    }
    function calcMul(uint n1,uint n2) public pure returns(uint){
        return n1*n2;
    }
}