import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/list_post_cubit.dart';
import '../bloc/list_post_state.dart';
import '../model/post_model.dart';
import '../views/item_of_home.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //List<Post> items = [];

  @override
  void initState() {
    super.initState();
    BlocProvider.of<ListPostCubit>(context).apiPostList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("BloC"),
        ),
        body: BlocBuilder<ListPostCubit, ListPostState>(
          builder: (BuildContext context, ListPostState state) {
            if (state is ListPostError) {
              return viewOfError(state.error);
            }

            if (state is ListPostLoaded) {
              var items = state.posts!;
              return viewOfPostList(items);
            }

            return viewOfLoading();
          },
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          foregroundColor: Colors.white,
          onPressed: () {
            BlocProvider.of<ListPostCubit>(context).callCreatePage(context);
          },
          child: const Icon(Icons.add),
        ));
  }

  Widget viewOfError(String err) {
    return Center(
      child: Text("Error occurred $err"),
    );
  }

  Widget viewOfLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget viewOfPostList(List<Post> items) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (ctx, index) {
        return itemOfPost(ctx, items[index]);
      },
    );
  }
}
