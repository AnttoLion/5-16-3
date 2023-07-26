import 'package:accordion/accordion.dart';
import 'package:extra_staff/utils/ab.dart';
import 'package:extra_staff/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../utils/theme.dart';

class V2ProfilePaymentsPayeHistoryView extends StatefulWidget {
  const V2ProfilePaymentsPayeHistoryView({Key? key}) : super(key: key);

  @override
  _V2ProfilePaymentsPayeHistoryViewState createState() =>
      _V2ProfilePaymentsPayeHistoryViewState();
}

class _V2ProfilePaymentsPayeHistoryViewState
    extends State<V2ProfilePaymentsPayeHistoryView> {
  MyThemeColors get myThemeColors =>
      Theme.of(context).extension<MyThemeColors>()!;
  bool isLoading = false;
  int _selectedIndex = 2;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    abV2GotoBottomNavigation(index, 2);
  }

  Widget getContent() {
    final List<String> yearList = [
      "2023",
      "2022",
      "2021",
      "2020",
      "2019",
      "2018",
      "2017"
    ];
    List<AccordionSection> accordionItems = yearList
        .map((item) => AccordionSection(
              isOpen: true,
              header: Text(
                item,
                style: MyFonts.bold(14),
                textAlign: TextAlign.center,
              ),
              content: Container(
                  width: double.infinity,
                  height: 200,
                  child: ListView(
                    children: ListTile.divideTiles(
                        //          <-- ListTile.divideTiles
                        context: context,
                        tiles: [
                          ListTile(
                            title: Text('Week 1'),
                            onTap: () => {print('Week 1')},
                          ),
                          ListTile(
                            title: Text('Week 2'),
                            onTap: () => {print('Week 2')},
                          ),
                          ListTile(
                            title: Text('Week 3'),
                            onTap: () => {print('Week 3')},
                          ),
                          ListTile(
                            title: Text('Week 4'),
                            onTap: () => {print('Week 4')},
                          ),
                        ]).toList(),
                  )
                  // ListView.builder(
                  //   itemCount: 4,
                  //   itemBuilder: (BuildContext context, int index) {
                  //     return ListTile(
                  //       title: Text('Item ${index + 1}'),
                  //       tileColor: Colors.blue,
                  //       onTap: () {
                  //         setState(() {
                  //           print(index);
                  //         });
                  //       },
                  //       style:ListTileStyle.list
                  //     );
                  //   },
                  // )
                  ),
              // ListView(
              //   children: [
              // Text("Week 1"),
              // Text('Week 2'),
              // Text('Week 3'),
              // Text('Week 4'),
              // ],
              // ),
              contentBorderColor: MyColors.lightGrey,
            ))
        .toList();

    return Container(
        padding: EdgeInsets.symmetric(horizontal: 24),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 24),
            Accordion(
              maxOpenSections: 1,
              rightIcon: Icon(Icons.expand_more, color: Color(0xFF002F60)),
              headerBorderRadius: 6,
              headerBackgroundColor: MyColors.v2AccordionHeader,
              headerPadding: EdgeInsets.symmetric(vertical: 7, horizontal: 15),
              children: accordionItems,
            ),
          ],
        ));
  }

  PreferredSizeWidget getAppBar() {
    return abV2AppBar(context, 'PayeHistory');
  }

  @override
  Widget build(BuildContext context) {
    return abV2MainWidgetWithLoadingOverlayScaffoldScrollView(
        context, isLoading,
        appBar: getAppBar(),
        content: getContent(),
        bottomNavigationBar:
            abV2BottomNavigationBarA(_selectedIndex, _onItemTapped));
  }
}
