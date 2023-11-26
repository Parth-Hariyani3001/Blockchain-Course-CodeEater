// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Addition {
    function add(uint _a, uint _b) public pure returns (uint) {
        return _a + _b;
    }

    function add(uint _a, uint _b, uint _c) public pure returns (uint) {
        return _a + _b + _c;
    }

    //polymorphism - functions with same name but different signatures
}
