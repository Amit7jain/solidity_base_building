//SPDX-License-Identifier: MIT
pragma solidity ^0.7.5;
/*
Function Overloading Example : You can have multiple definitions for the same function name in the same scope.
*/
contract test_function2{
// Function Overloading

    function getSum(uint a, uint b) public pure returns(uint){
        return a+b;
    }

    function getSum(uint a, uint b, uint c) public pure returns(uint){
        return a + b + c;
    }

    function callSumWithTwoParams() public pure returns(uint){
        return getSum(1,2);
    }

    function callSumWithThreeParams() public pure returns(uint){
        return getSum(1,2,3);
    }

}
// FALLBACK function example :    
/*
A contract can have at most one fallback function, declared using either fallback () external [payable] or
fallback (bytes calldata input) external [payable] returns (bytes memory output) (both without the function keyword). This function must have external visibility. A fallback function can be virtual, can
override and can have modifiers.
The fallback function is executed on a call to the contract if none of the other functions match the given function
signature, or if no data was supplied at all and there is no receive Ether function. The fallback function always receives
data, but in order to also receive Ether it must be marked payable.
*/ 

contract Test {
   uint public x ;
   fallback () external { x = 1; }    
}
contract Sink {
   fallback () external payable { }
}
contract Caller {
    function callTest(Test test) public returns (bool) {
      (bool success,) = address(test).call(abi.encodeWithSignature("nonExistingFunction()"));
      require(success);
      // test.x is now 1

      address payable testPayable = address(uint160(address(test)));

      // Sending ether to Test contract,
      // the transfer will fail, i.e. this returns false here.
      return (testPayable.send(2 ether));
   }

}   
