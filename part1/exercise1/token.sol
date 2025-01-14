pragma solidity ^0.7.0;

contract Ownership {
    address owner = msg.sender;

    function Owner() public {
        owner = msg.sender;
    }

    modifier isOwner() {
        require(owner == msg.sender);
        _;
    }
}

contract Pausable is Ownership {
    bool is_paused;

    modifier ifNotPaused() {
        require(!is_paused);
        _;
    }

    function paused() public isOwner {
        is_paused = true;
    }

    function resume() public isOwner {
        is_paused = false;
    }
}

contract Token is Pausable {
    mapping(address => uint) public balances;

    function transfer(address to, uint value) public ifNotPaused {
        uint256 balanceBeforeSender = balances[msg.sender];
        uint256 balanceBeforeReceiver = balances[to];
        balances[msg.sender] -= value;
        balances[to] += value;

        require(balances[msg.sender] <= balanceBeforeSender, "Underflow!");
        require(balances[to] >= balanceBeforeReceiver, "Overflow!");
    }
}
