import 'dart:io';

// Student Management System

class Student {
  String name;
  int id = -1;
  double grade;
  List<String> courses;
  Student(this.id, this.name, this.grade,this.courses);

  void printInfo() {
    print("ID: $id, Name: $name, Grade: $grade");
    print("Courses: ${courses.join(', ')}");
    print("               ==================================");
  }
}

class System_management{
  List<Student> students = [];

  void addStudent(int id, String name, double grade, List<String> courses) {
    students.add(Student(id, name, grade, courses));
    print("Student added successfully!\n");
  }

  void viewStudents() {
    if (students.isEmpty) {
      print("No students are available.\n");
    } else {
      for (var student in students) {
        student.printInfo();
      }
      
    }
  }

  void search(int id) {
    // var student = students.firstWhere((s) => s.id == id,
    //   orElse: () => Student(-1, "Not Found", 0.0, []),
    // );
    var student ;
    if (student.id == -1) {
      print("Student not found!\n");
    } else {
      student.printInfo();
    }
  }
}

void main() {

System_management system = new System_management();
  while (true) {
    print("Student Record Management System");
    print("1. Add Student");
    print("2. View Students");
    print("3. Search for Student");
    print("Enter your choice: ");
    var choice = int.tryParse(stdin.readLineSync() ?? '');

    switch (choice) {
      case 1:
        print("Enter ID: ");
        int id = int.parse(stdin.readLineSync()!);
        print("Enter Name: ");
        String name = stdin.readLineSync()!;
        print("Enter Grade: ");
        double grade = double.parse(stdin.readLineSync()!);
        print("Enter num of courses: ");
        int num = int.parse(stdin.readLineSync()!);
        List<String> courses = [];
        print("Enter courses : ");
        for(int i = 0; i < num; i++) {
            String? subject = stdin.readLineSync();
              if (subject != null) 
                courses.add(subject);
          }
        system.addStudent(id, name, grade, courses);
        break;
      case 2:
        system.viewStudents();
        break;
      case 3:
        print("Enter Student id to search: ");
        int id = int.parse(stdin.readLineSync()!);
        system.search(id);
        break;
      default:
        print("Invalid choice! Try again.\n");
    }
  }
}
