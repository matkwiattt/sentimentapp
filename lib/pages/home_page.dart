import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sentimentapp/pages/result_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  double? _deviceHight;
  double? _deviceWidth;
  @override
  Widget build(BuildContext context) {
    _deviceHight = MediaQuery.of(context).size.height;
    _deviceWidth = MediaQuery.of(context).size.width;

    return SafeArea(
        child: Scaffold(
      // appBar: AppBar(
      //   title: Row(children: [Text("LOGO")]),
      //   backgroundColor: Colors.grey,
      // ),
      backgroundColor: Color.fromARGB(255, 210, 210, 210),
      body: Padding(
        padding: const EdgeInsets.all(60),
        child: Center(
          child: Container(
            decoration: BoxDecoration(color: Colors.black),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 60,
                  ),
                  Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: _homePageTitle()),
                  SizedBox(
                    height: 20,
                  ),
                  _searchBar(),
                  _searchButton()
                ]),
          ),
        ),
      ),
    ));
  }

  Widget _homePageTitle() {
    return Text(
      '#Check the current sentiment of latest tweets!#',
      textAlign: TextAlign.center,
      style: TextStyle(
          color: Colors.white,
          fontSize: _deviceWidth! > 600 ? _deviceWidth! * 0.025 : 25,
          fontWeight: FontWeight.bold),
    );
  }

  Widget _searchBar() {
    return Container(
      width: _deviceWidth! * 0.45,
      child: TextField(
        cursorColor: Color.fromRGBO(238, 195, 189, 1),
        inputFormatters: [UpperCaseTextFormatter()],
        style: TextStyle(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        ),
        textAlign: TextAlign.center,
        decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                    width: 3, color: Color.fromRGBO(238, 195, 189, 1))),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(0)),
            filled: true,
            fillColor: Colors.white,
            hintText: "#BITCOIN",
            hintStyle: TextStyle(fontWeight: FontWeight.normal)),
      ),
    );
  }

  Widget _searchButton() {
    return MaterialButton(
      onPressed: () {
        Navigator.pushNamed(context, 'result');
      },
      minWidth: 200,
      height: 65,
      color: Color.fromRGBO(238, 195, 189, 1),
      child: Text(
        "SEARCH",
        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
      ),
    );
  }
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}
