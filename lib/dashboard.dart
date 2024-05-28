import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CampusPal Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  final List<String> menuTitles = [
    "Dashboard",
    "Profile",
    "Search",
    "Logout"
  ];

  final List<String> imagePaths = [
    "assets/images/arya.png",
    "assets/images/drogo.jpg",
    "assets/images/snow.jpg",
    "assets/images/throne.jpg"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CampusPal'),
      ),
      drawer: MyDrawer(menuTitles: menuTitles, imagePaths: imagePaths, onItemSelected: (index) {
        setState(() {
          _selectedIndex = index;
        });
      }),
      body: IndexedStack(
        index: _selectedIndex,
        children: [
          DashboardScreen(), // Replace with your dashboard content
          ProfileScreen(),  // Replace with your profile content
          SearchScreen(),   // Replace with your search content
          LogoutScreen(),  // Replace with your logout functionality
        ],
      ),
    );
  }
}

class MyDrawer extends StatelessWidget {
  final List<String> menuTitles;
  final List<String> imagePaths;
  final Function(int) onItemSelected;

  const MyDrawer({
    Key? key,
    required this.menuTitles,
    required this.imagePaths,
    required this.onItemSelected,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: <Widget>[
          DrawerHeader(
            child: Text('Hey! CampusPal'),
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
          ),
          for (int i = 0; i < menuTitles.length; i++)
            ListTile(
              leading: SvgPicture.asset(imagePaths[i]),
              title: Text(menuTitles[i]),
              onTap: () => onItemSelected(i),
            ),
        ],
      ),
    );
  }
}

// Placeholder screens for demonstration
class DashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Dashboard Screen'),
    );
  }
}

class ProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Profile Screen'),
    );
  }
}

class SearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Search Screen'),
    );
  }
}

class LogoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('Logout Screen'),
    );
  }
}
class MyDashboardScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Explore Campus Activities',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: AssetImage('assets/images/daenerys.jpg'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Event of the Day: Coding Competition'),
                      Text('Join the fun and test your skills!'),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Explore',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 10,
              children: [
                Chip(label: Text('Events')),
                Chip(label: Text('Campus')),
                Chip(label: Text('Student')),
                Chip(label: Text('Clubs')),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class MyProfileScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Your Profile'),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {},
            child: Text('Edit Profile'),
          ),
        ],
      ),
    );
  }
}

class MySearchScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Search for Events, Clubs, or People'),
          SizedBox(height: 20),
          TextField(
            decoration: InputDecoration(
              hintText: 'Search...',
              border: OutlineInputBorder(),
            ),
          ),
        ],
      ),
    );
  }
}

class MyLogoutScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('Are you sure you want to Logout?'),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text('Yes'),
              ),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () => Navigator.pop(context), // Go back to Dashboard
                child: Text('No'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

