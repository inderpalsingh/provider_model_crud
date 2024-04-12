import 'package:path_provider/path_provider.dart';
import 'package:provider_model_crud/models/todo_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class DBConnection{

  /// Singleton (private constructor )
  DBConnection._();

  /// accessing the connection class object and create db class object
  static final DBConnection db = DBConnection._();
  
  
  
  Database? myDb;

  /// creating global static values
  static const String TABLE_NAME = 'todo';
  static const String TABLE_COLUMN_TITLE = 'todo_title';
  static const String TABLE_COLUMN_DESC = 'todo_desc';
  static const String TABLE_COLUMN_ID = 'id';
  
  
  Future<Database> getDB()async{
    if(myDb != null) {
      return myDb!;
    }else{
      myDb = await initDb();
      return myDb!;
    }
  }
  
  Future<Database> initDb()async{
    var rootPath = await getApplicationDocumentsDirectory();
    var actualPath = join(rootPath.path, 'todo_db.db');
    
    return await openDatabase(actualPath, version: 1,onCreate: (db, version) async {
      /// create table
      await db.execute(
          'CREATE TABLE $TABLE_NAME ($TABLE_COLUMN_ID INTEGER PRIMARY KEY AUTOINCREMENT, $TABLE_COLUMN_TITLE TEXT, $TABLE_COLUMN_DESC TEXT )');
      
    });
  }
  
  Future<List<TodoModel>> fetchAllTodos() async{
    
    var db = await getDB();
    var data = await db.query(TABLE_NAME);
    
    List<TodoModel> getAllTodos = [];
    
    for(Map<String, dynamic> mapData in data){
      var dataModel = TodoModel.fromMap(mapData);
      getAllTodos.add(dataModel);
    }
    
    return getAllTodos;
  }
  
  
  addTodo({required TodoModel todoModel}) async {
    
    var db = await getDB();
    
    db.insert(TABLE_NAME, todoModel.toMap());
    
  }
  
  
  
}