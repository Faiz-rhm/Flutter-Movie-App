class EnvironmentConfig {
  static
  const BASE_URL = String.fromEnvironment('BASE_URL',
      defaultValue: "https://api.themoviedb.org/3/");
  static
  const IMAGE_BASE_URL = String.fromEnvironment('IMAGE_BASE_URL',
      defaultValue: "https://image.tmdb.org/t/p/w300_and_h450_bestv2/");
  static
  const IMAGE_BASE_URL_COVER = String.fromEnvironment('IMAGE_BASE_URL',
      defaultValue: "https://image.tmdb.org/t/p/w355_and_h200_multi_faces/");
  static
  const API_KEY = String.fromEnvironment('API_KEY',
      //Todo put your api key here
      defaultValue: "");
}