import 'package:flutter_test/flutter_test.dart';
import 'package:first_aid_app/widgets/cpr_timer_content.dart';

void main() {
  group('formatElapsed', () {
    test('zero duration shows 0:00', () {
      expect(formatElapsed(Duration.zero), '0:00');
    });

    test('single digit seconds are zero-padded', () {
      expect(formatElapsed(const Duration(seconds: 5)), '0:05');
    });

    test('rolls over at 60 seconds', () {
      expect(formatElapsed(const Duration(seconds: 65)), '1:05');
    });

    test('large value near one hour', () {
      expect(formatElapsed(const Duration(seconds: 3599)), '59:59');
    });
  });

  group('bpmToInterval', () {
    test('100 BPM gives 600ms interval', () {
      expect(bpmToInterval(100), 600);
    });

    test('120 BPM gives 500ms interval', () {
      expect(bpmToInterval(120), 500);
    });

    test('110 BPM rounds to nearest millisecond', () {
      expect(bpmToInterval(110), 545);
    });
  });
}
