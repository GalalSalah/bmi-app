import 'package:first_project/bmi_result/bmi_result.dart';
import 'package:first_project/cubit/cubit.dart';
import 'package:first_project/cubit/states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class BmiScreen extends StatelessWidget {
  const BmiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => BmiCubit(),
      child: BlocConsumer<BmiCubit, BmiStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var bmiCubit = BmiCubit.get(context);
          return Scaffold(
            appBar: AppBar(
              title: const Text('BMI'),
            ),
            body: Column(
              children: [
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                bmiCubit.changeGender();
                              },
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Image(
                                      image: AssetImage(
                                        'assets/male.png',
                                      ),
                                      width: 90,
                                      height: 90,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      'Male',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: bmiCubit.isMale
                                        ? Colors.blue
                                        : Colors.grey[400]),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                bmiCubit.changeGender();
                                // setState(() {
                                //   isMale = false;
                                // });
                              },
                              child: Container(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Image(
                                      image: AssetImage(
                                        'assets/female.png',
                                      ),
                                      width: 90,
                                      height: 90,
                                    ),
                                    SizedBox(
                                      height: 15,
                                    ),
                                    Text(
                                      'Female',
                                      style: TextStyle(
                                          fontSize: 25,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: bmiCubit.isMale
                                        ? Colors.grey[400]
                                        : Colors.blue),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0),
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.grey[400]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Height',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.baseline,
                              textBaseline: TextBaseline.alphabetic,
                              children: [
                                Text(
                                  '${bmiCubit.height.round()}',
                                  style: const TextStyle(
                                      fontSize: 50, fontWeight: FontWeight.w900),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                const Text(
                                  'CM',
                                  style: TextStyle(
                                      fontSize: 20, fontWeight: FontWeight.bold),
                                ),
                              ],
                            ),
                            Slider(
                                max: 220,
                                min: 80,
                                value: bmiCubit.height,
                                onChanged: (value) {
                                  bmiCubit.changeHeight(value);
                                  print(value.round());
                                })
                          ],
                        ),
                      ),
                    )),
                Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[400]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Text(
                                    'Weight',
                                    style: TextStyle(
                                        fontSize: 25, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '${bmiCubit.weight}',
                                    style: const TextStyle(
                                        fontSize: 50, fontWeight: FontWeight.w900),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FloatingActionButton(
                                        onPressed: () {
                                          bmiCubit.weightPlus();
                                        },
                                        heroTag: 'weight-',
                                        mini: true,
                                        child: const Icon(Icons.remove),
                                      ),
                                      FloatingActionButton(
                                        onPressed: () {
                                          bmiCubit.weightPlus();
                                        },
                                        heroTag: ' weight+',
                                        mini: true,
                                        child: const Icon(Icons.add),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.grey[400]),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Age',
                                    style: TextStyle(
                                        fontSize: 25, fontWeight: FontWeight.bold),
                                  ),
                                  Text(
                                    '${bmiCubit.age}',
                                    style: TextStyle(
                                        fontSize: 50, fontWeight: FontWeight.w900),
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      FloatingActionButton(
                                        onPressed: () {
                                          bmiCubit.ageMinus();
                                        },
                                        heroTag: 'age-',
                                        mini: true,
                                        child: Icon(Icons.remove),
                                      ),
                                      FloatingActionButton(
                                        onPressed: () {
                                          bmiCubit.agePlus();
                                        },
                                        heroTag: 'age+',
                                        mini: true,
                                        child: Icon(Icons.add),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    )),
                Container(
                  height: 40,
                  width: double.infinity,
                  color: Colors.blue,
                  child: MaterialButton(
                    onPressed: () {
                      // double result = bmiCubit.weight / pow(bmiCubit.height / 100, 2);
                      bmiCubit.calculateResult();
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => BmiResult(
                                age: bmiCubit.age,
                                isMale: bmiCubit.isMale,
                                result: bmiCubit.result.round(),
                              )));
                    },
                    child: const Text(
                      'CALCULATE',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

