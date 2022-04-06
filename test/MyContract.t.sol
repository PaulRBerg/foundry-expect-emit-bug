// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.4;

import { DSTest } from "ds-test/test.sol";
import { MyContract } from "../src/MyContract.sol";

interface CheatCodes {
    function expectEmit(bool, bool, bool, bool) external;
}

contract MyContractTest is DSTest {
    CheatCodes internal cheatcodes = CheatCodes(HEVM_ADDRESS);
    MyContract internal myContract = new MyContract();

    event MyEvent(uint256 indexed myVar, address indexed alice, address indexed bob, uint256 timestamp);

    /// @dev Works, as expected.
    function testEmitMyEvent_v1() external {
        uint256 myVar = myContract.myVar();
        cheatcodes.expectEmit(true, true, true, true);
        emit MyEvent(myVar, address(this), address(this), block.timestamp);
        myContract.emitMyEvent();
    }

    /// @dev Fails, but should work.
    function testEmitMyEvent_v2() external {
        cheatcodes.expectEmit(true, true, true, true);
        emit MyEvent(myContract.myVar(), address(this), address(this), block.timestamp);
        myContract.emitMyEvent();
    }
}
