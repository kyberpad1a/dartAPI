part of 'auth_cubit.dart';


abstract class AuthState{
  const AuthState();
}
class InititalState extends AuthState{}

class ErrorState extends AuthState{
  final String message;
  ErrorState(this.message);

}
class SuccessState extends AuthState{}
