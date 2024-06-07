//SPDX-License-Identifier:MIT
pragma solidity ^0.8.7;

contract MappingExampple{

    mapping(string => uint) public nameTofavNumber;

    function addPerson(string memory _name, uint _favNumber) public {
        nameTofavNumber[_name] = _favNumber;
    }

}