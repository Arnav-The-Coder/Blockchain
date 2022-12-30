import Debug "mo:base/Debug";
import Time "mo:base/Time";
import Float "mo:base/Float";

actor DBank {
  // This changes the persistences of the variable from flexible (default) to stable
  // It will go back to its last value even after being refreshed or updated, not to it's orginal variable value

  stable var currentValue: Float = 300;

  // Changes the value of the variable
  // currentValue := 300;

  // Displays number of nanoseconds since 1970, January 1

  stable var startTime = Time.now();
  // startTime := Time.now();
  Debug.print(debug_show(startTime));

  let id = 2430957293847524;
  // Debug.print(debug_show(id));

  public func topUp(amount: Float) {
    currentValue += amount;

  // Prints a Natural Number

    Debug.print(debug_show(currentValue));
  };

  // Creates a function that is not private and can be seen by the program

  public func withdraw(amount: Float) {
    let tempValue: Float = currentValue - amount;

    if (tempValue >= 0) {
      currentValue -= amount;
      Debug.print(debug_show(currentValue));
    } else {
      Debug.print("The amount is too large, now the currentValue is less than zero.");
    }
  };

  public query func checkBalance(): async Float {
    return currentValue;
  }; 

  // topUp();

  public func compound() {
    let currentTime = Time.now();
    let timeElapsedNS = currentTime - startTime;
    let timeElapsedS = timeElapsedNS / 1000000000;

    // Hard to convert Nat to Float, so change everything else to a float to avoid difficulties
    currentValue := currentValue * (1.01 ** Float.fromInt(timeElapsedS));
    startTime := currentTime;
  };
}