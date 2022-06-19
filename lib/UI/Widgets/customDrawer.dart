import 'package:flutter/material.dart';
import 'package:sj_member_app/UI/UTILS/utils.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 287,
      child: Drawer(
        child: Column(
          children: [
            DrawerHeader(
              margin: EdgeInsets.all(0.0),
              padding: EdgeInsets.all(0.0),
              child: UserAccountsDrawerHeader(
                margin: EdgeInsets.all(0.0),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                currentAccountPicture: CircleAvatar(
                  backgroundColor: primaryColor,
                  child: Image(
                    image: AssetImage(
                      "Assets/AFMS_Logo.png",
                    ),
                  ),
                ),
                accountName: Text(
                  'Gunnar Anderson',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                  ),
                ),
                accountEmail: Text(
                  'katlyn58@yahoo.com',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(
                Icons.calculate_outlined,
                color: Colors.black,
              ),
              title: Text(
                'Make a Payment',
                style: TextStyle(
                  color: Colors.grey[600],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
