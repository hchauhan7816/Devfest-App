import 'package:devfest/universal/custom_scaffold.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AgendaPage extends StatelessWidget {
  const AgendaPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      // Added
      length: 3, // Added
      initialIndex: 0,
      child: CustomScaffold(
        title: "Agenda",
        tabBar: TabBar(
          indicatorSize: TabBarIndicatorSize.label,
          // indicatorColor: ,
          isScrollable: false,
          labelStyle: TextStyle(fontSize: 45.sp),
          tabs: <Widget>[
            Tab(
              child: Text("Hello"),
            ),
            Tab(
              child: Text("Hello"),
            ),
            Tab(
              child: Text("Hello"),
            ),
          ],
        ),
        body: TabBarView(
          children: [
            Icon(Icons.flight, size: 350),
            Icon(Icons.directions_transit, size: 350),
            Icon(Icons.directions_car, size: 350),
          ],
        ),
      ),
    );
  }
}
