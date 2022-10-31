import 'package:flutter/material.dart';
import 'package:pattern_bloc/views/item_of_home.dart';

import '../model/post_model.dart';

Widget viewOfHome(List<Post> items, bool isLoading) {
  return Stack(
    children: [
      ListView.builder(
        itemCount: items.length,
        itemBuilder: (ctx, index) {
          return itemOfPost(ctx, items[index]);
        },
      ),
      isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : const SizedBox.shrink(),
    ],
  );
}
