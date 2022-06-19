import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sj_member_app/UI/Widgets/AppBars/simpleAppBar.dart';
import 'package:sj_member_app/UI/Widgets/customSearchBar.dart';
import 'package:sj_member_app/UI/Widgets/wikiListTile.dart';

import 'package:sj_member_app/core/ViewModels/wiki_list_Viewmodel.dart';
import 'package:sj_member_app/core/enums/viewState.dart';

class WikiPage extends StatefulWidget {
  const WikiPage({Key? key}) : super(key: key);

  @override
  _WikiPageState createState() => _WikiPageState();
}

class _WikiPageState extends State<WikiPage> {
  bool selected = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: SimpleAppBar(appBarName: 'Wiki'),
      body: ChangeNotifierProvider<WikiListViewModel>(
        create: (context) => WikiListViewModel()..getAllWikiList(),
        child: Consumer<WikiListViewModel>(
          builder: (context, viewmodel, child) => viewmodel.viewState ==
                  ViewState.Busy
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Container(
                  padding: EdgeInsets.fromLTRB(8, 4, 0, 0),
                  child: Column(
                    children: [
                      CustomSearchBar(viewModel: viewmodel),
                      Container(
                        padding: EdgeInsets.only(left: 8),
                        child: Row(
                          children: [
                            GestureDetector(
                              child: Chip(
                                backgroundColor:
                                    viewmodel.wikiChips == WikiChips.All
                                        ? Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.2)
                                        : Colors.grey[300],
                                label: Text(' All '),
                              ),
                              onTap: () {
                                viewmodel.getAllWikiList();
                              },
                            ),
                            SizedBox(width: 6),
                            GestureDetector(
                              child: Chip(
                                backgroundColor:
                                    viewmodel.wikiChips == WikiChips.Service
                                        ? Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.2)
                                        : Colors.grey[300],
                                label: Text('Services'),
                              ),
                              onTap: () {
                                viewmodel.getServiceWikiList();
                              },
                            ),
                            SizedBox(width: 6),
                            GestureDetector(
                              child: Chip(
                                backgroundColor:
                                    viewmodel.wikiChips == WikiChips.Membership
                                        ? Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.2)
                                        : Colors.grey[300],
                                label: Text('Memberships'),
                              ),
                              onTap: () {
                                viewmodel.getmembershipWikiList();
                              },
                            ),
                          ],
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 8),
                        child: Row(
                          children: [
                            GestureDetector(
                              child: Chip(
                                backgroundColor:
                                    viewmodel.wikiChips == WikiChips.Insurance
                                        ? Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.2)
                                        : Colors.grey[300],
                                label: Text('Insurance'),
                              ),
                              onTap: () {
                                viewmodel.getInsuranceWikiList();
                              },
                            ),
                            SizedBox(width: 6),
                            GestureDetector(
                              child: Chip(
                                backgroundColor:
                                    viewmodel.wikiChips == WikiChips.Discount
                                        ? Theme.of(context)
                                            .primaryColor
                                            .withOpacity(0.2)
                                        : Colors.grey[300],
                                label: Text('Discounts'),
                              ),
                              onTap: () {
                                viewmodel.getDiscountWikiList();
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 8),
                      viewmodel.filteredWiki.isEmpty
                          ? Expanded(
                              child: ListView.separated(
                                itemCount: viewmodel.wikiList!.data.length,
                                itemBuilder: (context, index) {
                                  return WikiListTile(
                                    wikiData: viewmodel.wikiList!.data
                                        .elementAt(index),
                                  );
                                },
                                separatorBuilder: (context, index) =>
                                    Divider(thickness: 1),
                              ),
                            )
                          : Expanded(
                              child: ListView.separated(
                                itemCount: viewmodel.filteredWiki.length,
                                itemBuilder: (context, index) {
                                  return WikiListTile(
                                      wikiData: viewmodel.filteredWiki
                                          .elementAt(index));
                                },
                                separatorBuilder: (context, index) =>
                                    Divider(thickness: 1),
                              ),
                            ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
