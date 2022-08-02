import 'package:dio/dio.dart';
import 'package:electro_peyk/app/core/exception.dart';
import 'package:electro_peyk/app/data/data_sources/local/local_data_source.dart';
import 'package:electro_peyk/app/data/data_sources/remote/remote_data_source.dart';
import 'package:electro_peyk/app/data/models/verification_model.dart';


import '../../core/either.dart';
import '../../core/failures.dart';
import '../../domain/repository/app_repository.dart';

class AppRepositoryImpl implements AppRepository {
  final AppLocalDataSource? localDataSource;
  final AppRemoteDataSource? remoteDataSource;

  AppRepositoryImpl({this.localDataSource, this.remoteDataSource});

  @override
  Future<Either<Failure, bool>> login(Map<String, dynamic> body) async {
    try {
      Response response =
          await remoteDataSource!.post(url: "user/login", body: body);
      if (response.statusCode == 200) {
        return Right(true);
      }
      return Right(false);
      // bool response = await localDataSource!.login(body['userName'],body['passWord']);
    } on ServerException catch (e) {
      return Left(
          ServerFailure(errorCode: e.errorCode, errorMessage: e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, VerificationModel>> verification(
      Map<String, dynamic> body) async {
    try {
      Response response =
          await remoteDataSource!.post(url: "user/verify", body: body);
      VerificationModel verificationModel =
          VerificationModel.fromJson(response.data);
      return Right(verificationModel);
    } on ServerException catch (e) {
      return Left(
          ServerFailure(errorCode: e.errorCode, errorMessage: e.errorMessage));
    }
  }

  @override
  Future<Either<Failure, bool>> setThemeMode(bool isDark) async {
    try {
      bool response = localDataSource!.setThemeMode(isDark);
      return Right(response);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> getThemeMode() async {
    try {
      bool response = localDataSource!.getThemeMode();
      return Right(response);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> getLanguage() async {
    try {
      bool response = localDataSource!.getLanguage();
      return Right(response);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, bool>> setLanguage(bool isEn) async {
    try {
      bool response = localDataSource!.setLanguage(isEn);
      return Right(response);
    } on CacheException catch (e) {
      return Left(CacheFailure(message: e.toString()));
    }
  }
}
