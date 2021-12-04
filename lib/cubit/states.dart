abstract class BmiStates {}

class BmiInitialState extends BmiStates {}
// class BmiInitialState extends CounterState {}
 class BmiHeightState extends BmiStates {}
class BmiWeightPlusState extends BmiStates {
  final int weight;
  BmiWeightPlusState(this.weight);
}
class BmiWeightMinusState extends BmiStates {
  final int weight;
  BmiWeightMinusState(this.weight);
}
class BmiAgePlusState extends BmiStates {
  final int age;
  BmiAgePlusState(this.age);
}
class BmiAgeMinusState extends BmiStates {
  final int age;
  BmiAgeMinusState(this.age);
}
class BmiHeightChangeState extends BmiStates {

}
class BmiGenderChangeState extends BmiStates {

}
class CalculateResultState extends BmiStates {

}

// class CounterPlusState extends CounterState {
//    final int counter;
//    CounterPlusState(this.counter);
// }
// class CounterMinusState extends CounterState {
//
//    final int counter;
//    CounterMinusState(this.counter);
// }
