// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./Pizza.sol";

contract PizzaV2 is Pizza {
   ///@dev increments the slices when called
   function refillSlice() external {
       slices += 1;
   }

   ///@dev returns the contract version
   function pizzaVersion() external pure returns (uint256) {
       return 2;
   }
}

// 0xedcF2E94A2D88DC30d116bCbEa63FB4187A911A6