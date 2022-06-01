// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Playground {

    mapping(address => mapping(address => bool)) public userConsent;

    function setConsent(address counterParty) public returns(bool) {
        require(counterParty != address(0), "Counterparty address is invalid");
        require(counterParty != msg.sender, "Counterparty address is invalid");
        userConsent[msg.sender][counterParty] = !userConsent[msg.sender][counterParty];

        return userConsent[msg.sender][counterParty];
    }

    function checkConsent(address counterParty) public view returns(bool) {
        require(counterParty != address(0), "Counterparty address is invalid");
        require(counterParty != msg.sender, "Counterparty address is invalid");
        return userConsent[msg.sender][counterParty] == true ? true : false;
    }
}
