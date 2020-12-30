pragma solidity ^0.5.0;

import "openzeppelin-solidity/contracts/math/SafeMath.sol";

contract Token {
    using SafeMath for uint256;

    //vars
    string public name = "Yog";
    string public symbol = "YOG";
    uint256 public decimals = 18;
    uint256 public totalSupply;
    // Track balanes (stores information)
    mapping(address => uint256) public balanceOf;

    // State vars listed above

    //events

    //indexing allow us to isoate information
    event Transfer(address indexed from, address indexed to, uint256 value);

    constructor() public {
        totalSupply = 1000000 * (10**decimals);
        balanceOf[msg.sender] = totalSupply;
    }

    function transfer(address _to, uint256 _value)
        public
        returns (bool success)
    {
        //check to make sure not sending to a false account
        require(_to != address(0));
        //require is a true or false
        require(balanceOf[msg.sender] >= _value);

        balanceOf[msg.sender] = balanceOf[msg.sender].sub(_value);
        balanceOf[_to] = balanceOf[_to].add(_value);
        emit Transfer(msg.sender, _to, _value);
        return true;
    }
}

// Send tokens (behave func)
