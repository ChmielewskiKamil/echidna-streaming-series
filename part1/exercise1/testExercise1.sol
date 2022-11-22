pragma solidity ^0.7.0;

import "./token.sol";

contract TestToken is Token {
    /*
     * 1st thing is setup
     * to test if the echidna caller can gain more than 10_000 tokens
     * we need to give it 10_000 to start with
     */
    address echidna_caller = msg.sender;

    constructor() {
        balances[echidna_caller] = 10_000;
    }

    // properties
    function echidna_test_balance() public returns (bool) {
        return balances[echidna_caller] <= 10_000;
    }
}
