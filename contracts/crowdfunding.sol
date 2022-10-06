pragma solidity ^0.4.17;

contract Campaign {
    struct Request { //this is a type definition not an instance of a struct 
        string description;
        uint value;
        address recipient;
        bool complete;
    }
       
    address public manager;
    uint public minimumContribution;
    address[] public approvers;
    Request[] public requests;

    modifier restricted() {
        require(msg.sender == manager);
        _;
    }

    function Campaign(uint minimum) public {
        manager = msg.sender;
        minimumContribution = minimum;
    }

    function contribute() public payable {
        require(msg.value > minimumContribution);
        approvers.push(msg.sender);
    }

    function createRequest(string description, uint value, address recipient) 
        public restricted {
            
            //have to provide values for all the fields declared in the struct definition up top
            Request newRequest = Request({
                description: description,
                value: value,
                recipient: recipient,
                complete: false
            });

            /*
                alternative syntax for instantiating a struct 
                Request(description, value, recipient, false);
            */

            requests.push(newRequest);
    }

}

/*
    Storage/Memory is either referring to
        - where our contract stores data
        - or how our solidity variables store values  

    Storage
        - where data is stored between function calls
        - instance variables stored in storage 
        - pretty much like a computer's hard drive 
            - data is there when you turn off then turn back on your computer 

    Memory
        - temporary place to store data
        - like a computer's RAM
        - data in RAM doesn't persist when restart your computer 
        - arguments to a function are in "memory"
*/