import 'dart:html';
import 'profilepage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart'; // For SVG icons
import 'login_page.dart';

class CampusPalApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CampusPalDashboard(),
      theme: ThemeData(
        appBarTheme: AppBarTheme(
          color: Colors.blue,
        ),
      ),
    );
  }
}

class CampusPalDashboard extends StatefulWidget {
  const CampusPalDashboard({Key? key}) : super(key: key);

  @override
  _CampusPalDashboardState createState() => _CampusPalDashboardState();
}

class _CampusPalDashboardState extends State<CampusPalDashboard> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey(); // Key for Drawer
  bool _isLoggedIn = true; // Flag to track login status (initially logged in)

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[100],
      key: _drawerKey,
      appBar: AppBar(
        backgroundColor: Colors.red[400],
        title: Text('Hey! CampusPal👋'),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Text('Explore campus activities', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: SizedBox(
                height: 48.0,
                child: TextField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)), // set border radius
                      borderSide: BorderSide.none, // no border
                    ),
                    filled: true, // enable filled background
                    fillColor: Colors.grey[200], // set fill color
                    hintText: 'Search',
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Text('🎗️Event of the day', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold,)),
            ),
            const SizedBox(height: 6.0),
            Container(
              height: 130,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4.0),
                color: Colors.grey[200],
              ),
              child: Stack(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(4.0),
                    child: Image(
                      image: AssetImage('arya.png'),
                      width: double.infinity,
                      height: 100,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    bottom: 10.0,
                    left: 8.0,
                    child: Text(
                      'Event title : ',
                      style: TextStyle(
                        fontSize: 12.0,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 16.0,
                    right: 70.0,
                    child: Text(
                      'Date : ',
                      style: TextStyle(
                        fontSize: 10.0,
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Card(
                      child: InkWell(
                        onTap: () => print('Events tapped'),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Icon(Icons.calendar_today, size: 18.0),
                              Text('Events', style: TextStyle(fontSize: 12.0)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      child: InkWell(
                        onTap: () => print('Promote tapped'),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Icon(Icons.sell, size: 18.0),
                              Text('Promote', style: TextStyle(fontSize: 12.0)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    child: Card(
                      child: InkWell(
                        onTap: () => print('Lost & Found tapped'),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Icon(Icons.location_searching, size: 18.0),
                              Text('Lost & Found', style: TextStyle(fontSize: 12.0)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Card(
                      child: InkWell(
                        onTap: () => print('Explore tapped'),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Icon(Icons.explore, size: 18.0),
                              Text('explore', style: TextStyle(fontSize: 12.0)),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16.0),
            Padding(
              padding: const EdgeInsets.only(left: 20.0, right: 20.0),
              child: Card(
                child: ListTile(
                  leading: Icon(Icons.announcement, size: 24.0),
                  title: Text('Notification', style: TextStyle(fontSize: 12.0)),
                  subtitle: Text('10 minutes ago', style: TextStyle(fontSize: 8.0)),
                  trailing: Icon(Icons.arrow_forward_ios, size: 14.0),
                  onTap: () {
                    //navigate to notification
                  },
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            GridView.count(
              crossAxisCount: 2,
              childAspectRatio: 1,
              shrinkWrap: true,
              physics: ScrollPhysics(),
              children: [
                'daenerys.jpg',
                'drogo.jpg',
                'snow.jpg',
                'throne.jpg',
              ].map((image) => Card(
                child: Image(
                  image: AssetImage(image),
                ),
              )).toList(),
            ),
          ],
        ),
      ),
      drawer: _buildDrawer(), // Add the drawer widget
      bottomNavigationBar: BottomNavigationBar(
  items:[
    BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home', backgroundColor: Colors.red[400]),
    BottomNavigationBarItem(icon: Icon(Icons.explore), label: 'Discover', backgroundColor: Colors.red[400]),
    BottomNavigationBarItem(icon: Icon(Icons.add), label: 'Add', backgroundColor: Colors.white),
    BottomNavigationBarItem(icon: Icon(Icons.notifications), label: 'Notifications',backgroundColor: Colors.red[400]),
    BottomNavigationBarItem(icon: Icon(Icons.person), label: 'Profile', backgroundColor: Colors.red[400]),
  ],
  onTap: (index) {
    if (index == 4) {
      Navigator.push(
        context, 
        MaterialPageRoute(builder: (context) => ProfileScreen()),
      );
    }
  },
),
    );
  }

  Widget _buildDrawer() {
    List<ListTile> drawerTiles = [
      ListTile(
        title: const Text('Home'),
        leading: const Icon(Icons.home),
        onTap: () => Navigator.pop(context), // Close the drawer on tap
      ),
      ListTile(
        title: const Text('Explore'),
        leading: const Icon(Icons.explore),
        onTap: () => Navigator.pop(context),// Close the drawer on tap
      ),
      ListTile(
        title: const Text('Events'),
        leading: const Icon(Icons.calendar_today),
        onTap: () => Navigator.pop(context), // Close the drawer on tap
      ),
      ListTile(
        title: const Text('Advertise'),
        leading: const Icon(Icons.sell),
        onTap: () => Navigator.pop(context), // Close the drawer on tap
      ),
      ListTile(
        title: const Text('Lost and Found'),
        leading: const Icon(Icons.camera_enhance),
        onTap: () => Navigator.pop(context), // Close the drawer on tap
      ),
      ListTile(
        title: const Text('Logout'),
        leading: const Icon(Icons.exit_to_app),
        onTap: () {
          _handleLogout();
        },
      ),
    ];

    return Drawer(
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('snow.jpg'),
              radius: 40.0, // Reduce the radius
            ),
            accountName: Text('Username'),
            accountEmail: Text('user@email.com'),
             decoration: BoxDecoration(
              color: Colors.red[400], // Changed to light red
            ),
          ),
          Expanded(
            child: ListView(
              padding: EdgeInsets.zero,
              children: drawerTiles,
            ),
          ),
        ],
      ),
    );
  }

  void _handleLogout() {
    // Handle logoutlogic (e.g., clear user data, navigate to login)
    setState(() {
      _isLoggedIn = false;
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    });
  }
}
