import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'DiplomaScreen.dart';
import 'availability_screen.dart';
import 'edit_profile_screen.dart';
import 'portfolio_screen.dart';


class AccountScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Account"),
      ),
      body: ListView(
        shrinkWrap: true,
        children: [
          ListTile(
            leading: Icon(Icons.person),
            title: Text(''),
            subtitle: Text('View my profile'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => EditCraftsmanScreen()),
              );
            },
          ),
          Divider(),
          ListTile(
            leading: Icon(Icons.work),
            title: Text('Portfolio'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => PortfolioScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.school),
            title: Text('Diploma'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => DiplomaScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.schedule),
            title: Text('Availability'),
            trailing: Icon(Icons.arrow_forward),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => AvailabilityScreen()),
              );
            },
          ),
          ListTile(
            leading: Icon(Icons.logout),
            title: Text('Log out'),
            onTap: () {
              FirebaseAuth.instance.signOut();
            },
          ),
        ],
      ),
    );
  }
}
