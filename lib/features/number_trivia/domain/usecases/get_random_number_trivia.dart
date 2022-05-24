import 'package:clean_tdd_flutter/core/error/failures.dart';
import 'package:clean_tdd_flutter/core/usecases/usecase.dart';
import 'package:clean_tdd_flutter/features/number_trivia/domain/entities/number_trivia.dart';
import 'package:clean_tdd_flutter/features/number_trivia/domain/repositories/number_trivia_repository.dart';
import 'package:dartz/dartz.dart';

class GetRandomNumberTrivia implements UseCase<NumberTrivia, NoParams> {
  final NumberTriviaRepository repository;
  GetRandomNumberTrivia(this.repository);

  @override
  Future<Either<Failure, NumberTrivia>?> call(NoParams noParams) async {
    return await repository.getRandomNumberTrivia();
  }
}
