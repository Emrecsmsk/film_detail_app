import 'package:get/get.dart';

class Language extends Translations {
  @override
  Map<String, Map<String, String>> get keys => {
        'en_US': {
          'title': 'Pinsoft Film',
          'search': 'Search Film',
          'top': 'Top Films',
          'plot': 'Plot Summary',
          'cast': 'Cast & Crew',
          'connectionError': 'Please check your internet connection!',
        },
        'tr_TR': {}
      };
}
