class Ffunction {
  Ffunction.demo();

  static Ffunction instance = Ffunction.demo();

  factory Ffunction() {
    return instance;
  }

  final image = 'assets/images/squidGame.jpg';
}
