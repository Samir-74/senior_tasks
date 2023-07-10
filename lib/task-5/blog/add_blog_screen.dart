import 'package:flutter/material.dart';

import 'blog.dart';

class AddBlogScreen extends StatefulWidget {
  const AddBlogScreen({super.key});

  @override
  State<AddBlogScreen> createState() => _AddBlogScreenState();
}

class _AddBlogScreenState extends State<AddBlogScreen> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final imageUrlController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Add Screen',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextFormField(
              controller: titleController,
              decoration: InputDecoration(
                label: Text(
                  'Title',
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15,),
            TextFormField(
              controller: contentController,
              decoration: InputDecoration(
                label: Text(
                  'Content',
                ),
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 15,),

            TextFormField(
              controller: imageUrlController,
              decoration: InputDecoration(
                label: Text(
                  'ImageUrl',
                ),
                border: OutlineInputBorder(),
              ),
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 20.0),
              child: ElevatedButton(
                onPressed: ()
                {
                  addNewNote();
                },
                child: Text(
                  'Update',
                ),
                style: ElevatedButton.styleFrom(shape:StadiumBorder() ),
              ),
            )
          ],
        ),
      ),
    );
  }

  void addNewNote() {
    String title = titleController.text;
    String content = contentController.text;
    String imageUrl = imageUrlController.text;
    final blog =Blog(title: title, content: content, imageUrl: imageUrl,);
    Navigator.pop(context,blog);
  }
}


