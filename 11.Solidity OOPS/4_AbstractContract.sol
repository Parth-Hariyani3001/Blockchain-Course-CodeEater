// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

abstract contract Book {
    uint length;
    uint breadth;

    //Unimplemented function
    function setDimension(uint _l, uint _b) public virtual;

    //Implemented function
    function getDimension() public view returns (uint, uint) {
        return (length, breadth);
    }
}

contract Bookv2 is Book {
    function setDimension(uint _l, uint _b) public override {
        length = _l;
        breadth = _b;
    }
}
