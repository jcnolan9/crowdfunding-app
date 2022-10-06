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
            Request memory newRequest = Request({
                description: description,
                value: value,
                recipient: recipient,
                complete: false
            });
            /*
                have to use 'memory' when creating the Request because the only variables that can use
                'storage' are the instance variables. As in the only variables  in storage are 
                the instance variables declared above. We cannot point 'newRequest' to any of the
                instance variables above, not even 'requests' because none of them are a single
                Request.

                Local variables like those inside a function are also by default 'memory' I think 
            */

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

    How Solidity stores variables 

        Storage
            int[] public numbers;
            numbers.push(20);
            numbers.push(32);

            int storage myArray = numbers;
            //myArray points at the exact storage location/data structure that 'numbers' points at
            //altering myArray will also alter 'numbers'

        Memory
            int[] public numbers;
            numbers.push(20);
            numbers.push(32);

            int memory myArray = numbers;
            //myArray is a copy of numbers but myArray and 'numbers' are two separate objects
            //changing myArray will not change 'numbers'

            When you pass an argument to a function, if that argument is an already existing varaible,
            then you are passing a copy of that variable to the function. In fact, you are always passing 
            a copy. The function uses a copy of the argument you passed  

            function changeArray(int[] memory myArray) private {
                ...
            }

            is the same as 

            function changeArray(int[] myArray) private {
                ...
            }


*/