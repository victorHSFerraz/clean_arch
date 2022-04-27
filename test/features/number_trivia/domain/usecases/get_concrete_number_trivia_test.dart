import 'package:clean_tdd_flutter/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_tdd_flutter/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:clean_tdd_flutter/features/number_trivia/domain/usecases/get_concrete_number_trivia.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockNumberTriviaRepository extends Mock implements NumberTriviaRepository {}

void main() {
  GetConcreteNumberTrivia? usecase;
  MockNumberTriviaRepository? mockNumberTriviaRepository;

  setUp(() {
    mockNumberTriviaRepository = MockNumberTriviaRepository();
    usecase = GetConcreteNumberTrivia(mockNumberTriviaRepository!);
  });

  final testNumber = 1;
  const testNumberTrivia = NumberTrivia(text: 'test', number: 1);

  test(
    'should get trivia for the number from repository',
    () async {
      // arrange
      when(mockNumberTriviaRepository!.getConcreteNumberTrivia(any)).thenAnswer((_) async => const Right(testNumberTrivia));
      // act
      final result = await usecase!.execute(number: testNumber);
      // assert
      expect(result, const Right(testNumberTrivia));
      verify(mockNumberTriviaRepository!.getConcreteNumberTrivia(testNumber));
      verifyNoMoreInteractions(mockNumberTriviaRepository);
    },
  );
}
