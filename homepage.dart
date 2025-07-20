import 'dart:async';
import 'package:communidrive/src/Maps.dart';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

// void main() {
//   runApp(const MaterialApp(
//     home: HomePage(),
//   ));
// }

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Accounts Drawer Header Example'),
      ),
      drawer: Drawer(
        width: 270,
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 36,
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: Image.network(
                        'https://img.freepik.com/premium-photo/stunning-stylish-indian-girl-with-beautiful-sari-ai-generated_874192-2436.jpg',
                        fit: BoxFit.cover,
                        width: 72,
                        height: 72,
                      ),
                    ),
                  ),
                  SizedBox(width: 30),
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Shreyas",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        "+91 9113854167",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Add other drawer items here
            ListTile(
              title: Text('Friends'),
              leading: Icon(Icons.people),
              onTap: () {},
            ),
            ListTile(
              title: Text('community'),
              leading: Icon(Icons.home),
              onTap: () {},
            ),
            ListTile(
              title: Text('My Rides'),
              leading: Icon(Icons.motorcycle),
              onTap: () {},
            ),
            ListTile(
              title: Text('help and support'),
              leading: Icon(Icons.help),
              onTap: () {},
            ),
            ListTile(
              title: Text('settings'),
              leading: Icon(Icons.settings),
              onTap: () {},
            ),
            Padding(
              padding: const EdgeInsets.only(top: 110),
              child: ListTile(
                title: Text('logout'),
                leading: Icon(Icons.logout_outlined),
                onTap: () {},
              ),
            ),
          ],
        ),
      ),
      body: Center(
        child: Column(
          children: [ElevatedButton(
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => MyConnection()));
          },
          child: const Text("go home"),
        ),
        ElevatedButton(onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>MyMaps()));}, child: Text("map"))],
        )
      ),
    );
  }
}

class MyConnection extends StatefulWidget {
  @override
  // ignore: library_private_types_in_public_api
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyConnection> {
  String _connectionStatus = 'Unknown';
  final Connectivity _connectivity = Connectivity();
  late StreamSubscription<ConnectivityResult> _subscription;

  @override
  void initState() {
    super.initState();
    initConnectivity();
    _subscription =
        _connectivity.onConnectivityChanged.listen(_updateConnectionStatus);
  }

  Future<void> initConnectivity() async {
    late ConnectivityResult result;
    try {
      result = await _connectivity.checkConnectivity();
    } catch (e) {
      print(e.toString());
      return;
    }
    if (!mounted) {
      return;
    }
    _updateConnectionStatus(result);
  }

  void _updateConnectionStatus(ConnectivityResult result) {
    setState(() {
      switch (result) {
        case ConnectivityResult.wifi:
        case ConnectivityResult.mobile:
          _connectionStatus = 'Connected';
          break;
        case ConnectivityResult.none:
          _connectionStatus = 'No internet connection';
          break;
        default:
          _connectionStatus = 'Failed to get connectivity.';
          break;
      }
    });
  }

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Connectivity Example'),
      ),
      body: Center(
        child: Text('Connection Status: $_connectionStatus'),
      ),
    );
  }
}
