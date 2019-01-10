
var options = {
  "dev":{
    engine:"sqlite",
    address:"localhost",
    port:"8765"
  },
  "prod":{
    engine:"sqlite",
    address:"https://sqlprod.somedomain.org",
    port:"5678"
  }
};

var moduleThis = this;
var self = null;

module.exports = self || ()=>{
  self = moduleThis;

  self.options = options;
  self.current = "dev";
  self.getCurrentOptions = function(){
    return self.options[self.current];
  }

  return self;
};
