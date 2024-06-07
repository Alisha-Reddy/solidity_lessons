// SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract FallbackExample{
    uint256 public result;

    receive() external payable{
        result=1;
    }

    fallback() external payable{
        result =2;
    }
}

// For notes https://docs.soliditylang.org/en/latest/contracts.html#receive-ether-function