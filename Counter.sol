// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Example {

    // This is the owner of the contract
    address owner;

    // This is our counter struct. It will hold necessary information about the counter: number and description
    struct Counter {
        uint number;
        string description;
    }

    // Create an instance of our Counter. It is empty for now, but we will initialize it in the constructor.
    Counter counter;

    // This modifier ensures that the caller of the function is the owner of the contract.
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can increment or decrement the counter");
        _;
    }

    // Constructor function. It only runs once when we deploy the contract.
    // It takes two parameters: initial_value and description.
    constructor(uint initial_value, string memory description) {
        owner = msg.sender;
        counter = Counter(initial_value, description);
    }

    // This function gets the number field from the counter struct and increases it by one.
    function increment_counter() external onlyOwner {
        counter.number += 1;
    }

    // This function decreases the number by one.
    function decrement_counter() external onlyOwner {
        counter.number -= 1;
    }

    // Query function to retrieve the number from the counter.
    function get_counter_value() external view returns(uint) {
        return counter.number;
    }

    // New query function to return the description from the counter struct.
    function get_counter_description() external view returns(string memory) {
        return counter.description;
    }
}
