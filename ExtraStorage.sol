//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

import "./SimpleStorage.sol";

contract ExtraStorage is SimpleStorage{
    // This means that the ExtraStorage is the exact of SimplStorage and inherit all the functionality of the SimpleStorage contact


    function store(uint256 _favNumber) public override {
        favNumber = _favNumber +5;
    }
}