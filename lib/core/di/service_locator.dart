
import 'package:dio/dio.dart';
import 'package:eraasoft_project/core/networking/dio_factory.dart';
import 'package:eraasoft_project/features/register/data/repo/register_repo.dart';
import 'package:get_it/get_it.dart';


GetIt getIt =GetIt.instance;
Future<void>setupGetIt()async{

  Dio dio =await DioFactory.getDio();
getIt.registerLazySingleton<RegisterRepo>(()=>RegisterRepo(getIt()));

}