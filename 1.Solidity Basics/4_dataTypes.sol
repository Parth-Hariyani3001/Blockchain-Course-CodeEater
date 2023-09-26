// SPDX-License-Identifier: GPL-3.0
pragma solidity >0.8.0;

contract dataType{
    //Integer
    int public a = -10;
    uint public b = 90;

    //Boolean
    bool public value1 = true;

    //Bytes
    bytes1 public arr1="a";
    bytes2 public arr2="ab";
    bytes public arr3="a";  //0 Will be added if the space is empty

    function setter(bytes1 val) public{
        arr1 = val;
    }

    function getter() public view returns(bytes2){
        return arr2;
    }

    //Address
    address public addr = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
}