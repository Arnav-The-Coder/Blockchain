import Debug "mo:base/Debug";

actor DBank {

  // This changes the persistences of the variable from flexible (default) to stable
  // It will go back to its last value even after being refreshed or updated, not to it's orginal variable value

  stable var currentValue: Nat = 300;

  // Changes the value of the variable
  // currentValue := 100;

  let id = 2430957293847524;
  // Debug.print(debug_show(id));

  public func topUp(amount: Nat) {
    currentValue += amount;

  // Prints a Natural Number

    Debug.print(debug_show(currentValue));
  };

  // Creates a function that is not private and can be seen by the program

  public func withdraw(amount: Nat) {
    let tempValue: Int = currentValue - amount;

    if (tempValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    } else {
      Debug.print("The amount is too large, now the currentValue is less than zero.");
    }
  };

  public query func checkBalance(): async Nat {
    return currentValue;
  }; 

  // topUp();
}