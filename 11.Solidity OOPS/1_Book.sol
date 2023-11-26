// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Book {
    uint length;
    uint breadth;

    // uint a;

    // constructor(uint _a) {
    //     a = _a;
    // }

    function setDimension(uint _l, uint _b) public {
        length = _l;
        breadth = _b;
    }

    function getDimension() public view returns (uint, uint) {
        return (length, breadth);
    }
}
