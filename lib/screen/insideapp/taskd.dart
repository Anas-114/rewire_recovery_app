
// screen/insideapp/taskd.dart
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:intl/intl.dart';
import 'package:recoverly/models/progress_model.dart';
import 'package:recoverly/models/type_model.dart';
import 'package:recoverly/screen/insideapp/tasks.dart';
import 'package:recoverly/screen/insideapp/tasks_hardcode.dart';
 
class Taskd extends StatefulWidget {
  const Taskd({super.key});

  @override
  State<Taskd> createState() => _TaskdState();
}

class _TaskdState extends State<Taskd> {
  late Box<TypeModel> taskBox;

  @override
  void initState() {
    super.initState();
    initBoxAndLoadTasks();
  }
  void _confirmDelete(TypeModel task) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      title: const Text("Delete Task"),
      content: const Text("Are you sure you want to delete this task?"),
      actions: [
        TextButton(
          child: const Text("Cancel"),
          onPressed: () => Navigator.pop(context),
        ),
        ElevatedButton(
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          child: const Text("Delete"),
          onPressed: () async {
            await task.delete();
            Navigator.pop(context);
            setState(() {});
          },
        ),
      ],
    ),
  );
}
void _showUpdateDialog(TypeModel task) {
  final titleController = TextEditingController(text: task.title);
  final descController = TextEditingController(text: task.description ?? '');

  showDialog(
    context: context,
    builder: (context) {
      return AlertDialog(
        title: const Text('Update Task'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: titleController,
              decoration: const InputDecoration(labelText: 'Title'),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: descController,
              decoration: const InputDecoration(labelText: 'Description'),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton(
            onPressed: () {
              task.title = titleController.text.trim();
              task.description = descController.text.trim();
              task.save(); // Hive: updates the object
              Navigator.pop(context);
              setState(() {}); // Refresh UI
            },
            child: const Text("Update"),
          ),
        ],
      );
    },
  );
}


  Future<void> initBoxAndLoadTasks() async {
    if (!Hive.isBoxOpen('taskBox')) {
      taskBox = await Hive.openBox<TypeModel>('taskBox');
    } else {
      taskBox = Hive.box<TypeModel>('taskBox');
    }

    if (taskBox.isEmpty) {
      hardcodedTasks.forEach((type, tasks) {
        for (var task in tasks) {
          taskBox.add(TypeModel(
            title: task['title']!,
            type: type,
            progress: [],
            taskDate: DateTime.now(),
            isDone: false,
            description: task['description'],
          ));
        }
      });
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
  appBar: _buildAppBar(),
 
  body:ValueListenableBuilder<Box<TypeModel>>(
  valueListenable: Hive.box<TypeModel>('taskBox').listenable(),
  child: Padding(
    padding: const EdgeInsets.all(16),
    child: Text(
      "🗓️ ${DateFormat('EEEE, dd MMMM yyyy').format(DateTime.now())}",
      style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
    ),
  ),
  builder: (context, box, child) {
    final tasks = box.values.toList();

    if (tasks.isEmpty) {
      return Column(
        children: [
          child!,
          const Expanded(child: Center(child: Text("No tasks yet"))),
        ],
      );
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        child!,
        const SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(12),
            itemCount: tasks.length,
            itemBuilder: (context, index) {
              final task = tasks[index];
              return _buildTaskTile(task);
            },
          ),
        ),
      ],
    );
  },
),

  floatingActionButton: FloatingActionButton(
    backgroundColor: Colors.blueAccent,
    child: const Icon(Icons.add, color: Colors.white),
    onPressed: () {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (_) => const AddTypeModelPage()),
      );
    },
  ),
);
;
  }

  AppBar _buildAppBar() {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 9,
      automaticallyImplyLeading: false,
      flexibleSpace: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.blue.shade700, Colors.blueAccent],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(30),
            bottomRight: Radius.circular(30),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            child: Center(
              child: Text(
                "Tasks",
                style: GoogleFonts.poppins(
                  fontSize: 28,
                  fontWeight: FontWeight.w600,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildTaskTile(TypeModel task) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 6, horizontal: 4),
      child:ListTile(
  leading: PopupMenuButton<String>(
    icon: const Icon(Icons.more_vert),
    onSelected: (value) {
      if (value == 'update') {
        _showUpdateDialog(task);
      } else if (value == 'delete') {
        _confirmDelete(task);
      }
    },
    itemBuilder: (context) => [
      const PopupMenuItem(value: 'update', child: Text('Update')),
      const PopupMenuItem(value: 'delete', child: Text('Delete')),
    ],
  ),
  contentPadding: const EdgeInsets.all(12),
  title: Text(task.title, style: const TextStyle(fontWeight: FontWeight.bold)),
  subtitle: Text(task.description ?? ''),
  trailing: TickingTask(
    isChecked: task.isDone,
    onChanged: (newVal) {
      setState(() {
        task.isDone = newVal;
        if (task.isDone) {
          task.progress.add(ProgressModel(date: DateTime.now(), progress: 1));
        } else {
          task.progress.removeWhere((p) =>
              p.date.day == DateTime.now().day &&
              p.date.month == DateTime.now().month &&
              p.date.year == DateTime.now().year);
        }
        task.save();
      });
    },
  ),
),

    );
  }
}

class TickingTask extends StatelessWidget {
  final bool isChecked;
  final ValueChanged<bool> onChanged;

  const TickingTask({super.key, required this.isChecked, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(!isChecked),
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          color: isChecked ? Colors.green : Colors.indigoAccent,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Icon(
          isChecked ? Icons.check_circle : Icons.radio_button_unchecked,
          color: Colors.white,
        ),
      ),
    );
  }
}
