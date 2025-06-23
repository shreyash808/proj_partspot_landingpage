class ApiUrl {
  static String baseUrl = '';

  static const devUrl = 'http://192.168.1.8:3000';
  static const stagingUrl = 'http://192.168.1.8:3000';
  static const prodUrl = 'http://192.168.1.8:3000';

  static const socketDevUrl = 'https://devop-partyspot.approd.ca/';
  static const socketStagUrl = 'https://stg-partyspotoxygen.approd.ca/';
  static const socketProdUrl = 'https://devop-partyspot.approd.ca/';

  static const socialLogin = '/auth/social-login';
  static const loginPhone = '/users/register-login';
  static const verifyOtp = '/users/verify-otp';
  static const resendOtp = '/users/resend-otp';
  static const getProfile = '/users/get-profile';
  static const profile = '/users/profile';
  static const eventsMetaData = '/events/get-event-meta';
}
