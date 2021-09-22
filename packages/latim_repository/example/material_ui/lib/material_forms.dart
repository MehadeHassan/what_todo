import 'package:flutter/material.dart';

class MaterialForms extends StatefulWidget {
  const MaterialForms({final Key? key}) : super(key: key);

  @override
  State<MaterialForms> createState() => _MaterialFormsState();
}

class _MaterialFormsState extends State<MaterialForms> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(final BuildContext context) => Scaffold(
        // appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _formKey,
            child: Column(
              children: <Widget>[
                TextFormField(
                  readOnly: true,
                  decoration: const InputDecoration(
                    labelText: 'Read Only',
                  ),
                ),
                const TextField(
                  decoration: InputDecoration.collapsed(
                    hintText: 'InputDecoration.collapsed',
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: InputBorder.none,
                    hintText: 'No border',
                  ),
                ),
                TextFormField(
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'OutlineInputBorder',
                  ),
                ),
                const Divider(),
                TextFormField(
                  validator: (final String? value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter some text';
                    }
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                    hintText: 'OutlineInputBorder with borderRadius',
                  ),
                  onEditingComplete: () {
                    _formKey.currentState?.validate();
                  },
                ),
              ],
            ),
          ),
        ),
      );
}
