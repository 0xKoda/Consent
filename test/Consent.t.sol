// SPDX-License-Identifier: MIT
pragma solidity 0.8.13;

import {DSTestPlus} from "solmate/test/utils/DSTestPlus.sol";

import {Consent} from "../src/Consent.sol";

contract ConsentTest is DSTestPlus {
    Consent consent;
    address _counterParty = address(1);

    function setUp() public {
        consent = new Consent();
    }

    function testConsent() public {
        consent.initConsent(_counterParty);
        assert(consent.checkConsent(_counterParty) == true);
    }
}
