//SPDX-License-Identifier:MIT
pragma solidity ^0.8.7;

import "./SimpleStorage.sol";

contract StorageFactory{

    // SimpleStorage public simpleStorage; //simpleStorage is a global variable of thye type SimpleStorage
    // we get a view for simpleStorage and it shows the address of the variable

    SimpleStorage[] public simpleStorageArray;


// Importing contract into another contract

    function createSimpleStorageContract() public{   
    // Function to deploy SimpleStorage contract
    // simpleStorage = new SimpleStorage();
    SimpleStorage simpleStorage = new SimpleStorage();
    simpleStorageArray.push(simpleStorage);
    }



// Interchanging with other contract
    

    function sfStorage( uint256 _simpleStorageIndex, uint256 _simpleStorageNumber) public{
        // SimpleStorage simpleStorage = SimpleStorage( simpleStorageArray [_simpleStorageIndex]);
        // we r not gonna use new and just put the address of the SimpleStorage contract at address inside the brackets
        // Howeever the array is of a type simpleStorage contract, we can write it as
        // SimpleStorage simpleStorage = simpleStorageArray[_simpleStorageIndex];
        // simpleStorage.store(_simpleStorageNumber); //Even tho the code is good, we wont be able to read the stored number. Means we can only store but cant read it
        simpleStorageArray[_simpleStorageIndex].store(_simpleStorageNumber);
    }
    // A fuction to read the stored number
    function sfGet(uint simpleStorageIndex) public view returns(uint256){
        // SimpleStorage simpleStorage = simpleStorageArray[ simpleStorageIndex];
        // return simpleStorage.retrieve();
        return simpleStorageArray[simpleStorageIndex].retrieve();
    }

}