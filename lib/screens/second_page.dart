import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_model_crud/models/todo_model.dart';
import 'package:provider_model_crud/provider/todo_provider.dart';

class SecondPage extends StatelessWidget {
  
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 100),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                labelText: 'Add title',
                border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: descController,
              decoration: InputDecoration(
                labelText: 'Add desc',
                  border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () {
                  
                  if(titleController.text.isNotEmpty && descController.text.isNotEmpty){
                    context.read<TodoProvider>().addTodos(
                        todoModel: TodoModel(title: titleController.text, desc: descController.text)
                    );
                    Navigator.pop(context);
                  }
                }, child: const Text('Add Note')),

                ElevatedButton(onPressed: () {
                  Navigator.pop(context);

                }, child: const Text('Cancel')),
              ],
            )
          ],
        ),
      ),
    );
  }
}
