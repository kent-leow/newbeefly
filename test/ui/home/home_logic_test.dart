import 'package:flutter_test/flutter_test.dart';
import 'package:newbeefly/ui/views/home/home_logic.dart';

void main(){
  group('HomeLogic', (){
    test('count value should be incremented', () {
      final logic = HomeLogic();

      logic.increment();

      expect(logic.count.value, 1);
    });

    test('factorial method', () {
      final logic = HomeLogic();

      expect(logic.factorial(5), 120);
      expect(logic.factorial(4), 24);
    });
  });

}