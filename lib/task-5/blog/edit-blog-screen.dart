import 'package:flutter/material.dart';

import 'blog.dart';

class EditBlogScreen extends StatefulWidget {
   EditBlogScreen({super.key, required this.title, required this.content, required this.imageUrl});

   final String title;
   final String content;
   final String imageUrl;

  @override
  State<EditBlogScreen> createState() => _EditBlogScreenState();
}

class _EditBlogScreenState extends State<EditBlogScreen> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final imageUrlController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    titleController.text=widget.title;
    contentController.text=widget.content;
    imageUrlController.text=widget.imageUrl;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Edit Screen',
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
                  editBlog();
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

  void editBlog() {
    String title = titleController.text;
    String content = contentController.text;
    String imageUrl = imageUrlController.text;
    final blog =Blog(title: title, content: content, imageUrl: imageUrl,);
    Navigator.pop(context,blog);
  }
}


