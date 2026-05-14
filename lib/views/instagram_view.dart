import 'package:flutter/material.dart';

class InstagramView extends StatefulWidget {
  const InstagramView({super.key});

  @override
  State<InstagramView> createState() => _InstagramViewState();
}

class _InstagramViewState extends State<InstagramView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,

        title: const Text(
          "Instagram",
          style: TextStyle(
            color: Colors.red,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
        ),

        leading: const Icon(Icons.camera_alt_outlined, color: Colors.black),

        actions: const [
          Icon(Icons.favorite_border, color: Colors.black),
          SizedBox(width: 15),
          Icon(Icons.send, color: Colors.black),
          SizedBox(width: 10),
        ],
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
            // STORIES SECTION
            SizedBox(
              height: 110,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  StoryItem(name: "Rajan"),
                  StoryItem(name: "Alex"),
                  StoryItem(name: "John"),
                  StoryItem(name: "Messi"),
                  StoryItem(name: "Neymar"),
                ],
              ),
            ),

            const Divider(),

            // POST HEADER
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                children: [
                  const CircleAvatar(
                    radius: 20,
                    backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_Wd05XDgKGEiSzqvRHcbjbk3je6kdsr0CDw&s",
                    ),
                  ),

                  const SizedBox(width: 10),

                  const Text(
                    "routineofnepalbanda",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  const Spacer(),

                  const Icon(Icons.more_horiz),
                ],
              ),
            ),

            const SizedBox(height: 10),

            // POST IMAGE
            Image.network(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgWbCOS6wR_TmPteom8dBVvJPde17AjWvx3g&s",
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            // POST ACTIONS
            PostItem(
              userName: "routineofnepalbanda",
              userImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT_Wd05XDgKGEiSzqvRHcbjbk3je6kdsr0CDw&s",
              postImage:
                  "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQgWbCOS6wR_TmPteom8dBVvJPde17AjWvx3g&s",
            ),

            PostItem(
              userName: "Alex",
              userImage: "https://i.pravatar.cc/150?img=3",
              postImage: "https://picsum.photos/400/400?1",
            ),

            PostItem(
              userName: "John",
              userImage: "https://i.pravatar.cc/150?img=5",
              postImage: "https://picsum.photos/400/400?2",
            ),
            // LIKES
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Liked by Rajan and 1,000 others",
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
            const SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}

// STORY WIDGET
class StoryItem extends StatelessWidget {
  final String name;

  const StoryItem({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          CircleAvatar(
            radius: 30,
            backgroundImage: const NetworkImage(
              "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOCCbN-_c_uMJVbuxqNFOnmEIVNugjQxIJQpM1cjAZvx_az0N02Tffo6DKUBE8rQZBHI_2zw&s",
            ),
          ),

          const SizedBox(height: 5),

          Text(name),
        ],
      ),
    );
  }
}

class PostItem extends StatelessWidget {
  final String userName;
  final String userImage;
  final String postImage;

  const PostItem({
    super.key,
    required this.userName,
    required this.userImage,
    required this.postImage,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // HEADER
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: NetworkImage(userImage),
              ),

              const SizedBox(width: 10),

              Text(
                userName,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),

              const Spacer(),

              const Icon(Icons.more_horiz),
            ],
          ),
        ),

        const SizedBox(height: 10),

        // POST IMAGE
        Image.network(postImage, width: double.infinity, fit: BoxFit.cover),

        // ACTIONS
        Padding(
          padding: const EdgeInsets.all(10),
          child: Row(
            children: const [
              Icon(Icons.favorite_border, size: 28),

              SizedBox(width: 15),

              Icon(Icons.chat_bubble_outline, size: 28),

              SizedBox(width: 15),

              Icon(Icons.send, size: 28),

              Spacer(),

              Icon(Icons.bookmark_border, size: 28),
            ],
          ),
        ),

        // LIKES
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 12),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Liked by Rajan and 1,000 others",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
        ),

        const SizedBox(height: 20),
      ],
    );
  }
}
