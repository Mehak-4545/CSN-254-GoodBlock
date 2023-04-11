// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0 <0.9.0;

contract Individual{
    struct individual{
        string name;
        string email;
        string password;
        string contact;
        string Address;
        
    }

    uint max_users= 50;

    event individual_created(individual, uint id);
    event if_loggedin(bool successful_login);


    individual[] public Individuals;

    mapping(address => individual) ind_Users;//map to store individual corresponding to user address
    mapping(address => string) Password;//map to store password string corresponding to user address
    mapping(uint => address) User_Ids;//map to reference addresses using userid

    function _createInd(string calldata _name, string calldata _email,string calldata _password,string calldata _contact,string calldata _Address) internal {
        individual memory new_Individual = individual( _name,  _email, _password, _contact, _Address);
        Individuals.push(new_Individual);
        ind_Users[msg.sender]=new_Individual;
        Password[msg.sender]=_password;
        uint id = uint(keccak256(abi.encodePacked(_name)))%max_users;
        User_Ids[id]=msg.sender;
        emit individual_created(new_Individual,id);

    }

    function _signup (string calldata _name, string calldata _email,string calldata _password,string calldata _contact,string calldata _Address) public{
        _createInd(_name,  _email, _password, _contact , _Address);
        //confirm not implemented
    }

    function _login (uint _userid, string calldata _password) public{
        bool is_verified= false;
        if(keccak256(abi.encodePacked(Password[User_Ids[_userid]]))==keccak256(abi.encodePacked(_password))){
            is_verified = true;
        }
        emit if_loggedin(is_verified);

    }

    function transfer(address payable recipient, uint256 amount) public payable {
        require(amount <= msg.value, "Insufficient balance");
        recipient.transfer(amount);
    }



}
