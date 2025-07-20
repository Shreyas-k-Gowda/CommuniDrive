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
      home: ScheduleRideScreen(),
    );
  }
}

class ScheduleRideScreen extends StatefulWidget {
  @override
  _ScheduleRideScreenState createState() => _ScheduleRideScreenState();
}

class _ScheduleRideScreenState extends State<ScheduleRideScreen> {
  final _formKey = GlobalKey<FormState>();
  final _dateController = TextEditingController();
  final _timeController = TextEditingController();
  String _genderConstraint = 'No Preference';
  final _fromLocationController = TextEditingController();
  final _toLocationController = TextEditingController();
  final _phoneNumberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Schedule a Ride'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: <Widget>[
              TextFormField(
                controller: _dateController,
                decoration: InputDecoration(labelText: 'Date'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a date';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _timeController,
                decoration: InputDecoration(labelText: 'Time'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a time';
                  }
                  return null;
                },
              ),
              DropdownButtonFormField<String>(
  value: _genderConstraint,
  decoration: InputDecoration(labelText: 'Gender Constraint'),
  onChanged: (String? newValue) {
    setState(() {
      _genderConstraint = newValue!;
    });
  },
  items: <String>['Male', 'Female', 'Any'].map<DropdownMenuItem<String>>((String value) {
    return DropdownMenuItem<String>(
      value: value,
      child: Text(value),
    );
  }).toList(),
),
              TextFormField(
                controller: _fromLocationController,
                decoration: InputDecoration(labelText: 'From Location'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a from location';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _toLocationController,
                decoration: InputDecoration(labelText: 'To Location'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a to location';
                  }
                  return null;
                },
              ),
              TextFormField(
                controller: _phoneNumberController,
                decoration: InputDecoration(labelText: 'Phone Number'),
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Please enter a phone number';
                  }
                  return null;
                },
              ),
              SizedBox(height: 20.0),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ScheduledRidesScreen(
                          date: _dateController.text,
                          time: _timeController.text,
                          genderConstraint: _genderConstraint,
                          fromLocation: _fromLocationController.text,
                          toLocation: _toLocationController.text,
                          phoneNumber: _phoneNumberController.text,
                        ),
                      ),
                    );
                  }
                },
                child: Text('Submit'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ScheduledRidesScreen extends StatelessWidget {
  final String date;
  final String time;
  final String genderConstraint;
  final String fromLocation;
  final String toLocation;
  final String phoneNumber;

  ScheduledRidesScreen({
    required this.date,
    required this.time,
    required this.genderConstraint,
    required this.fromLocation,
    required this.toLocation,
    required this.phoneNumber,
  });

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
