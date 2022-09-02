import 'package:dio/dio.dart';
import 'package:listview_builder/src/models/todo_model.dart';

class TodoRepository {
  late Dio dio;
  var url = Uri.parse('https://jsonplaceholder.typicode.com/todos');

  TodoRepository([Dio? client]) {
    dio = client ?? Dio();
  }

  Future<List<TodoModel>> fetchTodos() async {
    final response = await dio.get(url.toString());
    final list = response.data as List;
    return list.map((json) => TodoModel.fromJson(json)).toList();
  }
}
