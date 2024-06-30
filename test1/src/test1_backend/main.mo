actor {
  var name: Text = "";
  public func setName(nombre : Text) : async () {
    name := nombre;
  };

  public query func getName() : async Text {  
    return name;
  };
};
