import 'package:flutter/material.dart';
import 'package:sj_member_app/UI/Pages/planDetailPages/wikiPlanDetails.dart';
import 'package:sj_member_app/core/Models/wikis/wiki_list_model.dart';

class WikiListTile extends StatelessWidget {
  final WikiData wikiData;

  const WikiListTile({
    required this.wikiData,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text('${wikiData.title}'),
      subtitle: Text(
        '${wikiData.content}',
      ),
      isThreeLine: true,
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => WikiPlanDetails(wikiData: wikiData),
          ),
        );
      },
    );
  }
}
