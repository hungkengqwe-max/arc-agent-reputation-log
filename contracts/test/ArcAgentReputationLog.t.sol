// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
import "../src/ArcAgentReputationLog.sol";
contract ArcAgentReputationLogTest { function testOpenRecord() public { ArcAgentReputationLog app = new ArcAgentReputationLog(); uint256 id = app.openRecord(1000000,"arc-agent","settle x402 payment"); require(id==1,"bad id"); } }
