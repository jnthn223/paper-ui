import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

final tabs = ["Home", "Budget", "Tags", "Expenses"];

class _MainAppState extends State<MainApp> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  int _currentIndex = 0; // State variable to store the current index

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 4, vsync: this);
    _tabController!.addListener(() {
      setState(() {
        _currentIndex = _tabController!.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text(tabs[_currentIndex]), // Use the state variable for title
        ),
        body: TabBarView(
          controller: _tabController,
          children: const [
            Center(child: Text('Home Tab')),
            Center(child: Text('Budget Tab')),
            Center(child: Text('Tags Tab')),
            Center(child: Text('Expenses')),
          ],
        ),
        bottomNavigationBar: Container(
          decoration: const BoxDecoration(
            border: Border(top: BorderSide(color: Colors.black, width: 2.0)),
          ),
          child: TabBar(
            controller: _tabController,
            indicatorColor: Color(0xFF6FCF97),
            unselectedLabelColor: Colors.black,
            labelColor: Color(0xFF6FCF97),
            labelStyle: GoogleFonts.rubik(),
            tabs: [
              Tab(icon: Icon(Icons.home), child: tabLabel("Home")),
              Tab(icon: Icon(Icons.attach_money), child: tabLabel("Budget")),
              Tab(icon: Icon(Icons.tag), child: tabLabel("Tags")),
              Tab(icon: Icon(Icons.receipt), child: tabLabel("Expenses")),
            ],
          ),
        ),
      ),
    );
  }

  Widget tabLabel(String text) {
    return Text(
      text,
      style: GoogleFonts.rubik(color: Colors.black),
    );
  }
}