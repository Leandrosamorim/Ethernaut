pragma solidity ^0.6.0;

contract Force {
    
    function sendEth(address payable _addr)public{
        _addr.transfer(1 ether);
    }
    
    function destruct(address payable _addr) public{
        selfdestruct(_addr);
    }
    
    fallback() external payable { }
}
