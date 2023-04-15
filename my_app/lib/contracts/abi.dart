const String ngoAbi = '''[
	{
		"inputs": [
			{
				"internalType": "string",
				"name": "_name",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "_motto",
				"type": "string"
			},
			{
				"internalType": "uint256",
				"name": "_amount",
				"type": "uint256"
			}
		],
		"name": "_addCampaign",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"components": [
					{
						"internalType": "string",
						"name": "name_campaign",
						"type": "string"
					},
					{
						"internalType": "string",
						"name": "motto",
						"type": "string"
					},
					{
						"internalType": "uint256",
						"name": "amountTotal",
						"type": "uint256"
					},
					{
						"internalType": "uint256",
						"name": "amountCollected",
						"type": "uint256"
					},
					{
						"internalType": "string",
						"name": "ngoName",
						"type": "string"
					}
				],
				"indexed": false,
				"internalType": "struct Ngo.campaign",
				"name": "",
				"type": "tuple"
			},
			{
				"indexed": false,
				"internalType": "bool",
				"name": "status",
				"type": "bool"
			}
		],
		"name": "_addCampaign_event",
		"type": "event"
	},
	{
		"inputs": [
			{
				"internalType": "string",
				"name": "name",
				"type": "string"
			}
		],
		"name": "_confirmNgo",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": false,
				"internalType": "string",
				"name": "name",
				"type": "string"
			}
		],
		"name": "_confirmNgo_event",
		"type": "event"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"components": [
					{
						"internalType": "string",
						"name": "name",
						"type": "string"
					},
					{
						"internalType": "string",
						"name": "email",
						"type": "string"
					},
					{
						"internalType": "string",
						"name": "password",
						"type": "string"
					},
					{
						"internalType": "string",
						"name": "contact",
						"type": "string"
					},
					{
						"internalType": "string",
						"name": "Address",
						"type": "string"
					}
				],
				"indexed": false,
				"internalType": "struct Ngo.ngo",
				"name": "",
				"type": "tuple"
			},
			{
				"indexed": false,
				"internalType": "string",
				"name": "name",
				"type": "string"
			}
		],
		"name": "_createNgo_event",
		"type": "event"
	},
	{
		"inputs": [
			{
				"internalType": "string",
				"name": "_name",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "_password",
				"type": "string"
			}
		],
		"name": "_login",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": false,
				"internalType": "bool",
				"name": "successful_login",
				"type": "bool"
			},
			{
				"indexed": false,
				"internalType": "string",
				"name": "name",
				"type": "string"
			},
			{
				"indexed": false,
				"internalType": "string",
				"name": "contact",
				"type": "string"
			},
			{
				"indexed": false,
				"internalType": "string",
				"name": "email",
				"type": "string"
			},
			{
				"indexed": false,
				"internalType": "string",
				"name": "Address",
				"type": "string"
			},
			{
				"indexed": false,
				"internalType": "string",
				"name": "remarks",
				"type": "string"
			}
		],
		"name": "_login_event",
		"type": "event"
	},
	{
		"inputs": [
			{
				"internalType": "string",
				"name": "_name",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "_email",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "_password",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "_contact",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "_Address",
				"type": "string"
			}
		],
		"name": "_signup",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "_withdrawCampaign",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "getAllCampaignsAndNgos",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"components": [
					{
						"internalType": "string",
						"name": "name_campaign",
						"type": "string"
					},
					{
						"internalType": "string",
						"name": "motto",
						"type": "string"
					},
					{
						"internalType": "uint256",
						"name": "amountTotal",
						"type": "uint256"
					},
					{
						"internalType": "uint256",
						"name": "amountCollected",
						"type": "uint256"
					},
					{
						"internalType": "string",
						"name": "ngoName",
						"type": "string"
					}
				],
				"indexed": false,
				"internalType": "struct Ngo.campaign[]",
				"name": "campaigns",
				"type": "tuple[]"
			},
			{
				"components": [
					{
						"internalType": "string",
						"name": "name",
						"type": "string"
					},
					{
						"internalType": "string",
						"name": "email",
						"type": "string"
					},
					{
						"internalType": "string",
						"name": "password",
						"type": "string"
					},
					{
						"internalType": "string",
						"name": "contact",
						"type": "string"
					},
					{
						"internalType": "string",
						"name": "Address",
						"type": "string"
					}
				],
				"indexed": false,
				"internalType": "struct Ngo.ngo[]",
				"name": "ngos",
				"type": "tuple[]"
			}
		],
		"name": "getAllCampaignsAndNgos_event",
		"type": "event"
	},
	{
		"inputs": [
			{
				"internalType": "string",
				"name": "_ngoName",
				"type": "string"
			}
		],
		"name": "logout",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": false,
				"internalType": "bool",
				"name": "success",
				"type": "bool"
			}
		],
		"name": "logout_event",
		"type": "event"
	},
	{
		"inputs": [
			{
				"internalType": "string",
				"name": "ngoName",
				"type": "string"
			},
			{
				"internalType": "uint256",
				"name": "amount",
				"type": "uint256"
			}
		],
		"name": "transfer",
		"outputs": [],
		"stateMutability": "payable",
		"type": "function"
	},
	{
		"stateMutability": "payable",
		"type": "fallback"
	},
	{
		"stateMutability": "payable",
		"type": "receive"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"name": "Campaigns",
		"outputs": [
			{
				"internalType": "string",
				"name": "name_campaign",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "motto",
				"type": "string"
			},
			{
				"internalType": "uint256",
				"name": "amountTotal",
				"type": "uint256"
			},
			{
				"internalType": "uint256",
				"name": "amountCollected",
				"type": "uint256"
			},
			{
				"internalType": "string",
				"name": "ngoName",
				"type": "string"
			}
		],
		"stateMutability": "view",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"name": "Ngos",
		"outputs": [
			{
				"internalType": "string",
				"name": "name",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "email",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "password",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "contact",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "Address",
				"type": "string"
			}
		],
		"stateMutability": "view",
		"type": "function"
	}
]''';
const String individualAbi = '''[
	{
		"anonymous": false,
		"inputs": [
			{
				"components": [
					{
						"internalType": "string",
						"name": "name",
						"type": "string"
					},
					{
						"internalType": "string",
						"name": "email",
						"type": "string"
					},
					{
						"internalType": "string",
						"name": "password",
						"type": "string"
					},
					{
						"internalType": "string",
						"name": "contact",
						"type": "string"
					},
					{
						"internalType": "string",
						"name": "Address",
						"type": "string"
					}
				],
				"indexed": false,
				"internalType": "struct Individual.individual",
				"name": "",
				"type": "tuple"
			}
		],
		"name": "_createInd_event",
		"type": "event"
	},
	{
		"inputs": [
			{
				"internalType": "string",
				"name": "_userName",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "_password",
				"type": "string"
			}
		],
		"name": "_login",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": false,
				"internalType": "bool",
				"name": "successful_login",
				"type": "bool"
			},
			{
				"indexed": false,
				"internalType": "string",
				"name": "name",
				"type": "string"
			},
			{
				"indexed": false,
				"internalType": "string",
				"name": "contact",
				"type": "string"
			},
			{
				"indexed": false,
				"internalType": "string",
				"name": "email",
				"type": "string"
			},
			{
				"indexed": false,
				"internalType": "string",
				"name": "Address",
				"type": "string"
			}
		],
		"name": "_login_event",
		"type": "event"
	},
	{
		"inputs": [
			{
				"internalType": "string",
				"name": "_name",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "_email",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "_password",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "_contact",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "_Address",
				"type": "string"
			}
		],
		"name": "_signup",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": false,
				"internalType": "bool",
				"name": "success",
				"type": "bool"
			}
		],
		"name": "_signup_event",
		"type": "event"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"name": "Individuals",
		"outputs": [
			{
				"internalType": "string",
				"name": "name",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "email",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "password",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "contact",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "Address",
				"type": "string"
			}
		],
		"stateMutability": "view",
		"type": "function"
	}
]''';
const String corporateAbi = '''[
	{
		"anonymous": false,
		"inputs": [
			{
				"components": [
					{
						"internalType": "string",
						"name": "name",
						"type": "string"
					},
					{
						"internalType": "string",
						"name": "email",
						"type": "string"
					},
					{
						"internalType": "string",
						"name": "password",
						"type": "string"
					},
					{
						"internalType": "string",
						"name": "contact",
						"type": "string"
					},
					{
						"internalType": "string",
						"name": "Address",
						"type": "string"
					}
				],
				"indexed": false,
				"internalType": "struct Corporation.corporation",
				"name": "",
				"type": "tuple"
			},
			{
				"indexed": false,
				"internalType": "string",
				"name": "",
				"type": "string"
			}
		],
		"name": "_createCorp_event",
		"type": "event"
	},
	{
		"inputs": [
			{
				"internalType": "string",
				"name": "_userName",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "_password",
				"type": "string"
			}
		],
		"name": "_login",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": false,
				"internalType": "bool",
				"name": "successful_login",
				"type": "bool"
			},
			{
				"indexed": false,
				"internalType": "string",
				"name": "name",
				"type": "string"
			},
			{
				"indexed": false,
				"internalType": "string",
				"name": "contact",
				"type": "string"
			},
			{
				"indexed": false,
				"internalType": "string",
				"name": "email",
				"type": "string"
			},
			{
				"indexed": false,
				"internalType": "string",
				"name": "Address",
				"type": "string"
			}
		],
		"name": "_login_event",
		"type": "event"
	},
	{
		"inputs": [
			{
				"internalType": "string",
				"name": "_name",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "_email",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "_password",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "_contact",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "_Address",
				"type": "string"
			}
		],
		"name": "_signup",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": false,
				"internalType": "bool",
				"name": "success",
				"type": "bool"
			}
		],
		"name": "_signup_event",
		"type": "event"
	},
	{
		"inputs": [
			{
				"internalType": "uint256",
				"name": "",
				"type": "uint256"
			}
		],
		"name": "Corporations",
		"outputs": [
			{
				"internalType": "string",
				"name": "name",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "email",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "password",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "contact",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "Address",
				"type": "string"
			}
		],
		"stateMutability": "view",
		"type": "function"
	}
]''';

