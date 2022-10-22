mixin LottieMixin {
  late String notFound = ok(_lottie.notFound.name);
  late String noInternetConnection = ok(_lottie.noInternetConnection.name);
  late String loading = ok(_lottie.loading.name);

  String ok(String lottie) {
    return "assets/lottie/$lottie.json";
  }
}

enum _lottie { notFound, noInternetConnection, loading }
