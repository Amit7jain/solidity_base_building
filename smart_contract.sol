//SPDX-License-Identifier: MIT
pragma solidity ^0.7.5;

contract C {
    // state of variable is private
    uint private data;
    // public state variable
    uint public info;

    //constructor
    constructor()  {
        info = 10;
    }

    // private function
    function increment(uint a) private pure returns(uint){
        return a + 1;
    }

    //public function 
    function updateData(uint a) public {
        data = a;
    }
    function getData() public view  virtual returns(uint) { 
        return data;
    }
    function compute(uint a, uint b) internal pure returns(uint){
        return a + b; 
    }

}

//External Contarct

contract D {
    function readData() public returns(uint){
        C c = new C ();
        c.updateData(7);
        return c.getData();
    }
}

// Derived Cotnract
contract E is C {
    uint private result;
    C private c;

    constructor () {
        c = new C();
    }
    function getComputedResult() public  {
        result = compute(3,5);
    }

    function getResult() public view returns(uint) {return result;}
    function getData() public view override  returns(uint) { return c.info();}
}


