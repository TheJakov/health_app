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

TextStyle fontStyle = GoogleFonts.quicksand(
    fontSize: 20, fontWeight: FontWeight.w400, color: Colors.white);
double iconSize = 200;

TextStyle pageTitle = GoogleFonts.quicksand(
    fontSize: 22, fontWeight: FontWeight.w600, color: Colors.black54);

TextStyle pageTitleMain = GoogleFonts.quicksand(
    fontSize: 25, fontWeight: FontWeight.w600, color: Colors.black);

TextStyle pageTitleLight = GoogleFonts.quicksand(
    fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white);

int themeMagentaHex = 0xFFb12341;
int themeYellowHex = 0xFFf7be7d;
int themeLightBlueHex = 0xFF99d5f3;

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
    return Scaffold(
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        backgroundColor: Color(themeMagentaHex),
        onPressed: () => {},
        hoverColor: Color(themeYellowHex),
      ),
      body: Container(
        alignment: Alignment.topLeft,
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(children: [
                    Text("My medical appointments",
                        textAlign: TextAlign.left, style: pageTitleMain),
                  ]),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Column(children: [
                          Text("Upcoming appointments", style: pageTitle),
                        ]),
                      ),
                    ],
                  ),
                  buildRoundedAppointment(
                      context,
                      Color(themeLightBlueHex),
                      "Abdomen check",
                      "dr. med. Jack Sparrow",
                      "Black Pearl 2A", "13-07-2022",
                      titleStyle: GoogleFonts.quicksand(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      descStyle: GoogleFonts.quicksand(
                          fontSize: 16, color: Colors.black),
                      dateStyle: GoogleFonts.quicksand(
                          fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                      addressStyle: GoogleFonts.quicksand(
                          fontSize: 14, color: Colors.black, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                      widthRatio: 0.9),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Column(children: [
                          Text("Past appointments", style: pageTitle),
                        ]),
                      ),
                    ],
                  ),
                  buildRoundedAppointment(
                      context,
                      Color(themeYellowHex),
                      "Knee check",
                      "dr. med. Will Turner",
                      "Flying Dutchman 3C", "25-05-2022",
                      titleStyle: GoogleFonts.quicksand(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      descStyle: GoogleFonts.quicksand(
                          fontSize: 16, color: Colors.black),
                      dateStyle: GoogleFonts.quicksand(
                          fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                      addressStyle: GoogleFonts.quicksand(
                          fontSize: 14, color: Colors.black, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                      widthRatio: 0.9),
                  buildRoundedAppointment(
                      context,
                      Color(themeYellowHex),
                      "Reality check",
                      "dr. med. Jack Sparrow",
                      "Black Pearl 2A", "13-04-2022",
                      titleStyle: GoogleFonts.quicksand(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      descStyle: GoogleFonts.quicksand(
                          fontSize: 16, color: Colors.black),
                      dateStyle: GoogleFonts.quicksand(
                          fontSize: 14, color: Colors.black, fontWeight: FontWeight.bold),
                      addressStyle: GoogleFonts.quicksand(
                          fontSize: 14, color: Colors.black, fontStyle: FontStyle.italic, fontWeight: FontWeight.bold),
                      widthRatio: 0.9),
                ],
              ),
            ),
          ),
        )),
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
          Text("Jakov Kristović",
              style: GoogleFonts.quicksand(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          const SizedBox(
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
                    color: Color(themeLightBlueHex)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("My data:",
                        style: GoogleFonts.quicksand(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Colors.black)),
                    const SizedBox(
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
                            const SizedBox(
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
                    const SizedBox(
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
                            const SizedBox(
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
                    const SizedBox(
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
                            const SizedBox(
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
          const SizedBox(
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
                    color: Color(themeYellowHex)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("My doctor:",
                        style: GoogleFonts.quicksand(
                            fontSize: 20,
                            fontWeight: FontWeight.w900,
                            color: Colors.black)),
                    const SizedBox(
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
                            const SizedBox(
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
                    const SizedBox(
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
                            const SizedBox(
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
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Today's shift:",
                                style: GoogleFonts.quicksand(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w400,
                                    color: Colors.black)),
                            const SizedBox(
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
          const SizedBox(
            height: 20,
          ),
          Row(mainAxisAlignment: MainAxisAlignment.end, children: [
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Color(themeMagentaHex),
                ),
                width: MediaQuery.of(context).size.width * 0.6,
                height: 60,
                alignment: Alignment.center,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
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
        alignment: Alignment.topLeft,
        color: Colors.white,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Row(children: [
                    Text("My medical reports",
                        textAlign: TextAlign.left, style: pageTitleMain),
                  ]),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Column(children: [
                          Text("Upcoming reports", style: pageTitle),
                        ]),
                      ),
                    ],
                  ),
                  buildRoundedReport(context, Color(themeYellowHex),
                      "Covid PCR test", "ZZJZ Split", "19-06-2022",
                      titleStyle: GoogleFonts.quicksand(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      descStyle: GoogleFonts.quicksand(
                          fontSize: 20, color: Colors.black),
                      dateStyle: GoogleFonts.quicksand(
                          fontSize: 10, color: Colors.black),
                      widthRatio: 0.9),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Column(children: [
                          Text("Finished reports", style: pageTitle),
                        ]),
                      ),
                    ],
                  ),
                  buildRoundedReport(context, Color(themeLightBlueHex),
                      "Urine sample testing", "ZZJZ Split", "03-03-2022",
                      titleStyle: GoogleFonts.quicksand(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      descStyle: GoogleFonts.quicksand(
                          fontSize: 20, color: Colors.black),
                      dateStyle: GoogleFonts.quicksand(
                          fontSize: 10, color: Colors.black),
                      widthRatio: 0.9),
                  buildRoundedReport(context, Color(themeMagentaHex),
                      "Blood test", "ZZJZ Split", "11-01-2022",
                      titleStyle: GoogleFonts.quicksand(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      descStyle: GoogleFonts.quicksand(
                          fontSize: 20, color: Colors.white),
                      dateStyle: GoogleFonts.quicksand(
                          fontSize: 10, color: Colors.white),
                      widthRatio: 0.9),
                ],
              ),
            ),
          ),
        ));
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
        alignment: Alignment.topLeft,
        width: MediaQuery.of(context).size.width,
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Row(children: [
                    Text("Welcome back, Jakov",
                        textAlign: TextAlign.left, style: pageTitleMain),
                  ]),
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Column(children: [
                          Text("Overview", style: pageTitle),
                        ]),
                      ),
                    ],
                  ),
                  buildRoundedCard(context, Color(themeMagentaHex),
                      "Reports: 0", "No new medical reports",
                      titleStyle: GoogleFonts.quicksand(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.white),
                      descStyle: GoogleFonts.quicksand(
                          fontSize: 20, color: Colors.white),
                      widthRatio: 0.9),
                  buildRoundedCard(context, Color(themeYellowHex),
                      "Appointments: 1", "1 scheduled appointment",
                      widthRatio: 0.9,
                      titleStyle: GoogleFonts.quicksand(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      descStyle: GoogleFonts.quicksand(
                          fontSize: 20, color: Colors.black)),
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
                  buildRoundedCard(context, Color(themeLightBlueHex),
                      "Notice to patients", "We are happy to announce ...",
                      widthRatio: 0.9,
                      titleStyle: GoogleFonts.quicksand(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      descStyle: GoogleFonts.quicksand(
                          fontSize: 20, color: Colors.black)),
                  buildRoundedCard(context, Color(themeLightBlueHex),
                      "Out of service", "Earlier this morning, our systems ...",
                      widthRatio: 0.9,
                      titleStyle: GoogleFonts.quicksand(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      descStyle: GoogleFonts.quicksand(
                          fontSize: 20, color: Colors.black)),
                  buildRoundedCard(
                      context,
                      Color(themeLightBlueHex),
                      "Legendary DEV team",
                      "Group of godlike engineers started to work on our new app ...",
                      widthRatio: 0.9,
                      titleStyle: GoogleFonts.quicksand(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                      descStyle: GoogleFonts.quicksand(
                          fontSize: 20, color: Colors.black)),
                ],
              ),
            ),
          ),
        ));
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

Widget buildRoundedReport(BuildContext context, Color backgroundColor,
        String title, String description, String date,
        {TextStyle titleStyle = const TextStyle(
            fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
        TextStyle descStyle =
            const TextStyle(fontSize: 20, color: Colors.white),
        TextStyle dateStyle =
            const TextStyle(fontSize: 10, color: Colors.white),
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
            const SizedBox(height: 4),
            Text(
              date,
              style: descStyle,
            ),
          ],
        ),
      ),
    );

Widget buildRoundedAppointment(BuildContext context, Color backgroundColor,
    String title, String description, String address, String date,
    {TextStyle titleStyle = const TextStyle(
        fontSize: 20, fontWeight: FontWeight.bold, color: Colors.white),
      TextStyle descStyle =
      const TextStyle(fontSize: 20, color: Colors.white),
      TextStyle dateStyle =
      const TextStyle(fontSize: 15, color: Colors.white),
      TextStyle addressStyle =
      const TextStyle(fontSize: 15, color: Colors.black, fontStyle: FontStyle.italic),
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
            const SizedBox(height: 4),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      date,
                      style: dateStyle),
                  ],
                ),
                const SizedBox(width: 25),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                        address,
                        style: addressStyle, textAlign: TextAlign.right),
                  ],
                )
              ],
            ),
          ],
        ),
      ),
    );
