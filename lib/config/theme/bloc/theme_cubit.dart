
import 'package:bloc/bloc.dart';
import 'package:handle_permissions_with_bloc/common/utils/prefs_operator.dart';
import 'package:handle_permissions_with_bloc/locator.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {

  ThemeCubit() : super(ThemeState(isDark: false));

  void changeThemeMode(bool value) {
    PrefsOperator prefsOperator = locator<PrefsOperator>();
    prefsOperator.changeThemeModeState(value);
    emit(state.copyWith(changeMode: value));
  }
}
