import 'package:bloc/bloc.dart';
import 'package:dio/dio.dart';
import 'package:flutter_dio/common/app_env.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dio/user.dart';


part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.dio) : super(InititalState());
  final Dio dio;
  Future<void> SignUp(User user)async{
    try{
        var result = await dio.put(AppEnv.auth, data: user);
        var data = User.fromJson(result.data['data']) ;
        if(result.statusCode == 200){
          if(data.token == null){
            throw DioError(requestOptions: RequestOptions(path: ''), error: "токен равен нулю");
          }
        }
    } on DioError catch(e){
      emit(ErrorState(e.response!.data['message']));
    }
  }
}