const String testAbi = '''[
	{
		"anonymous": false,
		"inputs": [
			{
				"components": [
					{
						"internalType": "string",
						"name": "name",
						"type": "string"
					},
					{
						"internalType": "string",
						"name": "email",
						"type": "string"
					},
					{
						"internalType": "string",
						"name": "password",
						"type": "string"
					},
					{
						"internalType": "string",
						"name": "contact",
						"type": "string"
					},
					{
						"internalType": "string",
						"name": "Address",
						"type": "string"
					},
					{
						"internalType": "bool",
						"name": "confirmed",
						"type": "bool"
					},
					{
						"internalType": "bool",
						"name": "loggedIn",
						"type": "bool"
					}
				],
				"indexed": false,
				"internalType": "struct Testcontract.Ngo",
				"name": "_value",
				"type": "tuple"
			}
		],
		"name": "Test_event",
		"type": "event"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"components": [
					{
						"internalType": "string",
						"name": "name",
						"type": "string"
					},
					{
						"internalType": "string",
						"name": "email",
						"type": "string"
					},
					{
						"internalType": "string",
						"name": "password",
						"type": "string"
					},
					{
						"internalType": "string",
						"name": "contact",
						"type": "string"
					},
					{
						"internalType": "string",
						"name": "Address",
						"type": "string"
					},
					{
						"internalType": "bool",
						"name": "confirmed",
						"type": "bool"
					},
					{
						"internalType": "bool",
						"name": "loggedIn",
						"type": "bool"
					}
				],
				"indexed": false,
				"internalType": "struct Testcontract.Ngo",
				"name": "t",
				"type": "tuple"
			},
			{
				"indexed": false,
				"internalType": "string",
				"name": "name",
				"type": "string"
			}
		],
		"name": "_createNgo_event",
		"type": "event"
	},
	{
		"inputs": [],
		"name": "_getAllNgos",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"components": [
					{
						"internalType": "string",
						"name": "name",
						"type": "string"
					},
					{
						"internalType": "string",
						"name": "email",
						"type": "string"
					},
					{
						"internalType": "string",
						"name": "password",
						"type": "string"
					},
					{
						"internalType": "string",
						"name": "contact",
						"type": "string"
					},
					{
						"internalType": "string",
						"name": "Address",
						"type": "string"
					},
					{
						"internalType": "bool",
						"name": "confirmed",
						"type": "bool"
					},
					{
						"internalType": "bool",
						"name": "loggedIn",
						"type": "bool"
					}
				],
				"indexed": false,
				"internalType": "struct Testcontract.Ngo[10]",
				"name": "all",
				"type": "tuple[10]"
			}
		],
		"name": "_getAllNgos_event",
		"type": "event"
	},
	{
		"inputs": [
			{
				"internalType": "string",
				"name": "_name",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "_email",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "_password",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "_contact",
				"type": "string"
			},
			{
				"internalType": "string",
				"name": "_Address",
				"type": "string"
			}
		],
		"name": "_signup",
		"outputs": [],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [
			{
				"internalType": "string",
				"name": "_Ngo",
				"type": "string"
			}
		],
		"name": "addNgo",
		"outputs": [
			{
				"components": [
					{
						"internalType": "string",
						"name": "name",
						"type": "string"
					},
					{
						"internalType": "string",
						"name": "email",
						"type": "string"
					},
					{
						"internalType": "string",
						"name": "password",
						"type": "string"
					},
					{
						"internalType": "string",
						"name": "contact",
						"type": "string"
					},
					{
						"internalType": "string",
						"name": "Address",
						"type": "string"
					},
					{
						"internalType": "bool",
						"name": "confirmed",
						"type": "bool"
					},
					{
						"internalType": "bool",
						"name": "loggedIn",
						"type": "bool"
					}
				],
				"internalType": "struct Testcontract.Ngo",
				"name": "",
				"type": "tuple"
			}
		],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"inputs": [],
		"name": "newF",
		"outputs": [
			{
				"internalType": "uint256",
				"name": "i",
				"type": "uint256"
			}
		],
		"stateMutability": "nonpayable",
		"type": "function"
	},
	{
		"anonymous": false,
		"inputs": [
			{
				"indexed": false,
				"internalType": "uint256",
				"name": "i",
				"type": "uint256"
			}
		],
		"name": "newF_event",
		"type": "event"
	},
	{
		"inputs": [],
		"name": "trial_func",
		"outputs": [
			{
				"internalType": "string",
				"name": "",
				"type": "string"
			}
		],
		"stateMutability": "pure",
		"type": "function"
	}
]''';
