import 'package:BMI_Calculator/constants/app_constants.dart';
import 'package:BMI_Calculator/widgets/left_bar.dart';
import 'package:BMI_Calculator/widgets/right_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "BMI Calculator",
            style: GoogleFonts.notoSerif(
              textStyle: TextStyle(
                color: accentHexColor,
                letterSpacing: .5,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
          ),
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
        ),
        backgroundColor: mainHexColor,
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    width: 130,
                    child: TextField(
                      controller: _heightController,
                      style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: accentHexColor),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Height",
                        hintStyle: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  Container(
                    width: 130,
                    child: TextField(
                      controller: _weightController,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 42,
                          fontWeight: FontWeight.w300,
                          color: accentHexColor),
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Weight",
                        hintStyle: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              GestureDetector(
                onTap: () {
                  double _h = double.parse(_heightController.text);
                  double _w = double.parse(_weightController.text);
                  setState(() {
                    _bmiResult = _w / (_h * _h);
                    if (_bmiResult > 25) {
                      _textResult = "You\'re over weight";
                    } else if (_bmiResult >= 18.5 && _bmiResult <= 25) {
                      _textResult = "You have normal weight";
                    } else {
                      _textResult = "You\'re under weight";
                    }
                  });
                },
                child: Container(
                  width: MediaQuery.of(context).size.width * 0.45,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: secondHexColor,
                  ),
                  child: Text(
                    'Calculate',
                    style: GoogleFonts.notoSerif(
                      textStyle: TextStyle(
                        color: mainHexColor,
                        letterSpacing: .5,
                        fontWeight: FontWeight.normal,
                        fontSize: 30,
                      ),
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    child: Text(
                      _bmiResult.toStringAsFixed(2),
                      style: GoogleFonts.notoSerif(
                        textStyle: TextStyle(
                          color: accentHexColor,
                          letterSpacing: .5,
                          fontWeight: FontWeight.bold,
                          fontSize: 50,
                        ),
                      ),
                    ),
                  ),
                  Container(
                    child: Text(
                      'Kg/m',
                      style: GoogleFonts.notoSerif(
                        textStyle: TextStyle(
                          color: accentHexColor,
                          letterSpacing: .5,
                          fontWeight: FontWeight.normal,
                          fontSize: 12,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.05,
              ),
              Visibility(
                visible: _textResult.isNotEmpty,
                child: Container(
                  child: Text(
                    _textResult,
                    style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.w400,
                        color: accentHexColor),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.07,
              ),
              LeftBar(
                barWidth: MediaQuery.of(context).size.width * 0.1,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              LeftBar(
                barWidth: MediaQuery.of(context).size.width * 0.2,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              LeftBar(
                barWidth: MediaQuery.of(context).size.width * 0.15,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              RightBar(
                barWidth: MediaQuery.of(context).size.width * 0.3,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              RightBar(
                barWidth: MediaQuery.of(context).size.width * 0.25,
              ),
            ],
          ),
        ));
  }
}
