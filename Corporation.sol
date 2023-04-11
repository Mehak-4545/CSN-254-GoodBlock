// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0 <0.9.0;

contract Corporation{
    struct corporation{
        string name;
        string email;
        string password;
        string contact;
        string Address;
        
    }

    uint max_users= 50;

    event corporation_created(corporation, uint id);
    event if_loggedin(bool successful_login);


    corporation[] public Corporations;

    mapping(address => corporation) corp_Users;//map to store corporation corresponding to user address
    mapping(address => string) Password;//map to store password string corresponding to user address
    mapping(uint => address) User_Ids;//map to reference addresses using userid

    function _createCorp(string calldata _name, string calldata _email,string calldata _password,string calldata _contact,string calldata _Address) internal {
        corporation memory new_Corporation = corporation( _name,  _email, _password, _contact, _Address);
        Corporations.push(new_Corporation);
        corp_Users[msg.sender]=new_Corporation;
        Password[msg.sender]=_password;
        uint id = uint(keccak256(abi.encodePacked(_name)))%max_users;
        User_Ids[id]=msg.sender;
        emit corporation_created(new_Corporation,id);

    }

    function _signup (string calldata _name, string calldata _email,string calldata _password,string calldata _contact,string calldata _Address) public{
        _createCorp(_name,  _email, _password, _contact , _Address);
        //confirm not implemented
    }

    function _login (uint _userid, string calldata _password) public{
        bool is_verified= false;
        if(keccak256(abi.encodePacked(Password[User_Ids[_userid]]))==keccak256(abi.encodePacked(_password))){
            is_verified = true;
        }
        emit if_loggedin(is_verified);

    }



}
