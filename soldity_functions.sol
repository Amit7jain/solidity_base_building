//    SPDX-License-Identifier: MIT
pragma solidity ^0.7.5;
contract function_test{

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
}   