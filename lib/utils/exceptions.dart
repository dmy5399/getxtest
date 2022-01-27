class InternetConnectionException implements Exception {
  String errorMessage(){
    return "No internet connection";
  }
}