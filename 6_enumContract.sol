pragma solidity ^0.6.8;

contract EnumExample {

    // create an Enumeration
    enum names {Agam, Rushabh, Hitesh, Nishith}

    function getNames(uint8 _index) public pure returns (string memory) {
        if (_index == uint8(names.Agam)) return "Agam";
        if (_index == uint8(names.Rushabh)) return "Rushabh";
        if (_index == uint8(names.Hitesh)) return "Hitesh";
        if (_index == uint8(names.Nishith)) return "Nishith";
    }

}