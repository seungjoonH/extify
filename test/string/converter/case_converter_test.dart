import 'package:test/test.dart';
import 'package:extify/string/converter/case_converter.dart';

void main() {
  group('StringCaseConverter', () {
    group('다양한 입력 형식에서 pascalCase로 변환', () {
      test('lower_snake_case -> PascalCase', () {
        expect(StringCaseConverter('hello_world').pascalCase, 'HelloWorld');
      });

      test('UPPER_SNAKE_CASE -> PascalCase', () {
        expect(StringCaseConverter('HELLO_WORLD').pascalCase, 'HelloWorld');
      });

      test('lower-skewer-case -> PascalCase', () {
        expect(StringCaseConverter('hello-world').pascalCase, 'HelloWorld');
      });

      test('UPPER-SKEWER-CASE -> PascalCase', () {
        expect(StringCaseConverter('HELLO-WORLD').pascalCase, 'HelloWorld');
      });

      test('PascalCase -> PascalCase', () {
        expect(StringCaseConverter('HelloWorld').pascalCase, 'HelloWorld');
      });

      test('camelCase -> PascalCase', () {
        expect(StringCaseConverter('helloWorld').pascalCase, 'HelloWorld');
      });

      test('Title Case -> PascalCase', () {
        expect(StringCaseConverter('Hello World').pascalCase, 'HelloWorld');
      });

      test('lower case -> PascalCase', () {
        expect(StringCaseConverter('hello world').pascalCase, 'HelloWorld');
      });

      test('UPPER CASE -> PascalCase', () {
        expect(StringCaseConverter('HELLO WORLD').pascalCase, 'HelloWorld');
      });
    });

    group('lower_snake_case 입력에서 모든 형식으로 변환', () {
      late StringCaseConverter converter;

      setUp(() {
        converter = StringCaseConverter('hello_world');
      });

      test('lowerSnakeCase', () {
        expect(converter.lowerSnakeCase, 'hello_world');
      });

      test('upperSnakeCase', () {
        expect(converter.upperSnakeCase, 'HELLO_WORLD');
      });

      test('lowerSkewerCase', () {
        expect(converter.lowerSkewerCase, 'hello-world');
      });

      test('upperSkewerCase', () {
        expect(converter.upperSkewerCase, 'HELLO-WORLD');
      });

      test('pascalCase', () {
        expect(converter.pascalCase, 'HelloWorld');
      });

      test('camelCase', () {
        expect(converter.camelCase, 'helloWorld');
      });

      test('titleCase', () {
        expect(converter.titleCase, 'Hello World');
      });

      test('lowerCase', () {
        expect(converter.lowerCase, 'hello world');
      });

      test('upperCase', () {
        expect(converter.upperCase, 'HELLO WORLD');
      });
    });
  });

  group('StringCaseType', () {
    group('getCaseType', () {
      test('lower_snake_case를 올바르게 판별한다', () {
        expect(
          StringCaseConverter.getCaseType('hello_world'),
          StringCaseType.lowerSnakeCase,
        );
      });

      test('UPPER_SNAKE_CASE를 올바르게 판별한다', () {
        expect(
          StringCaseConverter.getCaseType('HELLO_WORLD'),
          StringCaseType.upperSnakeCase,
        );
      });

      test('lower-skewer-case를 올바르게 판별한다', () {
        expect(
          StringCaseConverter.getCaseType('hello-world'),
          StringCaseType.lowerSkewerCase,
        );
      });

      test('UPPER-SKEWER-CASE를 올바르게 판별한다', () {
        expect(
          StringCaseConverter.getCaseType('HELLO-WORLD'),
          StringCaseType.upperSkewerCase,
        );
      });

      test('PascalCase를 올바르게 판별한다', () {
        expect(
          StringCaseConverter.getCaseType('HelloWorld'),
          StringCaseType.pascalCase,
        );
      });

      test('camelCase를 올바르게 판별한다', () {
        expect(
          StringCaseConverter.getCaseType('helloWorld'),
          StringCaseType.camelCase,
        );
      });

      test('Title Case를 올바르게 판별한다', () {
        expect(
          StringCaseConverter.getCaseType('Hello World'),
          StringCaseType.titleCase,
        );
      });

      test('lower case를 올바르게 판별한다', () {
        expect(
          StringCaseConverter.getCaseType('hello world'),
          StringCaseType.lowerCase,
        );
      });

      test('UPPER CASE를 올바르게 판별한다', () {
        expect(
          StringCaseConverter.getCaseType('HELLO WORLD'),
          StringCaseType.upperCase,
        );
      });
    });
  });
}
