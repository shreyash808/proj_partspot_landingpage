class ApiUrl {
  static String baseUrl = '';
  static String socketUrl = '';

  static const devUrl = 'http://192.168.1.66:8000/api';
  static const stagingUrl = 'https://stg-partyspotoxygen.approd.ca/api/v1/';
  static const prodUrl = 'https://devop-partyspot.approd.ca/api/v1/';

  static const socketDevUrl = 'https://devop-partyspot.approd.ca/';
  static const socketStagUrl = 'https://stg-partyspotoxygen.approd.ca/';
  static const socketProdUrl = 'https://devop-partyspot.approd.ca/';

  static const socialLogin = '/auth/social-login';
}
