import 'package:flutter/material.dart';
import 'package:flutter_application_1/screen/home_screen.dart';
import 'package:get/route_manager.dart';
//import 'package:http/http.dart';

class Newscreen extends StatefulWidget {
  Newscreen({Key? key}) : super(key: key);

  @override
  State<Newscreen> createState() => _NewscreenState();
}

class _NewscreenState extends State<Newscreen> {
  final TextEditingController _cityController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("New page"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                labelText: 'Default TextField',
              ),
            ),
            SizedBox(),
            ElevatedButton(
              onPressed: (() {
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //         builder: (context) => const HomeScreen()));

                //install get package for sortcurt of navigate the page.
                Get.to(() => HomeScreen(
                      cityName: _cityController.text,
                    ));
              }),
              child: const Text("Check the weather"),
            )
          ],
        ),
      ),
    );
  }
}
