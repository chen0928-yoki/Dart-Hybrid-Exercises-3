import 'dart:convert';

class Students {
  List<Map<String, String>> people;

  
  Students(this.people);

  
  void sort(String field) {
    people.sort((a, b) => a[field]!.compareTo(b[field]!));
  }

  
  void output() {
    for (var person in people) {
      print(person);
    }
  }

  
  void plus(Map<String, String> person) {
    people.add(person);
  }

  
  void remove(String field, String value) {
    people.removeWhere((person) => person[field] == value);
  }
}

void main() {
  String json = '''
  [
    {"first":"Steve", "last":"Griffith", "email":"griffis@algonquincollege.com"},
    {"first":"Adesh", "last":"Shah", "email":"shaha@algonquincollege.com"},
    {"first":"Tony", "last":"Davidson", "email":"davidst@algonquincollege.com"},
    {"first":"Adam", "last":"Robillard", "email":"robilla@algonquincollege.com"}
  ]
  ''';

  
  List<dynamic> decodedJson = jsonDecode(json);

  
  List<Map<String, String>> peopleList = decodedJson
      .map((item) => Map<String, String>.from(item))
      .toList();

  
  Students students = Students(peopleList);

  
  students.sort('first');
  print('Sorted by first name:');
  students.output();

  
  students.plus({"first": "John", "last": "Doe", "email": "john.doe@example.com"});
  print('\nAfter adding John Doe:');
  students.output();

  
  students.remove('first', 'Adesh');
  print('\nAfter removing Adesh:');
  students.output();
}
