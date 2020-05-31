pragma solidity ^0.6.8;

contract mappingCountryCapitalExample {

    // Storage
    mapping (string => string) capitals;

    // Add a key value pair to mapping
    function addCapitals (string memory _country, string memory _capital) public {
        // Store the capital and country in the mapping
        capitals[_country] = _capital;
    }

    // Access the mapping using a key
    function getCapitals(string memory _country) public view returns (string memory) {
        return capitals[_country];
    }

    // Delete a key value pair in mapping
    function deleteCapital (string memory _country) public {
        delete(capitals[_country]);
    }
}