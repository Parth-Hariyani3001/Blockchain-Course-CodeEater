// SPDX-License-Identifier: GPL-3.0
pragma solidity >0.8.0;

contract requireDemo{
    uint public sum;
    uint public check = 1;

    function isZero(uint a) public{
        check = 2;
        require(a==0,"a is not equal to zero");     //It like  an if-else statement 
        //It throws error if the condition is not fulfilled
        //It reverts back everything if the require is not fulfilled
        sum = 1;
        
    }


    function ifZeroTwo(uint a) public returns(string memory){
    check = 19; 
    if(a==0){
        sum = 1;
        return "asdasdas";
    } else {
        //return "a is not equal to zero"; //This returns strings
        revert("a is not equal to zero"); //This returns error
    }
    }
    

    
}