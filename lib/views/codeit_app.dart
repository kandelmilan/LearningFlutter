import 'package:flutter/material.dart';

class CodeitApp extends StatefulWidget {
  const CodeitApp({super.key});

  @override
  State<CodeitApp> createState() => _CodeitAppState();
}

class _CodeitAppState extends State<CodeitApp> {
  bool isBiometric = true;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        drawer: Drawer(
          backgroundColor: const Color.fromARGB(255, 255, 153, 0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20),
                  child: Title(
                    color: Colors.black,
                    child: Text(
                      "<> CODE IT",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                ListTile(
                  title: Text(
                    "Dashboard",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  leading: Icon(Icons.dashboard, color: Colors.white),
                ),
                ListTile(
                  title: Text(
                    "My Courses",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  leading: Icon(Icons.menu_book, color: Colors.white),
                ),
                ListTile(
                  title: Text(
                    "Certificates",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  leading: Icon(Icons.workspace_premium, color: Colors.white),
                ),
                ListTile(
                  title: Text(
                    "Payment Receipts",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  leading: Icon(Icons.receipt_long, color: Colors.white),
                ),
                Divider(),
                ListTile(
                  title: Text(
                    "Terms & Conditions",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  leading: Icon(Icons.description, color: Colors.white),
                ),
                ListTile(
                  title: Text(
                    "Change Password",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  leading: Icon(Icons.lock, color: Colors.white),
                ),
                ListTile(
                  title: Text(
                    "Delete Account",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  leading: Icon(Icons.delete, color: Colors.white),
                ),
                Container(
                  color: Colors.white,
                  child: SwitchListTile(
                    value: isBiometric,

                    onChanged: (value) {
                      setState(() {
                        isBiometric = value;
                      });
                    },

                    secondary: Icon(Icons.fingerprint, color: Colors.white),

                    title: Text(
                      "Enable Biometric",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      ),
                    ),

                    activeColor: Colors.white,
                    activeTrackColor: Colors.brown,
                  ),
                ),
                Spacer(),
                Divider(),
                ListTile(
                  title: Text(
                    "Logout",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  leading: Icon(Icons.logout, color: Colors.white),
                ),
              ],
            ),
          ),
        ),
        appBar: AppBar(
          title: Text("Code IT"),
          actions: [
            Center(
              child: Text(
                "Version (4.0.8)",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500),
              ),
            ),
          ],
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              title: Text("Welcome back , Rajan !"),
              subtitle: Text("Access your course,progress and achievments"),
            )
          ],
        ),
      ),
    );
  }
}
