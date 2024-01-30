import 'package:bmicalculator/bmi_models.dart';
import 'package:bmicalculator/result_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class BmiCalculator extends StatefulWidget {
  const BmiCalculator({super.key});

  @override
  State<BmiCalculator> createState() => _BmiCalculatorState();
}

class _BmiCalculatorState extends State<BmiCalculator> {
  double _UserHeight = 100.0;
  double _UserWeight = 50.0;
  double _bmi = 0;
  BMIModel _bmiModel = BMIModel(bmi: 0, comment: 'hi', isNormal: true);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 230,
                width: 230,
                child: SvgPicture.asset('assets/images/heartS.svg',
                    fit: BoxFit.contain),
              ),
              const SizedBox(height: 10),
              const Text(
                'BMI Calculator',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w900,
                  color: Color.fromARGB(253, 115, 2, 63),
                ),
              ),
              const SizedBox(height: 10),
              const Text(
                'Health is Wealth',
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(
                    197,
                    159,
                    4,
                    17,
                  ),
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 35),
              const Text(
                'Height (cm) ',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(253, 245, 6, 133),
                  fontStyle: FontStyle.italic,
                ),
              ),
              //const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.only(left: 190, right: 190),
                child: Slider(
                  value: _UserHeight,
                  onChanged: (height) {
                    setState(() {
                      _UserHeight = height;
                    });
                  },
                  min: 85.0,
                  max: 250.0,
                  divisions: 330,
                  activeColor: const Color.fromARGB(253, 115, 2, 63),
                  label: '$_UserHeight',
                  inactiveColor: const Color.fromARGB(86, 115, 2, 63),
                ),
              ),
              //const SizedBox(height: 10),
              Text(
                '$_UserHeight  cm',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Color.fromARGB(253, 115, 2, 63),
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 35),
              const Text(
                'Weight (Kg) ',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: Color.fromARGB(253, 245, 6, 133),
                  fontStyle: FontStyle.italic,
                ),
              ),
              //const SizedBox(height: 10),
              Container(
                padding: const EdgeInsets.only(left: 190, right: 190),
                child: Slider(
                  value: _UserWeight,
                  onChanged: (weight) {
                    setState(() {
                      _UserWeight = weight;
                    });
                  },
                  min: 30.0,
                  max: 120.0,
                  divisions: 180,
                  activeColor: const Color.fromARGB(253, 115, 2, 63),
                  label: '$_UserWeight',
                  inactiveColor: const Color.fromARGB(86, 115, 2, 63),
                ),
              ),
              //const SizedBox(height: 10),
              Text(
                '$_UserWeight  kg',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Color.fromARGB(253, 115, 2, 63),
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                height: 40,
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shadowColor: const Color.fromARGB(255, 10, 50, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                    foregroundColor: Colors.white,
                    //const Color.fromARGB(86, 115, 2, 63),
                    backgroundColor: const Color.fromARGB(253, 115, 2, 63),
                  ),
                  onPressed: () {
                    setState(() {
                      _bmi = _UserWeight /
                          ((_UserHeight / 100) * (_UserHeight / 100));
                      print(_bmi);
                      if (_bmi >= 18.5 && _bmi <= 25) {
                        _bmiModel = BMIModel(
                            bmi: _bmi,
                            isNormal: true,
                            comment: "You Are Totally Fit");
                        print(_bmiModel.comment);
                      } else if (_bmi < 18.5) {
                        _bmiModel = BMIModel(
                            bmi: _bmi,
                            isNormal: false,
                            comment: "You Are Under Weight");
                        print(_bmiModel.comment);
                      } else if (_bmi > 25 && _bmi <= 30) {
                        _bmiModel = BMIModel(
                            bmi: _bmi,
                            isNormal: false,
                            comment: "You Are Over Weight");
                        print(_bmiModel.comment);
                      } else {
                        _bmiModel = BMIModel(
                            bmi: _bmi,
                            isNormal: false,
                            comment: "You Are Obsesed");
                        print(_bmiModel.comment);
                      }
                    });
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ResultScreen(
                                  bmiModel: _bmiModel,
                                ),),);
                  },
                  child: const Text(
                    'CACULATE',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
