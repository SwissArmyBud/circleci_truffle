import "package:test/test.dart";
import 'package:dart_prop/libexport.dart' as libs;

class TestRig {
  int _in;
  String _out;
  TestRig(int intIn, String strOut){
    _in = intIn;
    _out = strOut;
  }
}

var tests = [
    TestRig(1, "negative"),
    TestRig(5, "small"),
];

main() {

  setUp(() async {
    // Do async setup stuffs
    print("Testing suite setup finished...");
  });

  test("Validate sizing library against TestRig", () {
    for (var testCase in tests) {
      expect(testCase._out, equals(libs.Size(testCase._in)));
    }
  });

  tearDown(() async {
    // Do async cleanup stuffs
    print("Testing suite teardown finished...");
  });
}
