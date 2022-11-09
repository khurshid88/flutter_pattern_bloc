import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';

import '../bloc/create_post_cubit.dart';
import '../model/post_model.dart';

Widget viewOfCreate(bool isLoading, BuildContext context,
    TextEditingController titleController,
    TextEditingController bodyController) {
  return Container(
    padding: const EdgeInsets.all(30),
    child: Stack(
      children: [
        Column(
          children: [
            TextField(
              controller: titleController,
              decoration: InputDecoration(
                  hintText: "Title", hintStyle: TextStyle(color: Colors.grey)),
            ),
            TextField(
              controller: bodyController,
              decoration: InputDecoration(
                  hintText: "Body", hintStyle: TextStyle(color: Colors.grey)),
            ),
            SizedBox(
              height: 10,
            ),
            MaterialButton(
              onPressed: () {
                String title = titleController.text.toString();
                String body = bodyController.text.toString();
                Post post = Post(title: title,body: body,userId: 1);
                BlocProvider.of<CreatePostCubit>(context).apiPostCreate(post);
              },
              color: Colors.blue,
              child: Text(
                "Create a Post",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ],
        ),
        isLoading
            ? Center(
          child: CircularProgressIndicator(),
        )
            : SizedBox.shrink(),
      ],
    ),
  );
}