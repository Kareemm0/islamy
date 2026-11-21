import 'package:fpdart/fpdart.dart';

import '../../../../core/errors/failure.dart';
import '../entities/azkar_item.dart';

abstract interface class AzkarRepository {
  Future<Either<Failure, List<AzkarItem>>> getAzkarItems();
}
