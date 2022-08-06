class Dfunction {
  Dfunction.demo();

  static Dfunction instance = Dfunction.demo();

  factory Dfunction() {
    return instance;
  }

  final images = [
    'https://images.news18.com/ibnlive/uploads/2019/10/Movies-First-Look-Sanjay-Dutt-as-Ahmad-Shah-Abdali-in-Panipat.jpg',
    'https://4.bp.blogspot.com/-dqkWYLpZ-Rg/XEGiQ8sFVXI/AAAAAAAAXO4/eSW56lyAYOMYMm2yacOT1qvx_raMD7w4wCLcBGAs/s1600/indian-2-upcoming-movie-poster-star-cast-release-date-mt-wiki.jpg',
    'https://upload.wikimedia.org/wikipedia/en/9/99/Dangal_Poster.jpg'
  ];
}
