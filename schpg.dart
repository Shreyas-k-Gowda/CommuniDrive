import 'package:communidrive/src/loginsignup.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(PoolingApp());
}

class PoolingApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pooling App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Ride> rides = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pooling App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SchedulePage(
                      onSchedule: (ride) {
                        setState(() {
                          rides.add(ride);
                        });
                      },
                    ),
                  ),
                );
              },
              child: Text('Schedule a Ride'),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ScheduledRidesPage(rides: rides),
                  ),
                );
              },
              child: Text('View Scheduled Rides'),
            ),
          ],
        ),
      ),
    );
  }
}

class SchedulePage extends StatefulWidget {
  final Function(Ride) onSchedule;

  SchedulePage({required this.onSchedule});

  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  final _formKey = GlobalKey<FormState>();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  final _peopleController = TextEditingController();
  final _genderController = TextEditingController();
  final _phoneController = TextEditingController();
  final _fromController = TextEditingController();
  final _toController = TextEditingController();

  @override
  void dispose() {
    _dateController.dispose();
    _timeController.dispose();
    _peopleController.dispose();
    _genderController.dispose();
    _phoneController.dispose();
    _fromController.dispose();
    _toController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule a Ride'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(labelText: 'Date'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a date';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _timeController,
                decoration: InputDecoration(labelText: 'Time'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a time';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _peopleController,
                decoration: InputDecoration(labelText: 'Number of People'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the number of people';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _genderController,
                decoration: InputDecoration(labelText: 'Gender'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a gender';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Phone Number'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter a phone number';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _fromController,
                decoration: InputDecoration(labelText: 'From Location'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the starting location';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _toController,
                decoration: InputDecoration(labelText: 'Final Location'),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter the final location';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final ride = Ride(
                      date: _dateController.text,
                      time: _timeController.text,
                      numberOfPeople: int.parse(_peopleController.text),
                      gender: _genderController.text,
                      phoneNumber: _phoneController.text,
                      fromLocation: _fromController.text,
                      finalLocation: _toController.text,
                    );
                    widget.onSchedule(ride);
                    Navigator.pop(context);
                  }
                },
                child: Text('Schedule Ride'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Ride {
  final String date;
  final String time;
  final int numberOfPeople;
  final String gender;
  final String phoneNumber;
  final String fromLocation;
  final String finalLocation;

  Ride({
    required this.date,
    required this.time,
    required this.numberOfPeople,
    required this.gender,
    required this.phoneNumber,
    required this.fromLocation,
    required this.finalLocation,
  });
}

class ScheduledRidesPage extends StatelessWidget {
  final List<Ride> rides;

  ScheduledRidesPage({required this.rides});
  
  get date => null;
  
  get time => null;
  
  get genderConstraint => null;
  
  get fromLocation => null;
  
  get toLocation => null;

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scheduled Rides'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: ListView(
          children: <Widget>[
            Card(
              elevation: 4.0,
              margin: EdgeInsets.symmetric(vertical: 10.0),
              child: ListTile(
                title: Text('Ride Details'),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text('Date: $date'),
                    Text('Time: $time'),
                    Text('Gender Constraint: $genderConstraint'),
                    Text('From: $fromLocation'),
                    Text('To: $toLocation'),
                    Text('Phone: $phoneNumber'),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
