import 'package:provider_model_crud/db/db_connection.dart';

class TodoModel{
  
  int id;
  String title;
  String desc;
  
  TodoModel({ this.id=0, required this.title, required this.desc, });
  
  //// map to model

  factory TodoModel.fromMap(Map<String, dynamic> map){
    return TodoModel(
      id: map[DBConnection.TABLE_COLUMN_ID],
        title: map[DBConnection.TABLE_COLUMN_TITLE],
        desc: map[DBConnection.TABLE_COLUMN_DESC]
    );
  }
  
  //// Model to map

  Map<String, dynamic> toMap(){
    return {
      DBConnection.TABLE_COLUMN_TITLE: title,
      DBConnection.TABLE_COLUMN_DESC: desc
    };
  }
  

}