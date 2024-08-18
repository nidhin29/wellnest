import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameController =
      TextEditingController(text: "XXXX");

  final TextEditingController _emailController =
      TextEditingController(text: "XXXX@gmail.ocm");

  final TextEditingController _ageController =
      TextEditingController(text: "00");

  final TextEditingController _weightController =
      TextEditingController(text: "00");

  final ValueNotifier<String> _genderNotifier = ValueNotifier("Male");

  final TextEditingController _facebookController =
      TextEditingController(text: "XXXX");

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        title: Text('Edit Profile',
            style: GoogleFonts.poppins(
                textStyle: const TextStyle(
              color: Colors.black,
              fontSize: 21,
              fontWeight: FontWeight.w600,
            ))),
        centerTitle: true,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: size * 0.02, bottom: size * 0.01),
            child: GestureDetector(
              onTap: () {},
              child: const Text(
                'Save',
                style: TextStyle(
                    color: Color.fromARGB(255, 66, 159, 69), fontSize: 17),
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 50),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              _TextFieldWithTitle(
                title: "Name",
                controller: _nameController,
              ),
              _TextFieldWithTitle(
                title: "Email",
                controller: _emailController,
              ),
              Padding(
                padding: EdgeInsets.only(right: size * 0.58),
                child: _DropdownWithTitle(
                  title: "Gender",
                  items: const [
                    "Male",
                    "Female",
                  ],
                  selectedValue: _genderNotifier,
                ),
              ),
              _TextFieldWithTitle(
                title: "Age",
                controller: _ageController,
              ),
              _TextFieldWithTitle(
                title: "Weight",
                controller: _weightController,
              ),
              _TextFieldWithTitle(
                title: "Facebook API Key",
                controller: _facebookController,
              ),
              const SizedBox(
                height: 60,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _TextFieldWithTitle extends StatelessWidget {
  const _TextFieldWithTitle({required this.title, required this.controller});
  final String title;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, height: 0.1),
        ),
        TextField(
            controller: controller,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
            ),
            style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
        const SizedBox(
          height: 25,
        )
      ],
    );
  }
}

class _DropdownWithTitle extends StatefulWidget {
  final String title;
  final List<String> items;
  final ValueNotifier<String> selectedValue;

  const _DropdownWithTitle(
      {required this.title, required this.items, required this.selectedValue});

  @override
  _DropdownWithTitleState createState() => _DropdownWithTitleState();
}

class _DropdownWithTitleState extends State<_DropdownWithTitle> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.title,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w400, height: 0.1),
        ),
        ValueListenableBuilder(
            valueListenable: widget.selectedValue,
            builder: (context, value, child) {
              return DropdownButton<String>(
                isExpanded: true,
                value: widget.selectedValue.value,
                underline: Container(
                  height: 1,
                  color: Colors.grey,
                ),
                onChanged: (String? newValue) {
                  setState(() {
                    widget.selectedValue.value = newValue!;
                  });
                },
                items:
                    widget.items.map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value,
                        style: const TextStyle(
                            fontSize: 15, fontWeight: FontWeight.w600)),
                  );
                }).toList(),
              );
            }),
        const SizedBox(
          height: 25,
        ),
      ],
    );
  }
}
