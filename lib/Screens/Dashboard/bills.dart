import 'package:flutter/material.dart';
import 'package:nama_vari/constants/color.dart';


class BillsScreen extends StatelessWidget {
  const BillsScreen({super.key, Key? key1});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> documents = [
    {"name": "Jhon Passport", "size": "12MB", "format": "PNG"},
    {"name": "House Agreement", "size": "12MB", "format": "PDF"},
    {"name": "Business travel tickets", "size": "2.5MB", "format": "PNG"},
    {"name": "Hotel Invoice", "size": "6MB", "format": "PNG"},
    {"name": "Uber Invoice", "size": "400KB", "format": "PDF"},
    {"name": "Tax documents", "size": "2.5MB", "format": "PDF"},
    {"name": "Receipt-Month of June", "size": "1MB", "format": "PDF"},
  ];
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
              SizedBox(height: 8),
            Row(
              children: [
                Icon(Icons.file_copy,size: 30,color: primaryColor,),SizedBox(width: 10,),
                Text(
                  'Files list',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Text('ADMIN ADDED 12 FILES TOTAL'),
             SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: documents.length,
                itemBuilder: (context, index) {
                  final document = documents[index];
                  return Card(
                    child: ListTile(
                      leading: Icon(Icons.insert_drive_file),
                      title: Text(document['name']!),
                      subtitle: Text('SIZE: ${document['size']}  FORMAT: ${document['format']}'),
                      trailing: PopupMenuButton(
                        itemBuilder: (context) => [
                          PopupMenuItem(
                            child: Text("Option 1"),
                          ),
                          PopupMenuItem(
                            child: Text("Option 2"),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}