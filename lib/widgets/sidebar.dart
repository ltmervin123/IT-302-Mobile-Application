import 'package:flutter/material.dart';
import 'package:my_app/pages/dashboard.dart';
import 'package:my_app/pages/setting.dart';

class Sidebar extends StatelessWidget {
  const Sidebar({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: [
        DrawerHeader(
          decoration: BoxDecoration(color: Colors.blue),
          child: Text(
            "Menu",
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
        ),
        ListTile(
            leading: Icon(Icons.dashboard),
            title: Text("Dashboard"),
            onTap: () => Navigator.pushNamed(context, "/dashboard")),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text("Settings"),
          onTap: () => Navigator.pushNamed(context, "/setting"),
        ),
        ListTile(
          leading: Icon(Icons.calculate),
          title: Text("Calculator"),
          onTap: () => Navigator.pushNamed(context, "/calculator"),
        )
      ],
    ));
  }
}
