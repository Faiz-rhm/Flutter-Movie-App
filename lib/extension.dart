
enum MoviesType { popular, latest, now_playing, top_rated, upcoming }

extension MovieTypeExtension on MoviesType {
  String get value => toString()
      .split('.')
      .last;
  String get name {
    String name;
    switch (this) {

      case MoviesType.popular:
        name = "Popular";
        break;
      case MoviesType.latest:
        name = "Latest";
        break;
      case MoviesType.now_playing:
        name = "Now Playing";
        break;
      case MoviesType.top_rated:
        name = "Top rated";
        break;
      case MoviesType.upcoming:
        name = "Upcoming";
        break;
    }
    return name;
  }
}