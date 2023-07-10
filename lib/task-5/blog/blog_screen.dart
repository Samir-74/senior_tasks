import 'package:flutter/material.dart';
// import 'package:senior_tasks/task-5/blog/story_view.dart';

import 'add_blog_screen.dart';
import 'blog.dart';
import 'edit-blog-screen.dart';

class BlogScreen extends StatefulWidget {
  const BlogScreen({super.key});

  @override
  State<BlogScreen> createState() => _BlogScreenState();
}

class _BlogScreenState extends State<BlogScreen> {
  final String name = "Samir Mohamed";
  List<Blog> blogs = [
    Blog(
      title: "Piano",
      content:
          "a large keyboard musical instrument with a wooden case enclosing a soundboard and metal strings, which are struck by hammers when the keys are depressed. The strings' vibration is stopped by dampers when the keys are released and can be regulated for length and volume by two or three pedals.",
      imageUrl:
          "https://cdn1.img.sputnikarabic.ae/img/104012/71/1040127161_0:171:4032:2439_600x0_80_0_0_bf877107b21a7dab90c7ce76c503464d.jpg",
    ), // 0
    Blog(
      title: "Titanic submarine",
      content:
          "Missing Titanic submarine LIVE: Can bodies be retrieved after implosion? Experts weigh in",
      imageUrl:
          "https://phantom-marca.unidadeditorial.es/e78616bbda77fe6fbc6b1ed5a05d3232/resize/828/f/webp/assets/multimedia/imagenes/2023/06/21/16873550466244.png",
    ), // 1
    Blog(
      title: "Customization Cars",
      content:
          "Two Customized Cars Rolling Through A City Street Photo Photo of two customized cars on a city side street. One car is raised up and the other is very low.",
      imageUrl:
          "https://burst.shopifycdn.com/photos/two-customized-cars-rolling-through-a-city-street.jpg",
    ), // 2
    Blog(
      title: "Honda Civic 90s",
      content:
          "Most of the Civics feature Honda's VTEC system. It allows the engine to have dynamic inlet and outlet valve timing to increase efficiency during low RPMs and increase power in high RPMs. Although the engines of these cars are not precisely race-spec, they are sufficient enough to provide a fun driving experience. Yet, more importantly, it is more likely that a Civic engine will get tuned, and their ability to handle extra power is awe-inspiring.",
      imageUrl:
          "https://static1.hotcarsimages.com/wordpress/wp-content/uploads/2021/05/honda-civic.jpg",
    ), // 3
    Blog(
      title: "Honda Civic Mugen rr ",
      content:
          "Here’s something you don’t see up for sale in the UK all that often – a JDM-only FD2 Honda Civic Type R. What a shame we got lumped with the little-bit-lardy FN2 instead. But hang on, this isn’t even your standard FD2... this is the properly hardcore Mugen RR.",
      imageUrl:
          "https://www.topgear.com/sites/default/files/images/news-article/2021/06/151d970e8d571f9c85ed219fc32498e2/210521_mugen_rr_dsc05793aa.jpg",
    ), // 3
    Blog(
      title: "Honda Civic Type r ",
      content:
          "Honda's added a few subtle tweaks to the Civic Type R, promising a car that's better both on the road and the track.",
      imageUrl:
          "https://www.cnet.com/a/img/resize/ce07ee85916db6535bf063efe83dd1f237c516d4/hub/2020/02/06/ef83faee-df74-4605-9a36-62bb414acbfa/civic-ogi.jpg?auto=webp&fit=crop&height=675&width=1200",
    ), // 4
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Blog'),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          navigateToAddBlogScreen();
        },
        backgroundColor: blogs.length < 2 ? Colors.blueGrey : Colors.white,
        child: Icon(
          Icons.add,
          color: blogs.length < 2 ? Colors.white : Colors.blueGrey,
        ),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 100.0,
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                return InkWell(
                  // onTap: () => navigateToStoryViewScreen(),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Stack(
                          alignment: Alignment.bottomRight,
                          children: const [
                            CircleAvatar(
                              backgroundImage: NetworkImage(
                                  'https://blog.logrocket.com/wp-content/uploads/2021/05/intro-dart-flutter-feature.png'),
                              backgroundColor: Colors.indigo,
                              radius: 30.0,
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 8,
                            ),
                            CircleAvatar(
                              backgroundColor: Colors.green,
                              radius: 7,
                            ),
                          ],
                        ),
                        Text(name.length > 7 ? name.substring(0, 8) : name),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: blogs.length,
              itemBuilder: (context, index) {
                return blogItems(index);
              },
            ),
          )
        ],
      ),
    );
  }

  blogItems(index) {
    final blog = blogs[index];
    return Container(
      margin: const EdgeInsets.all(15),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25), color: Colors.blueGrey),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(25),
              topRight: Radius.circular(25),
            ),
            child: Image.network(
              blog.imageUrl,
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Row(
              children: [
                Expanded(
                  child: Text(
                    blog.title,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {
                    return navigateToEditBlogScreen(index);
                  },
                  icon: const Icon(
                    Icons.edit,
                    color: Colors.white,
                  ),
                ),
                IconButton(
                  onPressed: () {
                    blogs.removeAt(index);
                    setState(() {});
                  },
                  icon: const Icon(
                    Icons.delete,
                    color: Colors.red,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              blog.content,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      ),
    );
  }

  void navigateToAddBlogScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const AddBlogScreen(),
      ),
    ).then((value) {
      if (value == null) return;
      blogs.add(value);
      setState(() {});
    });
  }

  // void navigateToStoryViewScreen() {
  //   Navigator.push(
  //     context,
  //     MaterialPageRoute(
  //       builder: (context) => const StoryViewScreen(),
  //     ),
  //   );
  // }

  void navigateToEditBlogScreen(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => EditBlogScreen(
          title: blogs[index].title,
          content: blogs[index].content,
          imageUrl: blogs[index].imageUrl,
        ),
      ),
    ).then((value) {
      if (value == null) return;
      // blogs.add(value);
      blogs[index]=value;
      setState(() {});
    });
  }
}
