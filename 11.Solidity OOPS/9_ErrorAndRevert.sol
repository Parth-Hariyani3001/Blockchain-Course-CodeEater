// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract Demo {
    error WrongAmount(uint amount, uint value, address caller);

    function balance(uint amount, uint value) public view {
        if (amount < value) {
            revert WrongAmount(amount, value, msg.sender);
        }
    }
}
