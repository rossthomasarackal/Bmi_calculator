import 'package:bmicalculator/bmi_models.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ResultScreen extends StatelessWidget {
  final bmiModel;

  const ResultScreen({super.key, this.bmiModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(30),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: 230,
                width: 230,
                child: bmiModel.isNormal
                    ? Image.asset('assets/images/happyheart.png',
                        fit: BoxFit.contain)
                    : Image.asset('assets/images/sadheart.png',
                        fit: BoxFit.contain),
              ),
              const SizedBox(height: 30),
              Text(
                "Your BMI is ${bmiModel.bmi} ",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w900,
                  color: Color.fromARGB(253, 115, 2, 63),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                "${bmiModel.comment} ",
                style: const TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                  color: Color.fromARGB(157, 115, 2, 63),
                ),
              ),
              const SizedBox(height: 30),
              bmiModel.isNormal
                  ? const Text(
                      " You are Healthy",
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: Color.fromARGB(157, 115, 2, 63),
                      ),
                    )
                  : const Text(
                      " You are Unfit",
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w900,
                        color: Color.fromARGB(157, 115, 2, 63),
                      ),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
