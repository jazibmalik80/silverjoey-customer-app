import 'package:flutter/material.dart';
import 'package:sj_member_app/UI/Pages/contactSupportPage.dart';
import 'package:sj_member_app/UI/UTILS/utils.dart';
import 'package:sj_member_app/core/Models/wikis/wiki_list_model.dart';
import 'package:url_launcher/url_launcher.dart';

class WikiPlanDetails extends StatefulWidget {
  final WikiData wikiData;

  const WikiPlanDetails({
    required this.wikiData,
  });

  @override
  _WikiPlanDetailsState createState() => _WikiPlanDetailsState();
}

class _WikiPlanDetailsState extends State<WikiPlanDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.wikiData.title.toString(),
          style: TextStyle(
            fontSize: 16,
            letterSpacing: 0.15,
          ),
        ),
        actions: [
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
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.wikiData.title.toString(),
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 8),
              Container(
                child: Text(
                  widget.wikiData.content.toString(),
                ),
              ),
              SizedBox(height: 16),
              Text(
                'Footnotes',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 8),
              Container(
                child: Text(
                  widget.wikiData.footnotes.toString() == "null"
                      ? "No footnotes added for this announcement"
                      : widget.wikiData.footnotes.toString(),
                ),
              ),
              SizedBox(height: 16),
              TextButton(
                child: Text(
                  'APPLY FOR THIS PLAN',
                  style: TextStyle(
                    color: primaryColor,
                  ),
                ),
                onPressed: () {
                  try {
                    _launchURL(
                        "http://beta.afms.com.ph/app/equity-sharing-form");
                  } catch (e) {
                    final snackBar = SnackBar(
                        content: Text(
                            'Your phone unfortunately does not support opening URLs'));
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
              ),
              SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }

  void _launchURL(String url) async {
    if (!await launch(url)) throw 'Could not launch $url';
  }
}
