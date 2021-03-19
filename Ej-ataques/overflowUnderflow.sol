pragma solidity ^0.4.18;

/**
 * contrato para mostrar el overflow y el underflow
 */

contract OverflowUnderflow {
    uint public cero = 0;
    uint public max = 2**256-1;
    
    function underflow() public {
        cero -= 1;
    }
    
    function overflow() public {
        max += 1;
    }
}