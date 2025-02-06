import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../componenets/task_model.dart';

class HomeController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  void onInit() {
    super.onInit();
    fetchTasks();
    // ever(tasks, (_) => filterTasks(filter as String)); // Update filteredTasks whenever tasks change
  }

  var filter = 'all'.obs;
  var tasks = <Task>[].obs;
  var filteredTasks = <Task>[].obs;

  void fetchTasks() async {
    User? user = _auth.currentUser;
    if (user == null) return;

    try {
      final QuerySnapshot taskSnapshot = await _firestore
          .collection('users')
          .doc(user.uid)
          .collection("tasks")
          .get();

      tasks.assignAll(taskSnapshot.docs.map((doc) {
        final data = doc.data() as Map<String, dynamic>;
        return Task(
          image: data['image'],
          priority: data['priority'],
          title: data['title'],
          description: data['description'],
          timestamp: (data['timestamp'] as Timestamp?)?.toDate() ?? DateTime.now(),
        );
      }).toList());
    } catch (e) {
      print("Error fetching tasks: $e");
    }
  }

  void addTask(Task task) async {
    User? user = _auth.currentUser;
    if (user == null) return;

    try {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection("tasks")
          .doc(task.title)
          .set({
        'title': task.title,
        'description': task.description,
        'priority': task.priority,
        'timeStamp': Timestamp.fromDate(task.timestamp),
      });

      tasks.add(task);
    } catch (e) {
      print("Error adding task: $e");
    }
  }

  void filterTasks(String newFilter) {
    filter.value = newFilter;

    if (newFilter == 'all') {
      filteredTasks.assignAll(tasks);
    } else if (newFilter == 'in progress') {
      filteredTasks.assignAll(tasks.where((item) => item.priority?.toLowerCase() == 'in progress').toList());
    } else if (newFilter == 'waiting') {
      filteredTasks.assignAll(tasks.where((item) => item.priority?.toLowerCase() == 'waiting').toList());
    }
  }

  void deleteTask(Task task) async {
    User? user = _auth.currentUser;
    if (user == null) return;

    try {
      await _firestore
          .collection('users')
          .doc(user.uid)
          .collection("tasks")
          .doc(task.title)
          .delete();

      tasks.remove(task);
    } catch (e) {
      print("Error deleting task: $e");
    }
  }
}