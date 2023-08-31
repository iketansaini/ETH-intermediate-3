// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

abstract contract ERC20Interface {
    function totalSupply() public view virtual returns (uint256);
    function balanceOf(address _owner) public view virtual returns (uint256);
    function transfer(address _to, uint256 _value) public virtual returns (bool);
    function burn(uint256 _value) public virtual;
    function mint(address _to, uint256 _value) public virtual;
}

contract CustomToken is ERC20Interface {
    string public name;
    string public symbol;
    uint8 public decimals = 18;

    uint256 private _totalSupply;
    mapping(address => uint256) private _balances;

    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    constructor(string memory _name, string memory _symbol) {
        name = _name;
        symbol = _symbol;
        owner = msg.sender;
    }

    function totalSupply() public view override returns (uint256) {
        return _totalSupply;
    }

    function balanceOf(address _owner) public view override returns (uint256) {
        return _balances[_owner];
    }

    function transfer(address _to, uint256 _value) public virtual override returns (bool) {
        require(_to != address(0), "Invalid address");
        require(_value <= _balances[msg.sender], "Insufficient balance");

        _balances[msg.sender] -= _value;
        _balances[_to] += _value;

        emit Transfer(msg.sender, _to, _value);
        return true;
    }

    function mint(address _to, uint256 _value) public virtual override onlyOwner {
        require(_to != address(0), "Invalid address");
        require(_value > 0, "Invalid amount");

        _totalSupply += _value;
        _balances[_to] += _value;

        emit Transfer(address(0), _to, _value);
    }

    function burn(uint256 _value) public virtual override {
        require(_value > 0, "Invalid amount");
        require(_value <= _balances[msg.sender], "Insufficient balance");

        _totalSupply -= _value;
        _balances[msg.sender] -= _value;

        emit Transfer(msg.sender, address(0), _value);
    }

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
}
