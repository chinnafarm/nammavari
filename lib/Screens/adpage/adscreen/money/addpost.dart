import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:nama_vari/constants/color.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({Key? key}) : super(key: key);

  @override
  _AddPostScreenState createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  List<File> _selectedImages = [];
  List<File> _selectedFiles = [];
  List<String> _selectedLinks = [];
   TextEditingController _textEditingController = TextEditingController();

  final ImagePicker _picker = ImagePicker();

  Future<void> _pickImageFromGallery() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
      if (image != null) {
        setState(() {
          _selectedImages.add(File(image.path));
        });
      }
    } catch (e) {
      print('Failed to pick image: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to pick image: $e')),
      );
    }
  }

  Future<void> _pickImageFromCamera() async {
    try {
      final XFile? image = await _picker.pickImage(source: ImageSource.camera);
      if (image != null) {
        setState(() {
          _selectedImages.add(File(image.path));
        });
      }
    } catch (e) {
      print('Failed to pick image: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to pick image: $e')),
      );
    }
  }

  Future<void> _pickFile() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles();
      if (result != null && result.files.single.path != null) {
        setState(() {
          _selectedFiles.add(File(result.files.single.path!));
        });
      }
    } catch (e) {
      print('Failed to pick file: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Failed to pick file: $e')),
      );
    }
  }

  void _openOptions() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.photo),
              title: Text('Photo'),
              onTap: _pickImageFromGallery,
            ),
            ListTile(
              leading: Icon(Icons.camera_alt_outlined),
              title: Text('Camera'),
              onTap: _pickImageFromCamera,
            ),
            ListTile(
              leading: Icon(Icons.file_copy),
              title: Text('File'),
              onTap: _pickFile,
            ),
          ],
        );
      },
    );
  }

  void _removeImage(int index) {
    setState(() {
      _selectedImages.removeAt(index);
    });
  }

  void _removeFile(int index) {
    setState(() {
      _selectedFiles.removeAt(index);
    });
  }

   void _addPost() {
    // Print entered data and uploaded files
    print('Entered Text: ${_textEditingController.text}');
    print('Selected Images:');
    _selectedImages.forEach((image) {
      print(image.path);
    });
    print('Selected Files:');
    _selectedFiles.forEach((file) {
      print(file.path);
    });
    // Here you can add functionality to upload the data/files to a server or database
  }

  @override
  Widget build(BuildContext context) {
    // Define your primary color

    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.logout_sharp,
                color: secondaryColor,
              ))
        ],
        backgroundColor: primaryColor,
        foregroundColor: secondaryColor,
        title: const Text('Create a new post'),
       leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back,
            color: secondaryColor,
          ),
        ),
       
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: AssetImage(
                      'assests/images/view-3d-businessman.jpg'), // Replace with the actual image
                  radius: 25, // Adjust the radius as needed
                ),
                const SizedBox(width: 10),
                const Text(
                  'Admin',
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                ),
                Spacer(),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      // Add your styling here
                      foregroundColor: secondaryColor,
                      backgroundColor: primaryColor,
                      textStyle: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ), // Text color
                      padding:
                          EdgeInsets.symmetric(vertical: 8, horizontal: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onPressed: _addPost,
                    child: Row(
                      children: [
                        Text('Add post'),
                        SizedBox(width: 4,),
                        Icon(Icons.send,size: 20,)
                      ],
                    ))
              ],
            ),
            const SizedBox(height: 20),
             TextField(
             controller: _textEditingController,
              decoration: InputDecoration(
                hintText: 'Express your thoughts...',
                hintStyle:
                    TextStyle(color: Colors.grey, fontStyle: FontStyle.italic),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  borderSide: BorderSide(color: primaryColor, width: 1.5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(12.0)),
                  borderSide: BorderSide(color: primaryColor, width: 1.5),
                ),
                contentPadding:
                    EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
              ),
              maxLines: 4,
              style: TextStyle(fontSize: 16.0),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView(
                children: [
                  ..._selectedImages.map((image) {
                    int index = _selectedImages.indexOf(image);
                    return Container(
                      decoration: BoxDecoration(
                        color: primaryColor.withOpacity(
                            0.3), // Set your desired background color here
                        borderRadius: BorderRadius.circular(
                            10), // Set your desired border radius here
                      ),
                      child: ListTile(
                        leading: Image.file(
                          image,
                          width: 30,
                          height: 30,
                          fit: BoxFit.cover,
                        ),
                        title: Text('Image ${index + 1}'),
                        trailing: IconButton(
                          icon: Icon(
                            Icons.delete,
                            color: primaryColor,
                          ),
                          onPressed: () => _removeImage(index),
                        ),
                      ),
                    );
                  }).toList(),
                  ..._selectedFiles.map((file) {
                    int index = _selectedFiles.indexOf(file);
                    return Container(
                        decoration: BoxDecoration(
                          color: primaryColor.withOpacity(
                              0.3), // Set your desired background color here
                          borderRadius: BorderRadius.circular(
                              10), // Set your desired border radius here
                        ),
                        child: ListTile(
                          leading: Icon(Icons.insert_drive_file),
                          title: Text(file.path.split('/').last),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => _removeFile(index),
                          ),
                        ));
                  }).toList(),
                  ..._selectedLinks.map((link) {
                    return ListTile(
                      leading: Icon(Icons.link),
                      title: Text(link),
                      // Add functionality to delete the link if needed
                    );
                  }).toList(),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: primaryColor,
        foregroundColor: secondaryColor,
        onPressed: _openOptions,
        child: Icon(Icons.add,),
      ),
    );
  }
}
