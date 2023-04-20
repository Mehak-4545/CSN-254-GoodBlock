// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.0 <0.9.0;

contract Ngo{

    struct campaign{
        string name_campaign;
        string motto;
        uint amountTotal;
        uint amountCollected;
        string ngoName;
        string email;
        string contact;
        string Address;
    }

    struct ngo{
        string name;
        string email;
        string password;
        string contact;
        string Address;
    }
    
    uint max_users= 50;

    event _signup_event(ngo, string name);
    event _login_event(bool successful_login, string name, string contact, string email, string Address, string remarks);
    event _addCampaign_event(campaign, bool status);
    event _confirmNgo_event(string name);
    event getAllCampaigns_event(campaign[] campaigns);
    event logout_event(bool success);

    // ngo[] public Ngos;
    campaign[] public Campaigns;

    mapping(string=>ngo) Ngos;
    mapping(address => ngo) ngo_Users;//map to store ngo corresponding to user address
    mapping(address => string) Password;//map to store password string corresponding to user address
    mapping(string => address) User_Ids;//map to reference addresses using userid
    mapping(string => campaign) User_camp;//map to reference addresses using userid
    // mapping(string => bool) ngoConfirmed;//key - name of ngo, value - depending on if ngo is confirmed or not
    mapping(string => bool) userLoggedIn;

    // function _confirmNgo(string calldata name) public {
    //     // ngoConfirmed[name] = true;
    //     emit _confirmNgo_event(name);
    //     ngoConfirmed[name] = true;
    // }

    // function _createNgo(string calldata _name, string calldata _email,string calldata _password,string calldata _contact,string calldata _Address) internal {
    //     ngo memory new_Ngo = ngo(_name,  _email, _password, _contact, _Address);
    //     Ngos.push(new_Ngo);
    //     ngoConfirmed[_name] = false;
    //     ngo_Users[msg.sender]=new_Ngo;
    //     Password[msg.sender]=_password;
    //     User_Ids[_name]=msg.sender;
    //     emit _createNgo_event(new_Ngo,_name);
    // }

    function _signup (string calldata _name, string calldata _email, string calldata _password, string calldata _contact, string calldata _Address) public returns (ngo memory) {
        ngo memory new_Ngo = ngo(_name,  _email, _password, _contact, _Address);
        // Ngos[_name]=new_Ngo;
        // ngoConfirmed[_name] = false;
        // ngo_Users[msg.sender]=new_Ngo;
        // Password[msg.sender]="_password";
        // User_Ids[_name]=msg.sender;
        emit _signup_event(new_Ngo,_name);
        Ngos[_name]=new_Ngo;
        // ngoConfirmed[_name] = false;
        ngo_Users[msg.sender]=new_Ngo;
        Password[msg.sender]=_password;
        User_Ids[_name]=msg.sender;
        return new_Ngo;
    }

    function getAllCampaigns () public {
        emit getAllCampaigns_event(Campaigns);
    }

    function _login (string calldata _name, string calldata _password) public{//no change for now
        if(keccak256(abi.encodePacked(Password[User_Ids[_name]]))==keccak256(abi.encodePacked(_password))){
            // if (ngoConfirmed[_name] == true){
            ngo memory myNgo = ngo_Users[User_Ids[_name]];
            // userLoggedIn[_name] = true;
            emit _login_event(true, myNgo.name, myNgo.contact, myNgo.email, myNgo.Address, "successful login");
            userLoggedIn[_name] = true;
            // }
            // else {
            //     emit _login_event(true, "", "", "", "", "Ngo not confirmed");
            // }
        }
        else {
            emit _login_event(false, "", "", "", "", "Wrong credentials");
        }
    }

    function logout (string calldata _ngoName) public {
        if (userLoggedIn[_ngoName] == true){
            userLoggedIn[_ngoName] = false;
            emit logout_event(true);
        }
        else {
            emit logout_event(false);
        }
    }

    
    function _addCampaign(string calldata _name, string calldata _motto , uint  _amount) public {
        campaign memory new_camp = campaign(_name, _motto, _amount, 0, ngo_Users[msg.sender].name, ngo_Users[msg.sender].email, ngo_Users[msg.sender].contact, ngo_Users[msg.sender].Address);
        if (userLoggedIn[ngo_Users[msg.sender].name]){
            // Campaigns.push(new_camp);
            // User_camp[ngo_Users[msg.sender].name]=new_camp;
            emit _addCampaign_event(new_camp, true);
            Campaigns.push(new_camp);
            User_camp[ngo_Users[msg.sender].name]=new_camp;
        }
        else {
            emit _addCampaign_event(new_camp, false);
        }
    }

    function _withdrawCampaign() public {
        if (userLoggedIn[ngo_Users[msg.sender].name]){
            delete User_camp[ngo_Users[msg.sender].name];
        }
    }

    receive() external payable{}

    fallback() external payable{}

    function transfer(string calldata ngoName, uint amount) public payable {
        address payable ngoAddress = payable(User_Ids[ngoName]);
        require(amount <= msg.value, "Insufficient balance");
        ngoAddress.transfer(amount);
        User_camp[ngoName].amountCollected += uint(msg.value);
    }
}

