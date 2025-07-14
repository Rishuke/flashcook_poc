import '../../presentation/bloc/menus_bloc/menus_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


extension BuildContextExtensions on BuildContext {
  bool get isMobile => MediaQuery.sizeOf(this).width < 600;

  MenusBloc get menuBloc => read<MenusBloc>();


  void removeAllFocus() {
    FocusManager.instance.primaryFocus?.unfocus();
  }
}
