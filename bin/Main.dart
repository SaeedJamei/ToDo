import 'dart:io';

import 'Person.dart';
import 'ToDo.dart';
List<Person> personList = [];
List<ToDo> toDoList = [];
void main(){
  while(true){
    print("""
    1-ثبت افراد
    2-ثبت توضیحات
    3-فهرست افراد و توضیحات
    4-فهرست توضیحات
    6-خروج
    """);
    String? input=stdin.readLineSync();
    while(input == ''){
      print('لطفا عدد درست را وارد کنید');
      input = stdin.readLineSync();
    }
    switch(input){
      case '1':{
        print('لطفا نام را وارد کنید:');
        String? name = stdin.readLineSync();
        while(name == ''){
          print('لطفا نام را وارد کنید:');
          name = stdin.readLineSync();
        }
        print('لطفا نام خانوادگی را وارد کنید:');
        String? lName = stdin.readLineSync();
        while(lName == ''){
          print('لطفا نام را وارد کنید:');
          lName = stdin.readLineSync();
        }
        Person person = Person(fName: name!, lName: lName!);
        personList.add(person);
        print('فرد مورد نظر ثبت شد');
      }
      break;
      case '2':{
        print('لطفا عنوان را وارد کنید:');
        String? onvan = stdin.readLineSync();
        while(onvan == ''){
          print('لطفا عنوان را وارد کنید:');
          onvan = stdin.readLineSync();
        }
        print('لطفا توضیحات را وارد کنید:');
        String? tozihat = stdin.readLineSync();
        while(tozihat == ''){
          print('لطفا توضیحات را وارد کنید:');
          tozihat = stdin.readLineSync();
        }
        print('فرد مورد نظر را انتخاب کنید');
        for(int i = 0 ; i < personList.length ; i++) {
          print('${i+1}-${personList[i].fName} ${personList[i].lName}');
        }
        String? personNumber = stdin.readLineSync();
        while(personNumber == '' || int.tryParse(personNumber!) == null){
          print('لطفا عدد مورد نظر را وارد کنید');
          personNumber = stdin.readLineSync();
        }
        int  personNumberInt = int.parse(personNumber);
        while(personNumberInt < 1 || personNumberInt > personList.length){
          print('لطفا عدد مورد نظر را وارد کنید');
          personNumber = stdin.readLineSync();
          while(personNumber == '' || int.tryParse(personNumber!) == null){
            print('لطفا عدد مورد نظر را وارد کنید');
            personNumber = stdin.readLineSync();
          }
          personNumberInt = int.parse(personNumber);
        }
        Person newPerson = personList[personNumberInt-1];
        ToDo newTodo = ToDo(tittle: onvan!, explain: tozihat!, person: newPerson);
        toDoList.add(newTodo);
        print('توضیحات مورد نظر ثبت شد');
        }
      break;
      case '3':{
        for(int i = 0 ; i < personList.length ; i++){
          print('${personList[i].fName} ${personList[i].lName}');
          for(int j = 0 ; j < toDoList.length ; j++){
            if(toDoList[j].person == personList[i]){
              print('${toDoList[j].tittle} / ${toDoList[j].explain}');
            }
          }
          print('--------------');
        }
      }
      break;
      case '4':{
        for(int i = 0; i < toDoList.length ; i++){
          print('${i+1}-${toDoList[i].tittle} / ${toDoList[i].explain}');
        }
      }
      break;

      case '6':{
        exit(0);
      }
      default : {
        print('لطفا عدد درست را وارد کنید');
      }
    }
  }
}