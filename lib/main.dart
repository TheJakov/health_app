import 'package:flutter/material.dart';
import 'package:sliding_clipped_nav_bar/sliding_clipped_nav_bar.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Health App',
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late PageController _pageController;
  int selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(initialPage: selectedIndex);
  }

  /// METHOD FOR CHANGING APPBAR BACKGROUND COLOR
  Color appBarColor() {
    switch (selectedIndex) {
      case (0):
        return Colors.amber;
      case (1):
        return Colors.red;
      case (2):
        return Colors.deepPurpleAccent;
      case (3):
        return Colors.pinkAccent;
      default:
        return Colors.transparent;
    }
  }

  ///
  void onButtonPressed(int index) {
    setState(() {
      selectedIndex = index;
    });
    _pageController.animateToPage(selectedIndex,
        duration: const Duration(milliseconds: 400), curve: Curves.easeOutQuad);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// Main Body
            Expanded(
              child: PageView(
                physics: const NeverScrollableScrollPhysics(),
                controller: _pageController,
                children: _listOfWidget,
              ),
            ),
          ],
        ),
      ),

      /// Bottom Navigation Bar
      bottomNavigationBar: SlidingClippedNavBar(
        backgroundColor: Colors.white,
        onButtonPressed: onButtonPressed,
        iconSize: 30,
        activeColor: const Color(0xFF01579B),
        selectedIndex: selectedIndex,
        barItems: <BarItem>[
          BarItem(
            icon: Icons.home,
            title: 'Home',
          ),
          BarItem(
            icon: Icons.medical_services,
            title: 'Reports',
          ),
          BarItem(
            icon: Icons.event_rounded,
            title: 'Appointments',
          ),
          BarItem(
            icon: Icons.person_rounded,
            title: 'Patient',
          ),
        ],
      ),
    );
  }
}

///
TextStyle fontStyle = GoogleFonts.oxygen(
    fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white);
double iconSize = 200;

TextStyle pageTitle = GoogleFonts.roboto(
    fontSize: 25, fontWeight: FontWeight.w600, color: Colors.black87);

/// LIST OF SCREENS
List<Widget> _listOfWidget = <Widget>[
  const HomeWidget(),
  const MedicalReportsWidget(),
  const AppointmentsWidget(),
  const PatientWidget(),
];

class AppointmentsWidget extends StatelessWidget {
  const AppointmentsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.deepPurpleAccent,
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.event_rounded,
            size: iconSize,
            color: Colors.white,
          ),
          Text("My appointments", style: fontStyle),
        ],
      ),
    );
  }
}

class PatientWidget extends StatelessWidget {
  const PatientWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white54,
      width: double.maxFinite,
      padding: const EdgeInsets.only(top: 40, left: 20, right: 20),
      child: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text("Luka Rokolj",
              style: GoogleFonts.quicksand(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          SizedBox(
            height: 20,
          ),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 40,
                padding: const EdgeInsets.only(
                    top: 20, left: 20, right: 20, bottom: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFF99d5d3)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("My data:",
                        style: GoogleFonts.quicksand(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Colors.black)),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Address:",
                                style: GoogleFonts.quicksand(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black)),
                            SizedBox(
                              height: 10,
                            ),
                            Text("S.S.Kranjcevica 66",
                                style: GoogleFonts.quicksand(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Basic health insurance status:",
                                style: GoogleFonts.quicksand(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black)),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Valid",
                                style: GoogleFonts.quicksand(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Supplementary health insurance:",
                                style: GoogleFonts.quicksand(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black)),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Valid",
                                style: GoogleFonts.quicksand(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ],
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Row(
            children: [
              Container(
                width: MediaQuery.of(context).size.width - 40,
                padding: const EdgeInsets.only(
                    top: 20, left: 20, right: 20, bottom: 20),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Color(0xFFf7be7d)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("My doctor:",
                        style: GoogleFonts.quicksand(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Colors.black)),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Full name:",
                                style: GoogleFonts.quicksand(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black)),
                            SizedBox(
                              height: 10,
                            ),
                            Text("dr.spec.mag Jack Sparrow",
                                style: GoogleFonts.quicksand(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Address:",
                                style: GoogleFonts.quicksand(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black)),
                            SizedBox(
                              height: 10,
                            ),
                            Text("Black Pearl 1312",
                                style: GoogleFonts.quicksand(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Working hours:",
                                style: GoogleFonts.quicksand(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black)),
                            SizedBox(
                              height: 10,
                            ),
                            Text("07:00 - 14:00",
                                style: GoogleFonts.quicksand(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black)),
                          ],
                        ),
                        Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white70,
                            ),
                            width: MediaQuery.of(context).size.width / 2 - 40,
                            height: 40,
                            alignment: Alignment.center,
                            child: Text("Check working hours",
                                style: GoogleFonts.quicksand(
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black)))
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(0xFFb12341),
                ),
                width: MediaQuery.of(context).size.width * 0.6,
                height: 60,
                alignment: Alignment.center,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add,
                        size: 20,
                        color: Colors.white,
                      ),
                      Text("New appointment",
                          style: GoogleFonts.quicksand(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: Colors.white))
                    ]))
          ]),
        ]),
      ),
    );
  }
}

