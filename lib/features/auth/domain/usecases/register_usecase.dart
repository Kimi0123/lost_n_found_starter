import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lost_n_found/core/error/failures.dart';
import 'package:lost_n_found/core/usecases/app_usecase.dart';
import 'package:lost_n_found/features/auth/data/repositories/auth_repository.dart';
import 'package:lost_n_found/features/auth/domain/entities/auth_entity.dart';
import 'package:lost_n_found/features/auth/domain/repositories/auth_repository.dart';

class RegisterUseCaseParams extends Equatable {
  final String fullName;
  final String email;
  final String? phoneNumber;
  final String? batchId;
  final String username;
  final String? password;

  const RegisterUseCaseParams({required this.fullName, required this.email, required this.phoneNumber, required this.batchId, required this.username, required this.password});


  @override
  List<Object?> get props => [fullName, email, phoneNumber, batchId, username, password];
}

final registerUsecaseProvider = Provider<RegisterUsecase>((ref) {
  final authRepository = ref.read(authRepositoryProvider);
  return RegisterUsecase(authRepository: authRepository);
});

class RegisterUsecase implements UsecaseWithParams<bool,RegisterUseCaseParams>{

  final IAuthRepository _authRepository;

  RegisterUsecase({required IAuthRepository authRepository}) : _authRepository = authRepository;

  @override
  Future<Either<Failure, bool>> call(RegisterUseCaseParams params) {
   final entity = AuthEntity(
     fullName: params.fullName,
     email: params.email,
     phoneNumber: params.phoneNumber,
     batchId: params.batchId,
     username: params.username,
     password: params.password,
   );return _authRepository.register(entity);
  }
}