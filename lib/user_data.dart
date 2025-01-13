// import 'dart:convert';

class UserDetails {
  String name;
  int age;

  UserDetails({required this.name, required this.age});
}

// List for the saving the data of the user

List<UserDetails> user = [
  UserDetails(name: 'Randhir', age: 24),
  UserDetails(name: 'Sameer', age: 28),
  UserDetails(name: 'Mandar', age: 23)
];

// Display user Detials

void addUserDetails(String name, int age) {
  user.add(UserDetails(name: name, age: age));
}

void main() {
  //  custom input for add the details
  // addUserDetails('Pratik', 30);

  // Question 1 print the value of the name at in the index no.1
  print('Que1: The Value of name at the index no.1: ${user[1].name}');

  // Question 2 print the index of age =24

  int indexOfAge24 = user.indexWhere((user) => user.age == 24);
  print('Que2: Index value of Age for 24 is: $indexOfAge24');

  // Display user details
  for (var user in user) {
    print('Name: ${user.name}, Age: ${user.age}');
  }
}
