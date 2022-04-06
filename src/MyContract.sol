// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.4;

contract MyContract {
    event MyEvent(uint256 indexed myVar, address indexed alice, address indexed bob, uint256 timestamp);

    uint256 public myVar;

    constructor() {
        myVar = 1337;
    }

    function emitMyEvent() external {
        emit MyEvent(myVar, msg.sender, msg.sender, block.timestamp);
    }
}
