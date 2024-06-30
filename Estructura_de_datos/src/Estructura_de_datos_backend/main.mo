import Nat8 "mo:base/Nat8";
import HashMap "mo:base/HashMap";
import Text "mo:base/Text";

actor {
  type Student = {
    id: Text;
    firstName : Text;
    lastName: Text;
    age: Nat8;
    activo: Bool;
  };

  let students = HashMap.HashMap<Text, Student> (5, Text.equal, Text.hash);

//Funcion publica para checkear si X Persona existe en el Hashmap
  public query func getPerson(id: Text) : async ?Student {
    return students.get(id);
  };

//Funcion de update que toma 3 valores para crear una nueva persona
  public func setPerson(id: Text, firstname: Text, lastname: Text, age: Nat8, activo: Bool) : async () {
    let newPerson: Student = {
    id = id;
    firstName = firstname;
    lastName = lastname;
    age = age;
    activo = activo;
    };
    students.put(id, newPerson);
  };

};
