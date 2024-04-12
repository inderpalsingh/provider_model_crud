import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_model_crud/provider/todo_provider.dart';
import 'package:provider_model_crud/screens/second_page.dart';


class HomePage extends StatefulWidget {
  
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  
  @override
  void initState() {
    super.initState();
    context.read<TodoProvider>().getInitialNotes();
  }
  
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Consumer<TodoProvider>(
        builder: (_, value, child) {
          var myData = value.fetchTodos();
          return myData.isEmpty ? Center(child: Text('No Todo')):
          ListView.builder(
            itemCount: myData.length,
            itemBuilder: (context, index) {
              return ListTile(
                leading: CircleAvatar(child: Text(myData[index].id.toString())),
                title: Text(myData[index].title),
                subtitle: Text(myData[index].desc),
                trailing: IconButton(
                  onPressed: () {
                    context.read<TodoProvider>().deleteTodo(myData[index].id);
                  },
                 icon: Icon(Icons.delete), color: Colors.red,),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context)=> SecondPage()));
        },
        child: const Text('Notes'),
      ),
    );
  }
}
