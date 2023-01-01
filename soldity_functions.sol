//    SPDX-License-Identifier: MIT
pragma solidity ^0.7.5;
contract function_test{
/*
Function Syntax:
function function-name(parameter-list) scope returns() {
   //statements
}    
*/

// Single value return function
  function getSingleResult() public view returns(uint){
      uint a = 1; // local variable
      uint b = 2;
      uint result = a + b;
      return result;
   }


//In Solidity, a function can return multiple values as well.     
function getResult() public view returns(uint product, uint sum){
      uint a = 1; // local variable
      uint b = 2;
      product = a * b;
      sum = a + b;
  
      //alternative return statement to return 
      //multiple values
      //return(a*b, a+b);
   }

// MODIFIER : This is used to modify the behaviour of a function 
}   

contract Owner {
    address owner ;
    constructor() public {
        owner=msg.sender;
    }
    modifier onlyOwner{
        require(msg.sender == owner);
        _;
    }

    modifier costs (uint price){
        if(msg.value >= price){
            _;
        }
    }

}

contract Register is Owner {
    mapping (address =>bool) registerdAddresses;
    uint price;
    constructor (uint initialPrice) public {
        price = initialPrice;
    }

    function register() public payable costs(price){
        registerdAddresses[msg.sender] = true;

    }
// Only owner can execute this function
    function changePrice(uint _price) public onlyOwner{
        price = _price;
    }




}


