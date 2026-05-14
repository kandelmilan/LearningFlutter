import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    // return SafeArea(
    //   child: Scaffold(
    //     backgroundColor: Colors.amber,
    //     drawer: Drawer(
    //       child: ListView(
    //         children: [
    //           UserAccountsDrawerHeader(
    //             accountName: Text("Rajan"),
    //             accountEmail: Text("rajan@gmail.com"),
    //             currentAccountPicture: CircleAvatar(child: Icon(Icons.person)),
    //           ),
    //           ListTile(leading: Icon(Icons.home), title: Text("Home")),
    //           ListTile(leading: Icon(Icons.access_alarm), title: Text("About")),
    //           ListTile(leading: Icon(Icons.settings), title: Text("Services")),
    //           ListTile(
    //             leading: Icon(Icons.contact_emergency_outlined),
    //             title: Text("Contact"),
    //           ),
    //           Divider(),
    //           ListTile(leading: Icon(Icons.logout), title: Text("Logout")),
    //         ],
    //       ),
    //     ),
    //     appBar: AppBar(
    //       title: Text(
    //         "Food Menu",
    //         style: TextStyle(
    //           // color: Colors.white,
    //           fontSize: 34,
    //           fontWeight: FontWeight.bold,
    //         ),
    //       ),
    //       centerTitle: false,
    //     ),
    //     body: Center(
    //       child: Column(
    //         mainAxisAlignment: MainAxisAlignment.center,
    //         children: [
    //           Padding(
    //             padding: const EdgeInsets.all(8.0),
    //             child: Text(
    //               "Choose Food ",
    //               style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
    //             ),
    //           ),
    //           Row(
    //             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    //             children: [
    //               Column(
    //                 children: [Icon(Icons.fastfood, size: 50), Text("Burger")],
    //               ),
    //               Column(
    //                 children: [
    //                   Icon(Icons.local_pizza, size: 50),
    //                   Text("Pizza"),
    //                 ],
    //               ),
    //               Column(
    //                 children: [
    //                   Icon(Icons.icecream, size: 50),
    //                   Text("Ice-cream"),
    //                 ],
    //               ),
    //             ],
    //           ),
    //         ],
    //       ),
    //     ),
    //   ),
    // );
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),

        title: Text(
          "Username",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),

        centerTitle: false,

        actions: [
          Icon(Icons.notifications_none),
          SizedBox(width: 15),
          Icon(Icons.more_vert),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: CircleAvatar(
                  radius: 20,
                  backgroundImage: NetworkImage(
                    "https://images.ctfassets.net/h6goo9gw1hh6/2sNZtFAWOdP1lmQ33VwRN3/24e953b920a9cd0ff2e1d587742a2472/1-intro-photo-final.jpg?w=1200&h=992&fl=progressive&q=70&fm=jpg",
                  ),
                ),
              ),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          "0",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text("Posts"),
                      ],
                    ),
                    Column(
                      children: [
                        Text(
                          "0",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text("Followers"),
                      ],
                    ),

                    Column(
                      children: [
                        Text(
                          "0",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                          ),
                        ),
                        Text("Following"),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
