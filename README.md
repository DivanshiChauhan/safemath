
# SafeMathContract

## Overview
SafeMathContract is a Solidity contract that provides safe mathematical operations, specifically focusing on safe division and counter incrementation with overflow protection.

## Prerequisites

- Solidity ^0.8.24
- Remix IDE (https://remix.ethereum.org/)

## Contract Details

### Functions

#### incrementCounter
```solidity
function incrementCounter(uint256 amount, uint256 divisor) public {
    require(amount > 0, "Amount must be greater than zero.");

    uint256 quotient = safeDivide(amount, divisor);
    
    uint256 oldCounter = counter;
    uint256 newCounter = counter + quotient;

    assert(newCounter >= oldCounter); 

    counter = newCounter;
}
```
- **Description**: Increments the `counter` by dividing `amount` by `divisor` and adding the quotient to `counter`.
- **Safety Measures**: Uses `safeDivide` to ensure safe division and `assert` to prevent overflow.

#### safeDivide
```solidity
function safeDivide(uint256 numerator, uint256 denominator) internal pure returns (uint256) {
    if (denominator == 0) {
        revert("Denominator cannot be zero.");
    }

    if (numerator % denominator != 0) {
        revert("Numerator must be divisible by denominator.");
    }

    return numerator / denominator;
}
```
- **Description**: Safely divides `numerator` by `denominator` and ensures the result is an integer.

## Usage

1. **Deploy Contract**:
   - Use Remix IDE to deploy the SafeMathContract.
   - Create a new file in Remix and paste the contract code.

2. **Compile Contract**:
   - In Remix, select the Solidity compiler version 0.8.24.
   - Click the "Compile" button to compile the contract.

3. **Deploy Contract**:
   - Go to the "Deploy & Run Transactions" tab in Remix.
   - Select the "JavaScript VM" environment for a local blockchain.
   - Deploy the contract by selecting the `SafeMathContract` contract and clicking "Deploy."

4. **Interact with Contract**:
   - After deployment, use the Remix interface to call the `incrementCounter` function with appropriate parameters.

## Authors
Divanshi  
[DivanshiChauhan](https://github.com/DivanshiChauhan)

## License
This project is licensed under the MIT License - see the LICENSE.md file for details.
