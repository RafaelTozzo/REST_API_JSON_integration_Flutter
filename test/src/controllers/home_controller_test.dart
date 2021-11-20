// @dart=2.9
// import 'package:flutter_test/flutter_test.dart';
// import 'package:listview_builder/src/controllers/home_controller.dart';
// import 'package:listview_builder/src/repositories/todo_repository.dart';
// import 'package:mockito/mockito.dart';

// class TodoRepositoryMock extends Mock implements TodoRepository {}

// main() {
//   final repository = TodoRepositoryMock();
//   final controller = HomeController(repository);

//   test('Must fill in error state if request fails', () async {
//     when(repository.fetchTodos()).thenThrow(Exception());
//     expect(controller.state, HomeState.start);
//     await controller.start();
//     expect(controller.state, HomeState.error);
//     expect(controller.todos.isNotEmpty, true);
//   });
// }
