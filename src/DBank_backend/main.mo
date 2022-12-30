import Debug "mo:base/Debug";

actor DBank {
  var currentValue: Nat = 300;

  // Changes the value of the variable
  currentValue := 100;

  let id = 2430957293847524;
  // Debug.print(debug_show(id));

  public func topUp(amount: Nat) {
    currentValue += amount;

  // Prints a Natural Number

    Debug.print(debug_show(currentValue));
  };

  public func withdraw(amount: Nat) {
    currentValue -= amount;
    Debug.print(debug_show(currentValue));
  };
}