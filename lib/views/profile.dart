import 'package:class_app/utils.dart';
import 'package:flutter/material.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({super.key, required this.data});

  final String data;

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  Widget buildUserInfoDisplay(Widget sub, String title) => Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w500,
              color: Colors.grey,
            ),
          ),
          const SizedBox(
            height: 1,
          ),
          sub,
          const SizedBox(
            height: 10,
          ),
        ],
      ));

  Widget _buildProfileContent(
      context, String name, String id, List<String> classes) {
    String selectedClass = classes[0];

    final clsList = DropdownButton(
      value: selectedClass,
      onChanged: (String? newValue) {
        selectedClass = newValue!;
      },
      isExpanded: true,
      focusColor: Colors.transparent,
      borderRadius: BorderRadius.circular(10),
      items: classes.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Center(
            child: CircleAvatar(
              radius: 50,
              child: Icon(
                Icons.person,
                size: 50,
              ),
            ),
          ),
          buildUserInfoDisplay(
              Text(id, style: const TextStyle(fontSize: 16)), 'User ID'),
          buildUserInfoDisplay(
              Text(name, style: const TextStyle(fontSize: 16)), 'Name'),
          buildUserInfoDisplay(clsList, 'Classes'),
          const SizedBox(
            height: 10,
          ),
          const Text("Actions",
              style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Colors.grey)),
          const SizedBox(
            height: 10,
          ),
          Center(
            child: Column(
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    showAlertDialog(context,
                        "Are you sure you want to mark the attendance?\nName: $name\nID: $id\nClass: $selectedClass");
                  },
                  icon: const Icon(Icons.event_available),
                  label: const Text('Mark Attendace'),
                ),
                const SizedBox(
                  width: 10,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    showAlertDialog(context,
                            "Are you sure you want to mark the class fee?\nName: $name\nID: $id\nClass: $selectedClass")
                        .then((value) => debugPrint(value.toString()));
                  },
                  icon: const Icon(Icons.monetization_on),
                  label: const Text('Mark Class Fee'),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        elevation: 4,
      ),
      body: SafeArea(
        child: Column(
          children: [
            const Center(
              child: CircleAvatar(
                radius: 50,
                child: Icon(
                  Icons.person,
                  size: 50,
                ),
              ),
            ),
            // const Sizedbox(),
            const ListTile(
              title: Text("UserId"),
              subtitle: Text("113131"),
            ),
            const ListTile(
              title: Text("User Name"),
              subtitle: Text("Anjana madhu"),
            ),
            ListTile(
              title: const Text("Classes"),
              subtitle: const Text("CS 01"),
              onTap: () {
                showDialog(
                  context: context,
                  builder: (
                    BuildContext context,
                  ) {
                    return SizedBox(
                      width:300,
                      he
                    )
                  },
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
