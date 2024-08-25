import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wellnest/Domain/TokenManager/token_manager.dart';
import 'package:wellnest/Domain/TokenManager/token_service.dart';

@LazySingleton(as: TokenService)
class TokenRepo implements TokenService {
  @override
  Future deleteEmail() async {
    final sharedPref = SharedPreferences.getInstance();
    sharedPref.then((value) {
      value.remove('email');
    });
    return;
  }

  @override
  Future saveEmail() async {
    final sharedPref = await SharedPreferences.getInstance();
    await sharedPref.setString('email', TokenManager.instance.email!);
    return;
  }
}
