import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:portfolio/base/Details.dart';
import 'package:url_launcher/url_launcher.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _launchURL(_url) async => await canLaunch(_url)
      ? await launch(_url)
      : throw 'Could not launch $_url';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      // appBar: AppBar(
      //   elevation: 0.1,
      //   backgroundColor: Colors.white,
      //   centerTitle: false,
      //   title: Text(
      //     "RS",
      //     style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
      //   ),
      // ),
      body: Center(
        child: ListView(
          children: <Widget>[
            buildTopSection(context),
            buildAboutSection(context)
          ],
        ),
      ),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }

  // Detail Section
  buildTopSection(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: AssetImage(
                'assets/backhome.jpg',
              ),
              fit: BoxFit.cover)),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height - 250,
      child: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 100.0),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'HEY THERE !',
                      style: GoogleFonts.roboto(
                          fontSize: 40,
                          fontWeight: FontWeight.w300,
                          color: Colors.grey),
                    ),
                    Text(
                      'I AM ${AppStrings.name}',
                      style: GoogleFonts.roboto(
                          fontSize: 45,
                          fontWeight: FontWeight.w500,
                          color: Colors.black),
                    ),
                    Container(
                      height: 50,
                      child: RotateAnimatedTextKit(
                          repeatForever: true,
                          onTap: () {
                            print("Tap Event");
                          },
                          text: AppStrings.animatedTextList,
                          textStyle: GoogleFonts.roboto(
                            fontSize: 25.0,
                          ),
                          textAlign: TextAlign.start),
                    ),
                    Container(
                      width: 250,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () => _launchURL(AppStrings.instagram),
                              child: Icon(FontAwesome.instagram)),
                          GestureDetector(
                              onTap: () => _launchURL(AppStrings.facebook),
                              child: Icon(FontAwesome.facebook_square)),
                          GestureDetector(
                              onTap: () => _launchURL(AppStrings.linkedIn),
                              child: Icon(FontAwesome.linkedin_square)),
                          GestureDetector(
                              onTap: () => _launchURL(AppStrings.stackOverFlow),
                              child: Icon(FontAwesome.stack_overflow)),
                          GestureDetector(
                              onTap: () => _launchURL(AppStrings.github),
                              child: Icon(FontAwesome.github_square)),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width / 2,
              child: Stack(
                clipBehavior: Clip.antiAlias,
                children: [
                  Positioned(
                    right: 0,
                    child: Container(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width / 3.5,
                      color: Colors.grey,
                    ),
                  ),
                  Positioned(child: Image.asset('assets/cutout.png'))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  //about Section
  buildAboutSection(BuildContext contex) {
    return Container(
      height: MediaQuery.of(context).size.height / 2,
      width: MediaQuery.of(context).size.width,
      color: Colors.green,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 5),
          Text(
            'About Me',
            style:
                GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          SizedBox(height: 10),
          Text(
            AppStrings.about,
            style:
                GoogleFonts.roboto(fontWeight: FontWeight.w400, fontSize: 20),
          ),
          SizedBox(height: 5),
          Text(
            'SkillS',
            style:
            GoogleFonts.roboto(fontWeight: FontWeight.bold, fontSize: 25),
          ),
          SizedBox(height: 10),
          Text(
            AppStrings.Flutter,
            style:
            GoogleFonts.roboto(fontWeight: FontWeight.w400, fontSize: 15),
          ),
          Text(
            AppStrings.Python,
            style:
            GoogleFonts.roboto(fontWeight: FontWeight.w400, fontSize: 15),
          ),Text(
            AppStrings.Firebase,
            style:
            GoogleFonts.roboto(fontWeight: FontWeight.w400, fontSize: 15),
          ),
          Text(
            AppStrings.Photoshop,
            style:
            GoogleFonts.roboto(fontWeight: FontWeight.w400, fontSize: 15),
          ),Text(
            AppStrings.Illus,
            style:
            GoogleFonts.roboto(fontWeight: FontWeight.w400, fontSize: 15),
          ),
          SizedBox(height: 10),
        ],
      ),
    );
  }
}
