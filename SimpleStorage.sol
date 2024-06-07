//SPDX-License-Identifier: MIT
pragma solidity ^0.8.7; // solidity version and ^ means that any version from 0.8.7 to above is ok
//However if we want to lets say use versions between 0.8.7 and 0.9.0 then can be written as >=0.8.7 <0.9.0

// contract is a key word which tells the next section is a contract

contract SimpleStorage{
    
    // boolean, uint, int, address, bytes
    uint public favNumber; //the variable gets initialized to zero


    // People public person = People({favNumber:1 , name:"Alisha"});
    // People public person2 = People({favNumber:3 , name:"Maneesh"});
    // People public person3 = People({favNumber:5 , name:"Abhi"});


    // bool hasFavouriteNumber = true; //false
    // uint256 favouriteNumber = 5;
    // string favouriteNumberInText = "Five";
    // int256 favouriteInt = -5;
    // address myAddress = 0x4f8790e41f49320617c7C185c39F858f8765eB59;
    // bytes32 favouriteBytes = "cat"; //Represent the cat into some bytes 0xtwfrywutdyu 

    struct People {
        uint favNumber;
        string name;
    }

    // unit256[] public favNumList;
    People[] public people; // our people list is currently empty hence if we give any value, it doesn't give anything back
    // this type of array is dynamic array as it's size isn't given initially

    function store(uint256 _favNumber) public virtual{
        favNumber = _favNumber;
        // retrieve();
    }

    // view, pure
    function retrieve() public view returns(uint256){
        return favNumber;
    }

    mapping(string => uint) public nameTofavNumber;

    function addPerson(string memory _name, uint256 _favNumber) public{
        People memory newPerson = People({favNumber: _favNumber, name: _name}); // can also be wriiten in the same oredr as struct like below
        // People memory newPerson = People(_favNumber, _name);
        people.push(newPerson);

        // or the two lines can also be minimized and be written as 
        // people.push(People(_favNumber, _name));

        nameTofavNumber[_name] = _favNumber;

    }

    // function add() public pure returns(uint256){
    //     return(1+1);
    // }
} 