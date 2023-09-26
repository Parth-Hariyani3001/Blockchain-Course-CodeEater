//SPDX-License-Identifier: MIT
pragma solidity >0.8.0;

contract Demo{
    //Fixed Array 

    uint[5] public arr = [10,20,30,40]; //last element by default zero
    //Stored in storage area

    function mulby2(uint[5] memory brr) pure public returns(uint[5] memory){
        for(uint i = 0; i < brr.length; i++){
            brr[i] = 2 * i;
        }
        return brr;
    } //brr -> Volatile memory - RAM
    
    //calldata - data becomes immutable and can only be passed inside of function argument
    function mulby(uint[5] calldata brr) pure public returns(uint[5] memory){
        // for(uint i = 0; i < brr.length; i++){
        //     brr[i] = 2 * i;
        // }
        //Wil give error as brr becomes immutable so it cannot be changed
        return brr;
    }
    //If you are returning any reference data type variable then use memory keyword in tthe returns() statement
    function returnArr() public view returns(uint[5] memory){
        return arr;
    }

    function storageArray() public{
        uint[5] storage sarray; //Storage keyword pointer
        sarray=arr; //sarray points to arr
        sarray[0] = 90;
    }

    function memoryArray() public view{
        uint[5] memory marray;
        marray = arr;   //marray is a new array
        marray[0] = 90;
    }

    //Dynamic Array
    uint[] public arr2; //State variable - storage area

    function insert(uint element) public {
        arr2.push(element);  
    }
    
    function lastElement() public {
        arr2.pop();  
    }
}