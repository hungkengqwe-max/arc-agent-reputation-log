// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;
contract ArcAgentReputationLog {
 address public owner; uint256 public nextId;
 struct Record { address user; uint256 usdcBudget; string agent; string action; bool closed; }
 mapping(uint256=>Record) public records;
 event RecordOpened(uint256 indexed id,address indexed user,uint256 usdcBudget,string agent,string action);
 event RecordClosed(uint256 indexed id,bool success,string evidence);
 modifier onlyOwner(){require(msg.sender==owner,"only owner");_;}
 constructor(){owner=msg.sender;}
 function openRecord(uint256 usdcBudget,string calldata agent,string calldata action) external returns(uint256 id){require(usdcBudget>0,"budget=0");require(bytes(agent).length>1,"agent required");require(bytes(action).length>2,"action required");id=++nextId;records[id]=Record(msg.sender,usdcBudget,agent,action,false);emit RecordOpened(id,msg.sender,usdcBudget,agent,action);}
 function closeRecord(uint256 id,bool success,string calldata evidence) external onlyOwner{Record storage r=records[id];require(r.user!=address(0),"unknown");require(!r.closed,"closed");r.closed=true;emit RecordClosed(id,success,evidence);}
}
