// Goals: -Get funds from users
//        -Withdraw funds
//        -Set a minimum funding value in USD

// SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

import "./PriceConverter.sol";

error NotOwner();

contract FundMe{

    uint256 public constant MINIMUM_USD = 50 * 1e18;

    using PriceConverter for uint256;

    address [] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    address public immutable i_owner;
    constructor(){
        i_owner = msg.sender;
    }

    function fund() public payable{
        // We want to set a minimum fund amount in USD
        // payable sets the function as payable and marks it in red color 
        // require(msg.value > 1e18, "Didn't send enough!"); //This is for the person who require msg value more than 1e18
        // 1e18 == 1 * 10 ** 18 == 10 to the power 18 = 1000000000000000000 wei = 1 Eth
        // The second part in the above line is revert
        
        require(msg.value.getConversionRate() > MINIMUM_USD, "Didn't send enough!");
        funders.push(msg.sender); // msg.sender is the address of the sender that's calling the contract
        addressToAmountFunded[msg.sender] += msg.value;
    }

    function withdraw() public onlyOwner{
        for(uint256 funderIndex=0; funderIndex<funders.length; funderIndex++ ){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        // We need to rest the array
        funders = new address[](0);

        // And also withdraw the amount

        // transfer
        payable(msg.sender).transfer(address(this).balance); //msg.sender is address type which makes payable(msg.sender) makes it a payable address

        // send
        bool sendSuccess = payable(msg.sender).send(address(this).balance);
        require(sendSuccess, "Send Failed");
        // call

        
    }

    modifier onlyOwner{
        // require(msg.sender == i_owner,"Sender is not owner");
        if(msg.sender != i_owner) {revert NotOwner(); } 
        _;
    }

    receive() external payable {
        fund();
    }

    fallback() external payable {
        fund();
    }

}