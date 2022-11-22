// SPDX-License-Identifier: SEE LICENSE IN LICENSE
pragma solidity ^0.7.0;

import "token.sol";

contract TestToken is Token {
    constructor() public {
        paused(); // pause the contract
        owner = address(0x0); // lose ownership
    }

    // add the property
    function echidna_cannot_be_unpaused() public view returns (bool) {
        return is_paused == true;
    }
}

// property testing
// function echidna_test_pausable() public returns (bool) {
//     return is_paused;
//     // if return:
//     // true -> property is valid
//     // false -> property is not valid
// }

// // assertion testing
// function testPausable(uint256 amountToFuzz) public {
//     assert(is_paused);
// }
