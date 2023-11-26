// SPDX-License-Identifier: MIT
pragma solidity >=0.4.22 <0.9.0;

contract SimpleStorage {
    uint256 a = 10;

    function set(uint256 _a) public {
        a = _a;
    }

    function get() public view returns (uint256) {
        return a;
    }
}
