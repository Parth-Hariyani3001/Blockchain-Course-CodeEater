// SPDX-License-Identifier: GPL-3.0
pragma solidity > 0.8.0;

contract Visibility{
    //f1(),f2(),f3()
    function f1() public pure returns(uint){
        return 1;
    }
    function f2() private pure returns(uint){
        return 2;
    }
    function f3() internal pure returns(uint){
        return 3;
    }
    function f4() external pure returns(uint){
        return 4;
    }
}

//Derived Contract
contract child is Visibility{       //Child Contract derived from Visibility contract   
    //f1(),f3(),f4()
}

contract otherContracts{
    //Created an object of Visibility contract
    //f1(),f4()
    Visibility obj = new Visibility();
    uint public y = obj.f4();
}