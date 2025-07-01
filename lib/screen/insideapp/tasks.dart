import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:recover/models/type_model.dart';
import 'package:recover/models/progress_model.dart';

class AddTypeModelPage extends StatefulWidget {
  const AddTypeModelPage({super.key});

  @override
  State<AddTypeModelPage> createState() => _AddTypeModelPageState();
}

class _AddTypeModelPageState extends State<AddTypeModelPage> {
  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _typeController = TextEditingController();
  final _descController = TextEditingController();

  DateTime? _selectedDate;
  bool _isDone = false;

  void _pickDate() async {
    final now = DateTime.now();
    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: now.subtract(const Duration(days: 365)),
      lastDate: now.add(const Duration(days: 365)),
    );

    if (picked != null) {
      setState(() {
        _selectedDate = picked;
      });
    }
  }

  void _saveTask() async {
    if (_formKey.currentState!.validate() && _selectedDate != null) {
      final newTask = TypeModel(
        title: _titleController.text.trim(),
        type: _typeController.text.trim(),
        progress: [
          ProgressModel(
            date: _selectedDate!,
            progress: 0,
          ),
        ],
        taskDate: _selectedDate!,
        isDone: _isDone,
        description: _descController.text.trim().isEmpty
            ? null
            : _descController.text.trim(),
      );

      final box = await Hive.openBox<TypeModel>('taskBox');
      await box.add(newTask);

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Task added successfully!")),
      );

      Navigator.pop(context); // go back
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Task")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _titleController,
                decoration: const InputDecoration(labelText: 'Title'),
                validator: (val) => val == null || val.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _typeController,
                decoration: const InputDecoration(labelText: 'Type'),
                validator: (val) => val == null || val.isEmpty ? 'Required' : null,
              ),
              const SizedBox(height: 12),
              TextFormField(
                controller: _descController,
                decoration: const InputDecoration(labelText: 'Description (optional)'),
              ),
              const SizedBox(height: 12),
              ListTile(
                title: Text(
                  _selectedDate == null
                      ? 'Select Date'
                      : 'Selected Date: ${DateFormat('dd-MM-yyyy').format(_selectedDate!)}',
                ),
                trailing: const Icon(Icons.calendar_today),
                onTap: _pickDate,
              ),
              const SizedBox(height: 12),
              SwitchListTile(
                title: const Text("Is Done?"),
                value: _isDone,
                onChanged: (val) => setState(() => _isDone = val),
              ),
              const SizedBox(height: 20),
              ElevatedButton.icon(
                icon: const Icon(Icons.save),
                label: const Text("Save Task"),
                onPressed: _saveTask,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
