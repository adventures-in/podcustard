import 'package:podcustard/actions/signin_with_google_action.dart';
import 'package:podcustard/models/app_state.dart';
import 'package:podcustard/services/auth_service.dart';
import 'package:redux/redux.dart';

class SigninWithGoogleMiddleware
    extends TypedMiddleware<AppState, SigninWithGoogleAction> {
  SigninWithGoogleMiddleware(AuthService authService)
      : super((store, action, next) async {
          next(action);

          // signin and listen to the stream and dispatch actions
          authService.googleSignInStream.listen(store.dispatch);
        });
}