contract Individual{
    struct individual{
        string name;
        string email;
        string password;
        string contact;
        string Address;    
    }

    uint max_users= 50;

    // event _createInd_event(individual);
    event _login_event(bool successful_login, string name, string contact, string email, string Address, string result);
    event _signup_event(individual);

    individual[] public Individuals;

    mapping(address => individual) ind_Users;//map to store individual corresponding to user address
    mapping(address => string) Password;//map to store password string corresponding to user address
    mapping(string => address) User_Ids;//map to reference addresses using userid

    // function _createInd(string calldata _name, string calldata _email,string calldata _password,string calldata _contact,string calldata _Address) internal {
    //     individual memory new_Individual = individual( _name,  _email, _password, _contact, _Address);
    //     // Individuals.push(new_Individual);
    //     // ind_Users[msg.sender]=new_Individual;
    //     // Password[msg.sender]=_password;
    //     // User_Ids[_name]=msg.sender;
    //     emit _createInd_event(new_Individual);
    //     Individuals.push(new_Individual);
    //     ind_Users[msg.sender]=new_Individual;
    //     Password[msg.sender]=_password;
    //     User_Ids[_name]=msg.sender;
    // }

    function _signup (string calldata _name, string calldata _email,string calldata _password,string calldata _contact,string calldata _Address) public{
        individual memory new_Individual = individual( _name,  _email, _password, _contact, _Address);
        // _createInd(_name,  _email, _password, _contact , _Address);
        emit _signup_event(new_Individual);
        Individuals.push(new_Individual);
        ind_Users[msg.sender]=new_Individual;
        Password[msg.sender]=_password;
        User_Ids[_name]=msg.sender;
    }

    function _login (string calldata _userName, string calldata _password) public{
        if(keccak256(abi.encodePacked(Password[User_Ids[_userName]]))==keccak256(abi.encodePacked(_password))){
            emit _login_event(true, ind_Users[User_Ids[_userName]].name, ind_Users[User_Ids[_userName]].contact, ind_Users[User_Ids[_userName]].email, ind_Users[User_Ids[_userName]].Address,"succesful login");
        }
        else {
            emit _login_event(false, "","","","","Wrong Credentials");
        }
    }
}

contract Corporation{
    struct corporation{
        string name;
        string email;
        string password;
        string contact;
        string Address;
    }

    uint max_users=50;

    // event _createCorp_event(corporation, string);
    event _login_event(bool successful_login, string name, string contact, string email, string Address,string result);
    event _signup_event(corporation, string);

    corporation[] public Corporations;

    mapping(address => corporation) corp_Users;//map to store corporation corresponding to user address
    mapping(address => string) Password;//map to store password string corresponding to user address
    mapping(string => address) User_Ids;//map to reference addresses using userid

    // function _createCorp(string calldata _name, string calldata _email,string calldata _password,string calldata _contact,string calldata _Address) public {
    //     corporation memory new_Corporation = corporation( _name,  _email, _password, _contact, _Address);
    // //     Corporations.push(new_Corporation);
    // //     corp_Users[msg.sender]=new_Corporation;
    // //     Password[msg.sender]=_password;
    // //   //  uint id = uint(keccak256(abi.encodePacked(_name)))%max_users;
    // //     User_Ids[_name]=msg.sender;
    //     emit _createCorp_event(new_Corporation,_name);
    //     Corporations.push(new_Corporation);
    //     corp_Users[msg.sender]=new_Corporation;
    //     Password[msg.sender]=_password;
    //   //  uint id = uint(keccak256(abi.encodePacked(_name)))%max_users;
    //     User_Ids[_name]=msg.sender;
    // }

    function _signup (string calldata _name, string calldata _email,string calldata _password,string calldata _contact,string calldata _Address) public{
        corporation memory new_Corporation = corporation( _name,  _email, _password, _contact, _Address);
        // _createCorp(_name,  _email, _password, _contact , _Address);
        emit _signup_event(new_Corporation,_name);
        Corporations.push(new_Corporation);
        corp_Users[msg.sender]=new_Corporation;
        Password[msg.sender]=_password;
      //  uint id = uint(keccak256(abi.encodePacked(_name)))%max_users;
        User_Ids[_name]=msg.sender;
    }

    function _login (string calldata _userName, string calldata  _password) public{
        if(keccak256(abi.encodePacked(Password[User_Ids[_userName]]))==keccak256(abi.encodePacked(_password))){
            emit _login_event(true, corp_Users[User_Ids[_userName]].name, corp_Users[User_Ids[_userName]].contact, corp_Users[User_Ids[_userName]].email, corp_Users[User_Ids[_userName]].Address,"successful login");
        }
        else {
            emit _login_event(false, "","","","", "Wrong credentials");
        }
    }
}
