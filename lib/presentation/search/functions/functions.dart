class Sfunction {
  Sfunction.demo();

  static Sfunction instance = Sfunction.demo();

  factory Sfunction() {
    return instance;
  }

  final image =
      'https://assets-prd.ignimgs.com/2022/05/12/stranger-things-4-poster-1652364986162.jpeg';
}
