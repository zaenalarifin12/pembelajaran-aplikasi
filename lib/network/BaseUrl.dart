class BaseUrl {
  static String baseUrl = "http://192.168.42.30:8000/";
  static String api = baseUrl + "api/";
  static String image = baseUrl + "storage/";

  // ===== MATERI =======
  static String materi = api + "materi";
  static String showMateri(int id) {
    return "$materi/$id";
  }

  // ==== GAME ====
  static String game = api + "game";
  static String showGame(int id) {
    return "$game/$id";
  }

  // ===== TUGAS =======
  static String tugas = api + "tugas";
  static String showTugas(int id) {
    return "$tugas/$id";
  }
}
