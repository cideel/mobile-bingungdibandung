import 'package:bingung_di_bandung/controller/autController.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:bingung_di_bandung/controller/commentController.dart';
import 'package:bingung_di_bandung/Model/comment.dart';

class CommentView extends StatelessWidget {
  final String placeId;

  CommentView({required this.placeId});

  @override
  Widget build(BuildContext context) {
    final CommentController commentController = Get.put(CommentController());
    final TextEditingController textController = TextEditingController();

    commentController.fetchComments(placeId);

    return Scaffold(
      appBar: AppBar(
        title: Text('Komentar'),
      ),
      body: Column(
        children: [
          Expanded(
            child: Obx(() {
              if (commentController.comments.isEmpty) {
                return Center(child: Text('Tidak ada komentar'));
              } else {
                return ListView.builder(
                  itemCount: commentController.comments.length,
                  itemBuilder: (context, index) {
                    final comment = commentController.comments[index];
                    return ListTile(
                      leading: comment.userPhotoUrl.isNotEmpty
                          ? CircleAvatar(
                              backgroundImage: NetworkImage(comment.userPhotoUrl),
                              onBackgroundImageError: (_, __) => Icon(Icons.account_circle),
                            )
                          : CircleAvatar(
                              child: Icon(Icons.account_circle),
                            ),
                      title: Text(comment.userName),
                      subtitle: Text(comment.text),
                      
                    );
                  },
                );
              }
            }),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textController,
                    decoration: InputDecoration(
                      labelText: 'Tambah Komentar',
                    ),
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.send),
                  onPressed: () {
                    final commentText = textController.text.trim();
                    if (commentText.isNotEmpty) {
                      User? user = FirebaseAuth.instance.currentUser;
                      if (user != null) {
                        commentController.addComment(placeId, commentText);
                        textController.clear();
                      }
                    }
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
