class Mvp2Model {
  final String title;
  final int counter;

  const Mvp2Model(this.title, this.counter);

  Mvp2Model increment() => Mvp2Model(title, counter + 1);
}
