//import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/data/data_model.dart';
import 'package:flutter_application_1/data/search_model.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key, required this.cityName}) : super(key: key);
  final String cityName;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  DataModel? dataFromAPI;
  CityModel? cityDataFromAPI; // use for new api model.... search_model

  _getData() async {
    String search_url =
        "https://geocoding-api.open-meteo.com/v1/search?name=${widget.cityName}"; //this is used for new api link
    http.Response res = await http.get(Uri.parse(search_url));
    cityDataFromAPI = CityModel.fromJson(json.decode(res.body));
    debugPrint(cityDataFromAPI!.results![0].id.toString());
    double latitude = cityDataFromAPI!.results![0].latitude!.toDouble();
    double longitude = cityDataFromAPI!.results![0].longitude!.toDouble();

    String url =
        "https://api.open-meteo.com/v1/forecast?latitude=$latitude&longitude=$longitude&hourly=temperature_2m";
    res = await http.get(Uri.parse(url));
    dataFromAPI = DataModel.fromJson(json.decode(res.body));
    // debugPrint(dataFromAPI!.hourly!.time);
    _isLoading = false;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(widget
              .cityName)), // for change the name of city(we use widget.cityName) which will type in textfield
      body: _isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : ListView.builder(
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                DateTime temp =
                    DateTime.parse(dataFromAPI!.hourly!.time![index]);

                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(DateFormat('dd-MM-yyyy HH:mm a').format(temp)),
                      const Spacer(),
                      Text(dataFromAPI!.hourly!.temperature2m![index]
                          .toString()),
                    ],
                  ),
                );
              },
              itemCount: dataFromAPI!.hourly!.time!.length,
            ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          debugPrint("Button is pressed");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}

// class HomeScreen extends StatefulWidget {
//   const HomeScreen({Key? key}) : super(key: key);

//   @override
//   State<HomeScreen> createState() => _HomeScreenState();
// }

// class _HomeScreenState extends State<HomeScreen> {
//   bool _isloading = false;
//   //final List _newList = ['Rohit', 'Bapi', 'Nikhil', 'Mohit'];
//   @override
//   void initState() {
//     super.initState();
//     // Timer(const Duration(seconds: 5), () {
//     //   print("Timer ends");
//     //   _isloading = false;
//     //   setState(() {});
//     // });
//     _getData();
//   }

//   DataModel? dataFromAPI;

//   _getData() async {
//     String url =
//         "https://api.open-meteo.com/v1/forecast?latitude=52.52&longitude=13.41&hourly=temperature_2m";
//     http.Response res = await http.get(Uri.parse(url));
//     dataFromAPI = DataModel.fromJson(json.decode(res.body));

//     //debugPrint(dataFromAPI.hourlyUnits!.temperature2m);
//     _isloading = false;
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Flutter workshop"),
//       ),
//       // body: _isloading
//       //     ? const CircularProgressIndicator()
//       //     : Center(
//       //         child: Image.network(
//       //             "https://i.pinimg.com/474x/ab/db/02/abdb02dc5f7b78aa112d716ec72f9f55.jpg")),

//       body: _isloading
//           ? const CircularProgressIndicator()
//           : ListView.builder(
//               scrollDirection: Axis.horizontal,
//               itemBuilder: (context, index) => Padding(
//                 padding: const EdgeInsets.all(8.0),
//                 child: Text(
//                   dataFromAPI!.hourly!.time![index],
//                 ),
//               ),
//               itemCount: dataFromAPI!.hourly!.time!.length,
//             ),

//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           print("Buttom is pressed");
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }
