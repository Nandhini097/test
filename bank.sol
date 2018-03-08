pragma solidity^0.4.0;
contract solidity
{

    function totalSupply()public constant returns(uint256){}
    function transfer(address to,uint256 amount)public  returns(uint256){}
    function mint(uint256)public payable{}
     function balanceOf(address _owner) constant returns (uint256 balance) {}
       function approve(address _spender, uint256 _value) returns (bool success) {}
    function allowance(address _owner, address _spender) constant returns (uint256 remaining) {}
       event Approval(address indexed _owner, address indexed _spender, uint256 _value);
 event Transfer(address indexed _from, address indexed _to, uint256 _value);
    }
contract sample is solidity{
     string public symbol;
     string public name;
     uint256 public totalsupply;
     uint256 public decimals;
      address owner;
    modifier ab
    {
       require(owner==msg.sender);
        _;
    }
    

    
    mapping(address=>uint256)public balances;
     mapping(address => mapping(address => uint256))internal allow;
    
   
    
    function sample()
    { 
        owner=msg.sender;
        totalsupply=10000;
        name="mnw";
    decimals=18;
        symbol="kec";
        balances[owner]=10000;
    }
     function transfer(address to,uint256 amount)public ab returns(uint256)
    {
        
        balances[msg.sender]-=amount;
        balances[to]=balances[to]+amount;
    
    }
    
    function mint(uint256 amount)public payable ab{
        require(amount<=totalsupply);
        balances[msg.sender]=balances[msg.sender]+amount;

    }
    
    function totalsupply()public constant returns(uint256)
    {
        return balances[msg.sender];
    }
      
     function balanceOf(address _owner) constant returns(uint256 )
     {
         return balances[_owner];
     }
     
    
     
     function approve(address _spender,uint256 _value) returns(bool success){
         allow[msg.sender][_spender] = _value;
         Approval(msg.sender,_spender,_value);
         return true;
     }
     
     
     function allowance(address _owner,address _spender) constant returns(uint256 ){
         return allow[_owner][_spender];
     }
      function transferFrom(address _from,address _to,uint256 _value) returns(bool success) {
         if (balances[_from] >= _value && _value > 0 && allow[_from][_to] >= _value){
             
             balances[_from] -= _value;
             balances[_to] += _value;
             allow[_from][_to] -= _value;
             Transfer(_from,_to,_value);
             return true;
         }
         else{
             return false;
         }
     }
     
     
   
}
