import 'package:devfest/Pages/agenda/agenda_page.dart';
import 'package:devfest/controllers/theme_controller.dart';
import 'package:devfest/universal/custom_scaffold.dart';
import 'package:devfest/utils/devfest.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';

// ignore: must_be_immutable
class HomePage extends StatelessWidget {
  HomePage({Key? key}) : super(key: key);

  ThemeController themeController = Get.find<ThemeController>();

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(body: HomePageBody(), title: "Home");
  }
}

// ignore: must_be_immutable
class HomePageBody extends StatelessWidget {
  HomePageBody({Key? key}) : super(key: key);

  launchURL(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  ThemeController themeController = Get.find<ThemeController>();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Obx(
          () => themeController.isDarkMode.value
              ? Image.asset(
                  "assets/images/banner_dark.png",
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                )
              : Image.asset(
                  "assets/images/banner_light.png",
                  fit: BoxFit.cover,
                  filterQuality: FilterQuality.high,
                ),
        ),
        SizedBox(
          height: 50.h,
        ),
        Text(
          "Welcome to GDG DevFest",
          style:
              Theme.of(context).textTheme.headline5!.copyWith(fontSize: 65.sp),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 20.h,
        ),
        Text(
          "Ut qui et omnis cumque consequatur aut culpa. Voluptatibus eius est deleniti sit qui. Alias nesciunt esse similique occaecati soluta similique. Error consequatur similique ratione. Et iure aut laborum. Rerum assumenda velit qui quia maiores.",
          style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 33.sp),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 50.h,
        ),
        userAction(context),
        SizedBox(
          height: 30.h,
        ),
        const Spacer(),
        socialActions(context),
        SizedBox(
          height: 20.h,
        ),
        Text(
          Devfest.appVersion,
          style: Theme.of(context).textTheme.caption!.copyWith(fontSize: 40.sp),
          textAlign: TextAlign.center,
        ),
        SizedBox(
          height: 20.h,
        ),
      ],
    );
  }

  Widget userAction(context) => Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Wrap(
          alignment: WrapAlignment.center,
          spacing: 20,
          runSpacing: 20,
          children: <Widget>[
            ActionCard(
              icon: Icons.schedule,
              color: Colors.red,
              title: "Agenda",
              onPressed: "/agenda",
            ),
            ActionCard(
              icon: Icons.person,
              color: Colors.green,
              title: "Speakers",
              onPressed: "/agenda",
            ),
            ActionCard(
              icon: Icons.people,
              color: Colors.amber,
              title: "Team",
              onPressed: "/agenda",
            ),
            ActionCard(
              icon: Icons.attach_money,
              color: Colors.purple,
              title: "Sponsors",
              onPressed: "/agenda",
            ),
            ActionCard(
              icon: Icons.question_answer,
              color: Colors.brown,
              title: "FAQ",
              onPressed: "/agenda",
            ),
            ActionCard(
              icon: Icons.map,
              color: Colors.blue,
              title: "Locate Us",
              onPressed: "/agenda",
            ),
          ],
        ),
      );

  Widget socialActions(context) => FittedBox(
        child: Row(
          children: [
            IconButton(
              onPressed: () async {
                await launchURL("https://www.linkedin.com/in/Harsh-01");
              },
              icon: const Icon(FontAwesomeIcons.facebookF),
            ),
            IconButton(
              onPressed: () async {
                await launchURL("https://www.linkedin.com/in/Harsh-01");
              },
              icon: const Icon(FontAwesomeIcons.twitter),
            ),
            IconButton(
              onPressed: () async {
                await launchURL("https://www.linkedin.com/in/Harsh-01");
              },
              icon: const Icon(FontAwesomeIcons.linkedinIn),
            ),
            IconButton(
              onPressed: () async {
                await launchURL("https://www.linkedin.com/in/Harsh-01");
              },
              icon: const Icon(FontAwesomeIcons.youtube),
            ),
            IconButton(
              onPressed: () async {
                await launchURL("https://www.linkedin.com/in/Harsh-01");
              },
              icon: const Icon(FontAwesomeIcons.github),
            ),
            IconButton(
              onPressed: () async {
                await launchURL("https://www.linkedin.com/in/Harsh-01");
              },
              icon: const Icon(FontAwesomeIcons.envelope),
            ),
          ],
        ),
      );
}

class ActionCard extends StatelessWidget {
  ThemeController themeController = Get.find<ThemeController>();

  final String onPressed;
  final IconData icon;
  final String title;
  final Color color;

  ActionCard(
      {required this.onPressed,
      required this.icon,
      required this.title,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(8),
      onTap: () {
        Get.toNamed("$onPressed");
      },
      child: Ink(
        height: MediaQuery.of(context).size.height * 0.1,
        width: MediaQuery.of(context).size.width * 0.2,
        decoration: BoxDecoration(
            color: themeController.isDarkMode.value
                ? const Color(0xff1f2124)
                : Colors.white,
            borderRadius: BorderRadius.circular(8),
            boxShadow: themeController.isDarkMode.value
                ? null
                : [
                    const BoxShadow(
                      color: Colors.grey,
                      blurRadius: 10,
                      spreadRadius: 1,
                    )
                  ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon, color: color),
            SizedBox(
              height: 25.h,
            ),
            Text(title),
          ],
        ),
      ),
    );
  }
}
