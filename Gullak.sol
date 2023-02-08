//SPDX-License-Identifier: MIT

pragma solidity ^0.8.10;

contract Gullak{

    event Deposit(uint amount);
    event Withdraw(uint amount);

    address public owner;

    modifier onlyOwnwer(){
        require(msg.sender == owner, "Not Owner");
        _;
        
    }
    constructor() {
        owner = payable(msg.sender);
    }


    receive() external payable{
        emit Deposit(msg.value);
    }

    function withdraw() external onlyOwnwer{
      
        emit Withdraw(address(this).balance);
        selfdestruct(payable(msg.sender));
    }

}