class MedicalReportsWidget extends StatelessWidget {
  const MedicalReportsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      color: Colors.redAccent,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.medical_services,
            size: iconSize,
            color: Colors.white,
          ),
          Text("My medical reports",
              style: GoogleFonts.oxygen(
                  fontSize: 20,
                  fontWeight: FontWeight.w400,
                  color: Colors.white)),
        ],
      ),
    );
  }
}

class HomeWidget extends StatelessWidget {
  const HomeWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      alignment: Alignment.center,
      width: MediaQuery.of(context).size.width,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Row(children: [
                Text("Welcome back, Jakov",
                    textAlign: TextAlign.left, style: pageTitle),
              ]),
              buildRoundedCard(context, Colors.pinkAccent, "Reports: 0",
                  "No new medical reports",
                  widthRatio: 0.9),
              buildRoundedCard(context, Colors.deepPurpleAccent,
                  "Appointments: 1", "1 scheduled appointment",
                  widthRatio: 0.9),
              Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                    child: Column(children: [
                      Text("News", style: pageTitle),
                    ]),
                  ),
                ],
              ),
              buildRoundedCard(context, Colors.lightBlue, "Notice to patients",
                  "We are happy to announce ...",
                  widthRatio: 0.9,
                  titleStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  descStyle:
                      const TextStyle(fontSize: 20, color: Colors.black87)),
              buildRoundedCard(
                  context,
                  Colors.lightBlue,
                  "CEZIH is not working",
                  "Earlier this morning, our systems ...",
                  widthRatio: 0.9,
                  titleStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  descStyle:
                      const TextStyle(fontSize: 20, color: Colors.black87)),
              buildRoundedCard(context, Colors.lightBlue, "Legendary DEV team",
                  "Group of godlike engineers started to work on our new app ...",
                  widthRatio: 0.9,
                  titleStyle: const TextStyle(
                      fontSize: 20,
                      color: Colors.white,
                      fontWeight: FontWeight.bold),
                  descStyle:
                      const TextStyle(fontSize: 20, color: Colors.black87)),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildRoundedCard(BuildContext context, Color backgroundColor,
        String title, String description,
        {TextStyle titleStyle = const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        TextStyle descStyle =
            const TextStyle(fontSize: 20, color: Colors.white),
        double widthRatio = 0.8}) =>
    Card(
      margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Container(
        width: MediaQuery.of(context).size.width * widthRatio,
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: const BorderRadius.all(Radius.circular(12)),
        ),
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: titleStyle,
            ),
            const SizedBox(height: 4),
            Text(
              description,
              style: descStyle,
            ),
          ],
        ),
      ),
    );
