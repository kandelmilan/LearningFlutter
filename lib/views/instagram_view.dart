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
        title: Text(
          "Instagram",
          style: TextStyle(
            fontSize: 32,
            fontWeight: FontWeight.bold,
            letterSpacing: 1,
          ),
        ),

        leading: Icon(Icons.camera_alt_outlined),
        actions: [Icon(Icons.favorite_border), SizedBox(width: 15)],
      ),
      // body:
      // Column(
      //   children: [
      //     Row(
      //       children: [
      //         CircleAvatar(
      //           radius: 30,
      //           backgroundImage: NetworkImage(
      //             "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOCCbN-_c_uMJVbuxqNFOnmEIVNugjQxIJQpM1cjAZvx_az0N02Tffo6DKUBE8rQZBHI_2zw&s",
      //           ),
      //         ),
      //       ],
      //       //for the circular
      //     ),
      //   ],
      // ),
      body: SizedBox(
        height: 100,
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOCCbN-_c_uMJVbuxqNFOnmEIVNugjQxIJQpM1cjAZvx_az0N02Tffo6DKUBE8rQZBHI_2zw&s",
                    ),
                  ),
                  SizedBox(height: 5),
                  Text("Rajan"),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOCCbN-_c_uMJVbuxqNFOnmEIVNugjQxIJQpM1cjAZvx_az0N02Tffo6DKUBE8rQZBHI_2zw&s",
                    ),
                  ),
                  SizedBox(height: 5),
                  Text("Alex"),
                ],
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 8),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(
                      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSOCCbN-_c_uMJVbuxqNFOnmEIVNugjQxIJQpM1cjAZvx_az0N02Tffo6DKUBE8rQZBHI_2zw&s",
                    ),
                  ),
                  SizedBox(height: 5),
                  Text("John"),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
