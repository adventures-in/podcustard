import 'package:podcustard/actions/signin_with_apple_action.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/services/auth_service.dart';
import 'package:redux/redux.dart';

class SigninWithAppleMiddleware
    extends TypedMiddleware<AppState, SigninWithAppleAction> {
  SigninWithAppleMiddleware(AuthService authService)
      : super((store, action, next) async {
          next(action);

          // signin and listen to the stream and dispatch actions
          authService.appleSignInStream.listen(store.dispatch);
        });
}
