import 'package:learn_dart_together/24_03_11/wand.dart';
import 'package:learn_dart_together/24_03_11/wizard.dart';
import 'package:test/test.dart';

void main() {
  group('wizard 클래스', () {
    test('name 속성에 3글자 미만을 할당하면 Exception이 난다.', () {
      // Given When Then
      expect(
              () => Wizard(name: '마법', hp: 100, wand: Wand(name: '완드이름', power: 0.5)),
          throwsA(predicate((e) =>
          e is Exception &&
              e.toString() == 'Exception: 이름은 3글자 이상이어야 합니다.')));
    });

    test('hp속성에 음수를 입력하면 0으로 보정된다.', () {
      // Given
      String name = '마법사';
      int hp = -1;

      // When
      Wizard wizard = Wizard(name: name, hp: hp, wand: Wand(name: '완드이름', power: 0.5));

      // Then
      expect(wizard.hp, equals(0));
    });
  });
}