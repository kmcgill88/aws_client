import 'package:shared_aws_api/src/validation/utils.dart';
import 'package:test/test.dart';

void main() {
  group('validate patterns', () {
    test('null name is ok', () {
      validateStringPattern(null, '666', r'\d{3}');
    });

    test('null value is an ArgumentError', () {
      expect(() => validateStringPattern('null value', null, r'\d{3}'),
          throwsA(TypeMatcher<ArgumentError>()));
    });

    test('null pattern is an ArgumentError', () {
      expect(() => validateStringPattern('null pattern', '666', null),
          throwsA(TypeMatcher<ArgumentError>()));
    });
  });

  group('validate string length', () {
    test('null name is ok', () {
      validateStringLength(null, '666', 3, 666);
    });

    test('null value is an ArgumentError', () {
      expect(() => validateStringLength('null', null, 3, 666),
          throwsA(TypeMatcher<ArgumentError>()));
    });

    test('null min is an ArgumentError', () {
      expect(() => validateStringLength('name', '666', null, 666),
          throwsA(TypeMatcher<ArgumentError>()));
    });

    test('null max is an ArgumentError', () {
      expect(() => validateStringLength('name', '666', 0, null),
          throwsA(TypeMatcher<ArgumentError>()));
    });
  });
}
