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
        drawer: Drawer(
          child: Column(
            children: [
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
        appBar: AppBar(title: Text("Learning Flutter")),
        body: Column(
          children: [
            Image.network(
              "https://www.shutterstock.com/image-photo/sun-sets-behind-mountain-ranges-600nw-2479236003.jpg",
            ),
          ],
        ),
      ),
    );
  }
}
