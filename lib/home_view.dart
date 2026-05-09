import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.amber,
        // drawer: Drawer(
        //   child: Column(
        //     children: [
        //       ListTile(leading: Icon(Icons.home), title: Text("Home")),
        //       ListTile(leading: Icon(Icons.access_alarm), title: Text("About")),
        //       ListTile(leading: Icon(Icons.settings), title: Text("Services")),
        //       ListTile(
        //         leading: Icon(Icons.contact_emergency_outlined),
        //         title: Text("Contact"),
        //       ),
        //       Divider(),
        //       ListTile(leading: Icon(Icons.logout), title: Text("Logout")),
        //     ],
        //   ),
        // ),
        drawer: Drawer(
          child: ListView(
            children: [
              UserAccountsDrawerHeader(
                accountName: Text("Rajan"),
                accountEmail: Text("rajan@gmail.com"),
                currentAccountPicture: CircleAvatar(child: Icon(Icons.person)),
              ),
              ListTile(leading: Icon(Icons.home), title: Text("Home")),
              ListTile(leading: Icon(Icons.access_alarm), title: Text("About")),
              ListTile(leading: Icon(Icons.settings), title: Text("Services")),
              ListTile(
                leading: Icon(Icons.contact_emergency_outlined),
                title: Text("Contact"),
              ),
              Divider(),
              ListTile(leading: Icon(Icons.logout), title: Text("Logout")),
            ],
          ),
        ),
        appBar: AppBar(
          title: Text(
            "Food Menu",
            style: TextStyle(
              // color: Colors.white,
              fontSize: 34,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: false,
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Choose Food ",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [Icon(Icons.fastfood, size: 50), Text("Burger")],
                  ),
                  Column(
                    children: [
                      Icon(Icons.local_pizza, size: 50),
                      Text("Pizza"),
                    ],
                  ),
                  Column(
                    children: [
                      Icon(Icons.icecream, size: 50),
                      Text("Ice-cream"),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
