pragma solidity ^0.6.8;

contract mappingRelationExample {

    // Creates in Storage
    mapping (string => string) relations;

    // Add a relation
    function addRelation(string memory _name, string memory _relation) public {
        // store the relation
        relations[_name] = _relation;
    }

    // Returns a Relation
    function getRelation(string memory _name) public view returns (string memory) {
        return relations[_name];
    }

    // Remove the key value pair from the mapping
    function removeRelation(string memory _name) public {
        delete(relations[_name]);
    }
}