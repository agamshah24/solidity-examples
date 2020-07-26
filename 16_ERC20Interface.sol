pragma solidity ^0.6.8;

abstract contract ERC20Interface {

    string public constant name = "Agam Token";
    string public constant symbol = "AST";
    uint8 public constant decimal = 18; // 18 is the most common number of the decimal places.

    event Transfer(address indexed from, address indexed to, uint tokens);
    event Approval(address indexed tokenOwner, address indexed spender, uint tokens);

    function totalSupploy() public virtual view returns (uint);
    function balanceOf(address tokenOwner) public virtual view returns (uint balance);
    function transfer(address to, uint tokens) public virtual view returns (bool success);
    function transferFrom(address from, address to, uint tokens) public virtual view returns (bool success);
    function approve(address spender, uint tokens) public virtual view returns (bool success);
    function allowance(address tokenOwner, address spender) public virtual view returns (uint remaining);

}