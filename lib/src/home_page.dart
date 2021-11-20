import 'package:flutter/material.dart';
import 'package:listview_builder/src/controllers/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  success() {
    return ListView.builder(
      itemCount: controller.todos.length,
      itemBuilder: (context, index) {
        var todo = controller.todos[index];
        return ListTile(
          title: Text(todo.title.toString()),
        );
      },
    );
  }

  error() {
    return Center(
      child: ElevatedButton(
        onPressed: () {
          controller.start();
        },
        child: const Text('Try again!'),
      ),
    );
  }

  loading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  start() {
    return Container();
  }

  stateManagement(HomeState state) {
    switch (state) {
      case HomeState.start:
        return start();
      case HomeState.loading:
        return loading();
      case HomeState.error:
        return error();
      case HomeState.success:
        return success();
      default:
        return start();
    }
  }

  @override
  void initState() {
    super.initState();

    controller.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('List Todo\'s'),
        actions: [
          IconButton(
              onPressed: () {
                controller.start();
              },
              icon: Icon(Icons.refresh_outlined))
        ],
      ),
      body: AnimatedBuilder(
        animation: controller.state,
        builder: (context, child) {
          return stateManagement(controller.state.value);
        },
      ),
    );
  }
}
