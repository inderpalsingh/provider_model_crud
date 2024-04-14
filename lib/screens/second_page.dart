import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_model_crud/models/todo_model.dart';
import 'package:provider_model_crud/provider/todo_provider.dart';

class SecondPage extends StatelessWidget {
  
  int? updateIndex;
  bool isUpdate;
  TodoModel? todoModelUpdate;
  SecondPage({super.key, this.updateIndex,this.isUpdate = false, this.todoModelUpdate});
  
  TextEditingController titleController = TextEditingController();
  TextEditingController descController = TextEditingController();
  
  
  @override
  Widget build(BuildContext context) {
    titleController.text = todoModelUpdate!.title;
    descController.text = todoModelUpdate!.desc;
    return Scaffold(
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.only(top: 100),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(
                labelText: 'title',
                border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: descController,
              decoration: const InputDecoration(
                labelText: 'desc',
                  border: OutlineInputBorder()
              ),
            ),
            const SizedBox(height: 50),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(onPressed: () {
                  
                  if(!isUpdate){
                    context.read<TodoProvider>().addTodos(
                        todoModel: TodoModel(title: titleController.text, desc: descController.text)
                    );
                   
                  }else{
                    
                    context.read<TodoProvider>().updateTodo(
                        todoModel: TodoModel(
                          id: todoModelUpdate!.id,
                            title: titleController.text,
                            desc: descController.text,
                        )
                    );
                  }
                  Navigator.pop(context);
                }, child: Text(isUpdate ? 'Update Note' :'Add Note')),

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
