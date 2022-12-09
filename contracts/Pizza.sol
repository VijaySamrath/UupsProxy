// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

// Open Zeppelin libraries for controlling upgradability and access.
import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/proxy/utils/UUPSUpgradeable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract Pizza is Initializable, UUPSUpgradeable, OwnableUpgradeable {
   uint256 public slices;

    ///@dev no constructor in upgradable contracts. Instead we have initializers
    ///@param _sliceCount initial number of slices for the pizza
   function initialize(uint256 _sliceCount) public initializer {
       slices = _sliceCount;
        ///@dev as there is no constructor, we need to initialise the OwnableUpgradeable explicitly
       __Ownable_init();
   }

   ///@dev required by the OZ UUPS module
   function _authorizeUpgrade(address) internal override onlyOwner {}

   ///@dev decrements the slices when called
   function eatSlice() external {
       require(slices > 1, "no slices left");
       slices -= 1;
   }
}

// proxy contract address = 0x92e00B9A4a441C97817384CBE05951B10515Ea9a  = goerli
// contract address = 0xB9Bd0380c036914C6De5B9Dd9b8811de50538985 = goerli