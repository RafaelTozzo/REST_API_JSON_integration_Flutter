import 'package:flutter/cupertino.dart';
import 'package:listview_builder/src/models/todo_model.dart';
import 'package:listview_builder/src/repositories/todo_repository.dart';

class HomeController {
  List<TodoModel> todos = [];
  late TodoRepository _repository;
  final state = ValueNotifier<HomeState>(HomeState.start);

  HomeController([TodoRepository? repository]) {
    _repository = repository ?? TodoRepository();
  }

  Future start() async {
    state.value = HomeState.loading;
    try {
      todos = await _repository.fetchTodos();
      state.value = HomeState.success;
    } catch (e) {
      state.value = HomeState.error;
    }
  }
}

enum HomeState { start, loading, success, error }
