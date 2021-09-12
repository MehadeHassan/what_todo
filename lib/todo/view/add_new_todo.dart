import 'package:flutter/material.dart';
import 'package:todo_repository/todo_repository.dart';

class AddNewTodo extends StatefulWidget {
  const AddNewTodo({
    final Key? key,
    required final ValueChanged<Todo> onAdd,
  })  : _onAdd = onAdd,
        super(key: key);

  final ValueSetter<Todo> _onAdd;

  @override
  State<AddNewTodo> createState() => _AddNewTodoState();
}

class _AddNewTodoState extends State<AddNewTodo> {
  final TextEditingController _textController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(final BuildContext context) => GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: Scaffold(
          appBar: AppBar(),
          body: Padding(
            padding: const EdgeInsets.all(50),
            child: Form(
              key: _formKey,
              child: Center(
                child: Column(
                  children: [
                    TextFormField(
                      controller: _textController,
                      decoration: const InputDecoration(
                        labelText: 'Task',
                        filled: true,
                        border: OutlineInputBorder(),
                      ),
                      autofocus: true,
                      keyboardType: TextInputType.text,
                      validator: (final value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a task';
                        }
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          widget._onAdd(
                            Todo(
                              task: _textController.text,
                            ),
                          );
                        }
                      },
                      child: const Text('Done'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
}
