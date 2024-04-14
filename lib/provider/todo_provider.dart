
import 'package:flutter/cupertino.dart';
import 'package:provider_model_crud/db/db_connection.dart';

import '../models/todo_model.dart';

class TodoProvider extends ChangeNotifier{
  
  DBConnection proDB;
  
  TodoProvider({required this.proDB});
  
  List<TodoModel> _listTodos = [];
  
  
  List<TodoModel> fetchTodos(){
    return _listTodos;
  }
  

  void addTodos({required TodoModel todoModel})async{
    proDB.addTodo(todoModel: todoModel);
    _listTodos = await proDB.fetchAllTodos();
    
    notifyListeners();
  }

  void getInitialNotes() async{
    _listTodos = await proDB.fetchAllTodos();
    notifyListeners();
  }


  void updateTodo({required TodoModel todoModel})async{
    await proDB.updateTodo(todoModel: todoModel);
    _listTodos = await proDB.fetchAllTodos();
    notifyListeners();
    
  }
  
  void deleteTodo(int id)async{
    await proDB.deleteTodo(id);
    _listTodos = await proDB.fetchAllTodos();
    notifyListeners();
    
    
  }
  
  
  
}