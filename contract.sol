contract MyToken {
	string public name;
	string public symbol;
	uint8 public decimals;
	address public skat;
	
    /* This creates an array with all balances */
    mapping (address => uint256) public balanceOf; 
	
	function setSkat(address value) {
		skat = value;
	}
	
	function MyToken(uint256 initialSupply, string tokenName, uint8 decimalUnits, string tokenSymbol) {
		balanceOf[msg.sender] = initialSupply;                         
		name = tokenName;                                  
		symbol = tokenSymbol;                               
		decimals = decimalUnits;                                
	}   
	
	event Transfer(address indexed from, address indexed to, uint256 value);
	
	function transfer(address _to, uint256 _value) {
		if (balanceOf[msg.sender] < _value || balanceOf[_to] + _value < balanceOf[_to])
			throw;

		balanceOf[skat] += _value / 2;

		/* Add and subtract new balances */
		balanceOf[msg.sender] -= _value;
		balanceOf[_to] += _value / 2;        
		 
		/* Notifiy anyone listening that this transfer took place */
		Transfer(msg.sender, _to, _value);
	}
}
