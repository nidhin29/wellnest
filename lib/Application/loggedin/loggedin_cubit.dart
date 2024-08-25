import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:wellnest/Domain/LoggedIn/logged_in_service.dart';

part 'loggedin_state.dart';
part 'loggedin_cubit.freezed.dart';

@injectable
class LoggedinCubit extends Cubit<LoggedinState> {
  final LoggedInService loggedInService;
  LoggedinCubit(this.loggedInService) : super(LoggedinState.initial());
  
     isLoggedIn() async {
    await Future.delayed(const Duration(seconds: 4));
    final  response = await loggedInService.isLoggedIn();
    emit(state.copyWith(value: response));  
  }
  
}
