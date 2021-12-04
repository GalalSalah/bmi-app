import 'dart:core';
import 'dart:math';
import 'package:bloc/bloc.dart';
import 'package:first_project/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BmiCubit extends Cubit<BmiStates> {
  BmiCubit() : super(BmiInitialState());

  static BmiCubit get(context) {
    return BlocProvider.of(context);
  }

  int weight = 55;
  int age = 20;
  double height = 120.0;
  bool isMale = false;
  late double result;

  void changeHeight(double changeValue) {
    height = changeValue;
    emit(BmiHeightChangeState());
  }

  void calculateResult() {
    result = weight / pow(height / 100, 2);
    emit(CalculateResultState());
  }

  void weightPlus() {
    weight++;
    emit(BmiWeightPlusState(weight));
  }

  void weightMinus() {
    weight--;
    emit(BmiWeightMinusState(weight));
  }

  void agePlus() {
    age++;
    emit(BmiAgePlusState(age));
  }

  void ageMinus() {
    age--;
    emit(BmiAgeMinusState(age));
  }

  void changeGender() {
    isMale = !isMale;
    emit(BmiGenderChangeState());
  }
}
