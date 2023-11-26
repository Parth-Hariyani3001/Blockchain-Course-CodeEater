// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface Book {
    function add(uint _a, uint _b) external;

    function sub(uint _a, uint _b) external;

    function div(uint _a, uint _b) external;
}

contract Page is Book {
    uint addVal;
    uint subVal;
    uint mulVal;

    function add(uint _a, uint _b) public override {
        addVal = _a + _b;
    }

    function sub(uint _a, uint _b) external override {
        subVal = _a - _b;
    }

    function div(uint _a, uint _b) external override {
        mulVal = _a * _b;
    }
}
