import 'package:flutter_library/screens/state/mvp2/mvp2_model.dart';
import 'package:flutter_library/screens/state/mvp2/mvp2_screen.dart';
import 'package:flutter_library/screens/state/mvp2/mvp2_view.dart';

class Mvp2State extends ExtraState<Mvp2View, Mvp2Model> {
  Mvp2State(Mvp2View view, Mvp2Model model) : super(view, model);

  void onIncrementCounter() => setState(() => model = model.increment());
}