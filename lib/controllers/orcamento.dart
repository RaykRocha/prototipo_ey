class MyService {
  late double _myVariable;

  static final MyService _instance = MyService._internal();
  // passes the instantiation to the _instance object
  factory MyService() => _instance;

  //initialize variables in here
  MyService._internal() {
    _myVariable = 3000.00;
  }

  //short getter for my variable
  double get myVariable => _myVariable;

  //short setter for my variable
  set myVariable(double value) => myVariable = value;

  void incrementMyVariable() => _myVariable += 50;

  void dencrementMyVariable() => _myVariable -= 50;

  void increment() => _myVariable++;
}
