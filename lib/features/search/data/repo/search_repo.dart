import 'package:dartz/dartz.dart';
import 'package:e_teach/core/error_handler/failures.dart';
import 'package:e_teach/features/search/data/model/search_model.dart';

abstract class SearchRepo {
  Future<Either<Failure, SearchModel>> search(String courseName);
}
