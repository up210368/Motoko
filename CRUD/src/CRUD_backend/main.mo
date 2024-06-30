import HashMap "mo:base/HashMap";
import Text "mo:base/Text";
import Nat8 "mo:base/Nat8";
import Iter "mo:base/Iter";

actor {
  type Student = {
    id: Text;
    firstName : Text;
    lastName: Text;
    age: Nat8;
    activo: Bool;
  };

  let students = HashMap.HashMap<Text, Student> (5, Text.equal, Text.hash);

  public func createStudent(id: Text, firstname: Text, lastname: Text, age: Nat8, activo: Bool) : async () {
    let newPerson: Student = {
      id = id;
      firstName = firstname;
      lastName = lastname;
      age = age;
      activo = activo;
    };
    students.put(id, newPerson);
  };

  public func updateStudent(id: Text, firstname: Text, lastname: Text, age: Nat8, activo: Bool) : async (){
    let update: Student = {
      id = id;
      firstName = firstname;
      lastName = lastname;
      age = age;
      activo = activo;
    };
    ignore students.replace(id, update);
  };

  public query func readStudents() : async [(Text, Student)]{
    return Iter.toArray(students.entries());
  };

  public func deleteStudents(id: Text) : async (){
    students.delete(id);
  };
}
