// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./1_Book.sol";

contract BookObject {
    Book obj = new Book();

    function getDimension() public view returns (uint, uint) {
        return obj.getDimension();
    }

    function setDimension() public {
        obj.setDimension(1, 2);
    }
}
