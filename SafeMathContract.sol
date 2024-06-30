// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

contract SafeMathContract {
    uint256 public counter;

    function incrementCounter(uint256 amount, uint256 divisor) public {
        require(amount > 0, "Amount must be greater than zero.");

        uint256 quotient = safeDivide(amount, divisor);
        
        uint256 oldCounter = counter;
        uint256 newCounter = counter + quotient;

     
        assert(newCounter >= oldCounter); 

        counter = newCounter;
    }

    function safeDivide(uint256 numerator, uint256 denominator) internal pure returns (uint256) {
      
        if (denominator == 0) {
            revert("Denominator cannot be zero.");
        }

      
        if (numerator % denominator != 0) {
            revert("Numerator must be divisible by denominator.");
        }

        return numerator / denominator;
    }
}
