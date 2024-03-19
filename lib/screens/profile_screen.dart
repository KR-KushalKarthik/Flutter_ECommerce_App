import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  _ProfileScreenState createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  TextEditingController _nameController =
      TextEditingController(text: 'KushalKarthik');
  TextEditingController _emailController =
      TextEditingController(text: 'kushalkarthik@gmail.com');
  TextEditingController _phoneController =
      TextEditingController(text: '7013930467');
  DateTime _dob = DateTime(1990, 1, 1); // Initial date of birth

  bool _isProfileVisible = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
        leading: IconButton(
          icon: Icon(Icons.account_circle),
          onPressed: () {
            // Navigate to account details or any other profile related screen
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.edit),
            onPressed: () {
              _showEditDialog();
            },
          ),
          IconButton(
            icon: Icon(Icons.logout),
            onPressed: () {
              _showLogoutDialog();
            },
          ),
        ],
      ),
      body: Stack(
        children: [
          if (!_isProfileVisible)
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/app3.png'), // Change the image path
                  fit: BoxFit.cover,
                ),
              ),
            ),
          Center(
            child: SingleChildScrollView(
              padding: EdgeInsets.all(20.0),
              child: AnimatedOpacity(
                opacity: _isProfileVisible ? 1.0 : 0.0,
                duration: Duration(milliseconds: 500),
                child: Container(
                  width: 300, // Set the width of the container
                  padding: EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    border: Border.all(color: Colors.grey),
                    color: Colors.deepPurple[100], // Background color
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 50.0,
                        backgroundImage: NetworkImage('assets/kushal.jpg'),
                      ),
                      SizedBox(height: 20.0),
                      _buildProfileInfo('Name:', _nameController.text),
                      SizedBox(height: 20.0),
                      _buildProfileInfo('Email:', _emailController.text),
                      SizedBox(height: 20.0),
                      _buildProfileInfo('Phone:', _phoneController.text),
                      SizedBox(height: 20.0),
                      _buildProfileInfo(
                          'Date of Birth:', _dob.toString().substring(0, 10)),
                      SizedBox(height: 20.0),
                      ElevatedButton(
                        onPressed: () {
                          setState(() {
                            _isProfileVisible = !_isProfileVisible;
                          });
                        },
                        child: Text(_isProfileVisible
                            ? 'Hide Details'
                            : 'Show Details'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileInfo(String label, String value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8.0), // Add some spacing between label and text field
        Container(
          decoration: BoxDecoration(
            borderRadius:
                BorderRadius.circular(10.0), // Adjust border radius as needed
            border: Border.all(color: Colors.grey), // Set border color
          ),
          padding:
              EdgeInsets.symmetric(horizontal: 12.0), // Add horizontal padding
          child: Text(
            value,
            style: TextStyle(fontSize: 16.0),
          ),
        ),
      ],
    );
  }

  void _showEditDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Edit Profile'),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: _nameController,
                decoration: InputDecoration(labelText: 'Name'),
              ),
              TextField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Email'),
              ),
              TextField(
                controller: _phoneController,
                decoration: InputDecoration(labelText: 'Phone'),
              ),
              Row(
                children: [
                  Expanded(
                    child: Text('Date of Birth:'),
                  ),
                  TextButton(
                    onPressed: () {
                      _selectDateOfBirth(context);
                    },
                    child: Text('Select Date'),
                  ),
                ],
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Save changes
                setState(() {});
                Navigator.pop(context);
              },
              child: Text('Save'),
            ),
          ],
        );
      },
    );
  }

  void _showLogoutDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: Text('Are you sure you want to logout?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close the dialog
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                // Perform logout operation
                // For demonstration purposes, let's just navigate back to the login screen
                Navigator.popUntil(context, ModalRoute.withName('/'));
                // You may replace the above line with your actual logout logic,
                // such as clearing authentication tokens, resetting state, etc.
              },
              child: Text('Logout'),
            ),
          ],
        );
      },
    );
  }

  Future<void> _selectDateOfBirth(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _dob,
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (picked != null && picked != _dob) {
      setState(() {
        _dob = picked;
      });
    }
  }
}
