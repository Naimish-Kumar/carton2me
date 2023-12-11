import 'dart:convert';
import 'dart:io';

import 'package:carton2me/core/api.dart';
import 'package:carton2me/presentation/screens/auth/Widget/submit_button.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:carton2me/data/model/user_model/user_model.dart';
import 'package:carton2me/presentation/screens/auth/Widget/InputField.dart';
import 'package:flutter/material.dart';

class UpdateProfileScreen extends StatefulWidget {
  UserModel userModel;
  UpdateProfileScreen({super.key, required this.userModel});

  @override
  State<UpdateProfileScreen> createState() => _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends State<UpdateProfileScreen> {
  final imgPicker = ImagePicker();
  String? filePath;
  XFile? imageFile;
  bool imageSelect = false;
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _emailController = TextEditingController();
  final _phoneController = TextEditingController();
  final _compnyNameController = TextEditingController();
  final _dobController = TextEditingController();
  String imageUrl = '';

  Future<void> showImagePickerDialog(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          backgroundColor: Colors.white,
          surfaceTintColor: Colors.white,
          title: const Text(
            'Choose Image Source',
            style: TextStyle(
                color: Colors.red, fontWeight: FontWeight.bold, fontSize: 18),
          ),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                GestureDetector(
                  child: const Card(
                    child: ListTile(
                      leading: Icon(Icons.image_rounded),
                      title: Text('Gallery'),
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    getImageFromGallery();
                  },
                ),
                GestureDetector(
                  child: const Card(
                    child: ListTile(
                      leading: Icon(Icons.camera_alt_rounded),
                      title: Text('Camera'),
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    getImageFromCamera();
                  },
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    _firstNameController.text = widget.userModel.firstName.toString();
    _lastNameController.text = widget.userModel.lastName.toString();
    _emailController.text = widget.userModel.emailAddress.toString();
    _phoneController.text = widget.userModel.phoneNumber.toString();
    _compnyNameController.text = widget.userModel.companyName.toString();
    imageUrl =
        'https://api.carton.site/${widget.userModel.userAvatar.toString()}';
    _dobController.text = widget.userModel.dateOfBirth.toString() == "null"
        ? ""
        : DateFormat('yyyy-MM-dd').format(
            DateTime.parse(
              widget.userModel.dateOfBirth.toString(),
            ),
          );
    print("ghjhukjkl   " +
        'https://api.carton.site/${widget.userModel.userAvatar.toString()}');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Update Profile',
          style: TextStyle(
              color: Colors.red, fontSize: 18, fontWeight: FontWeight.bold),
        ),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: Colors.red.withOpacity(0.2),
                          width: 2.0,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.red.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 3,
                            offset: const Offset(
                                0, 3), // changes position of shadow
                          ),
                        ],
                      ),
                      child: CircleAvatar(
                        radius: 40,
                        backgroundColor: Colors.white,
                        backgroundImage: NetworkImage(
                            'https://api.carton.site/${widget.userModel.userAvatar.toString()}'),
                        // FileImage(File()),
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      right: 0,
                      child: GestureDetector(
                        onTap: () {
                          showImagePickerDialog(context);
                        },
                        child: const CircleAvatar(
                          radius: 12,
                          child: Icon(
                            Icons.camera_alt_rounded,
                            size: 15,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              const Text(
                'Update User Details',
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              TextFormScreen(
                hinttext: 'First Name',
                icon: Icons.account_circle,
                textEditingController: _firstNameController,
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormScreen(
                hinttext: 'Last Name',
                icon: Icons.account_circle,
                textEditingController: _lastNameController,
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return 'Please enter some text';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormScreen(
                readOnly: true,
                hinttext: 'Email id',
                icon: Icons.mail,
                textEditingController: _emailController,
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return 'Please enter some text';
                  } else if (!RegExp(
                          r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                      .hasMatch(p0)) {
                    return 'Please enter valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormScreen(
                hinttext: 'Phone Number',
                icon: Icons.phone_android_rounded,
                textEditingController: _phoneController,
                keyboardType: TextInputType.phone,
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return 'Please enter some text';
                  } else if (p0.length < 10) {
                    return 'Please enter valid phone number';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormScreen(
                hinttext: 'Compny Name',
                icon: Icons.location_city,
                textEditingController: _compnyNameController,
                keyboardType: TextInputType.text,
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return 'Please enter compny name';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 10,
              ),
              TextFormScreen(
                obscure: false,
                suffixIconWidget: InkWell(
                    onTap: () {
                      showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                      ).then((value) {
                        setState(() {
                          _dobController.text =
                              DateFormat('yyyy-MM-dd').format(value!);
                        });
                      });
                    },
                    child: const Icon(Icons.calendar_today_rounded)),
                suffixIcon: true,
                hinttext: 'Date of Birth',
                icon: Icons.cake_rounded,
                textEditingController: _dobController,
                keyboardType: TextInputType.datetime,
                validator: (p0) {
                  if (p0 == null || p0.isEmpty) {
                    return 'Please enter date of birth';
                  }
                  return null;
                },
              ),
              const SizedBox(
                height: 30,
              ),
              Center(
                child: SubmitButton(
                  onPressed: () {
                    updateProfile();
                  },
                  text: 'Update Profile',
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  getImageFromGallery() async {
    final XFile? image = await imgPicker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imageFile = image;
      imageSelect = true;
      filePath = image.path;
    } else {
      imageSelect = false;
      Fluttertoast.showToast(
          msg: "File Not Selected",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red.withOpacity(0.1),
          textColor: Colors.red,
          fontSize: 16.0);
    }
  }

  getImageFromCamera() async {
    final XFile? photo = await imgPicker.pickImage(source: ImageSource.camera);

    if (photo != null) {
      imageFile = photo;
      imageSelect = true;
      filePath = photo.path;
    } else {
      imageSelect = false;
      Fluttertoast.showToast(
          msg: "File Not Selected",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red.withOpacity(0.1),
          textColor: Colors.red,
          fontSize: 16.0);
    }
  }

  Future<void> updateProfile() async {
    if (imageSelect == true) {
      if (filePath != null) {
        var uri = Uri.parse('${ApiUrls.updateProfile}/${widget.userModel.id}');
        print('uri: ${uri}');
        var request = http.MultipartRequest('PUT', uri);
        request.fields['first_name'] = _firstNameController.text;
        request.fields['last_name'] = _lastNameController.text;
        request.fields['email_address'] = _emailController.text;
        request.fields['phone_number'] = _phoneController.text;
        request.fields['company_name'] = _compnyNameController.text;
        request.fields['date_of_birth'] = _dobController.text;
        request.files
            .add(await http.MultipartFile.fromPath('user_avatar', filePath!));
        var response = await request.send();
        if (response.statusCode == 200) {
          response.stream.transform(utf8.decoder).listen((value) {
            final jsonResponse = json.decode(value);
            if (jsonResponse['status'] == 'success') {
              Fluttertoast.showToast(
                  msg: "Profile Updated Successfully",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.green.withOpacity(0.1),
                  textColor: Colors.green,
                  fontSize: 16.0);
            } else {
              Fluttertoast.showToast(
                  msg: "Profile Not Updated",
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.BOTTOM,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.red.withOpacity(0.1),
                  textColor: Colors.red,
                  fontSize: 16.0);
            }
          });
      }else {
        Fluttertoast.showToast(
            msg: "Something went wrong",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM,
            timeInSecForIosWeb: 1,
            backgroundColor: Colors.red.withOpacity(0.1),
            textColor: Colors.red,
            fontSize: 16.0);
      }
    }
  }
}
}