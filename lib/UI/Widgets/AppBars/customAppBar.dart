import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sj_member_app/UI/Pages/contactSupportPage.dart';
import 'package:sj_member_app/UI/Pages/homeCardPages/wiki_Page.dart';
import 'package:sj_member_app/UI/Pages/loginPage.dart';
import 'package:sj_member_app/core/ViewModels/authentication_Viewmodel.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String appBarName;

  CustomAppBar({
    required this.appBarName,
  });

  final Size preferredSize = Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        '$appBarName',
      ),
      actions: [
        // IconButton(
        //   icon: Icon(Icons.menu_book),
        //   onPressed: () {
        //     Navigator.push(
        //       context,
        //       MaterialPageRoute(
        //         builder: (context) => WikiPage(),
        //       ),
        //     );
        //   },
        // ),
        IconButton(
          icon: Icon(Icons.phone_enabled),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ContactSupportPage(),
              ),
            );
          },
        ),
        IconButton(
            icon: Icon(Icons.logout),
            onPressed: () async {
              final snackBar = SnackBar(content: Text("Logged out"));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
              await Provider.of<AuthenticationViewmodel>(context, listen: false)
                  .logOut();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginPage()));
            })
      ],
    );
  }
}
