// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

contract Consent {
    struct User {
        mapping(address => bool) _consent;
    }
    mapping(address => User) users;

    //mapping(address => mapping(address => bool)) public userConsent;

    function initConsent(address counterParty) public returns (bool) {
        require(counterParty != address(0), "Counterparty address is invalid");
        require(counterParty != msg.sender, "Counterparty address is invalid");
        users[msg.sender]._consent[counterParty] = true;
        return true;
    }

    function revokeConsent(address counterParty) public returns (bool) {
        require(counterParty != address(0), "Counterparty address is invalid");
        require(counterParty != msg.sender, "Counterparty address is invalid");
        require(users[msg.sender]._consent[counterParty] == true, "No consent to revoke");
        users[msg.sender]._consent[counterParty] = false;
        return false;
    }

    function checkConsent(address counterParty) public view returns (bool) {
        require(counterParty != address(0), "Counterparty address is invalid");
        require(counterParty != msg.sender, "Counterparty address is invalid");
        return users[msg.sender]._consent[counterParty] == true ? true : false;
    }
}
