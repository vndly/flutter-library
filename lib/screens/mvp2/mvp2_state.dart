import 'mvp2_model.dart';
import 'mvp2_screen.dart';
import 'mvp2_view.dart';

class Mvp2State extends ExtraState<Mvp2View, Mvp2Model> {
  Mvp2State(Mvp2View view, Mvp2Model model) : super(view, model);

  void onIncrementCounter() => setState(() => model = model.increment());
}