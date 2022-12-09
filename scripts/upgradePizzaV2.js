const { ethers, upgrades } = require("hardhat");

const PROXY = "0x92e00B9A4a441C97817384CBE05951B10515Ea9a"

async function main() {
 const PizzaV2 = await ethers.getContractFactory("PizzaV2");
 console.log("Upgrading Pizza slices ...");
 await upgrades.upgradeProxy(PROXY, PizzaV2);
 console.log("Pizza slices upgraded successfully");
}

main();