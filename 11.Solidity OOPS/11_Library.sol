// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

library Addition {
    function addition(uint a, uint b) public pure returns (uint) {
        return a + b;
    }
}

contract Calculator {
    function add(uint a, uint b) public pure returns (uint) {
        return Addition.addition(a, b);
    }
}
