class AppConstatns {
  static const String appLink =
      "Hello  , i am mustafa owener of this app share this app from my webstie https://mustafagamalm.com";
  static const loginEndPoint = "login";
  static const registerEndPoint = "register";
  static const removeUserEndPoint = "remove_user";
  static const String coursesEndPoint = "show_all_course";
  static const String logoutEndPoint = "logout";
  static const String singleCourseEndPoint = "show_videos_course_id";
  static const String getProfileEndPoint = "get_profile";
  static const String updateProfileEndPoint = "update_user";
  static const String getRoomEndPoint = "show_all_room";
  static const String searchCourseEndPoint = "search_course";
  static const String myCoursesEndPoint = "get_my_courses";
  static const String createCourseEndPoint = "create_courses";
  static const String uploadCourseEndPoint = "upload_videos_course_id";

  static const String myRoomEndPoint = "get_my_rooms";
  static const String createMyRoomEndPoint = "create_room";
  static const String roomChatId = "join_to_room";
  // PAY MOB ===============================
  static const String baseUrl = "https://accept.paymob.com/api/";
  static const String authEndPoint = "auth/tokens";
  static const String orderEndPoint = "ecommerce/orders";
  static const String paymentKeyEndPoint = "acceptance/payment_keys";
  static const String refCodeEndPoint = "acceptance/payments/pay";

  static const String apiKey =
      "ZXlKaGJHY2lPaUpJVXpVeE1pSXNJblI1Y0NJNklrcFhWQ0o5LmV5SmpiR0Z6Y3lJNklrMWxjbU5vWVc1MElpd2ljSEp2Wm1sc1pWOXdheUk2TnpRek1EVTBMQ0p1WVcxbElqb2lhVzVwZEdsaGJDSjkuajJJOW9WQm1tRXJuSzhZdGM3aWU0bHhxdWVzREpMX1laRmFIOHFBdzBfWGhrR2xReTVidTd2TlRYZkNHUlkzRmlyd0dIWVBZMkw5Q3dLZDNpRnQzRmc=";

  static String authTokenFirst = "";
  static int orderId = 0;
  static String finalPaymentToken = "";

  static int refCode = 0;
  static var kioskId = 3734684;
  static var paymentCardId = 3731392;

  // kiosk payment
  static const String kioskPaymentEndPoint = "acceptance/payments/pay";

  static String viseUrl =
      "${baseUrl}acceptance/iframes/752629?payment_token=$finalPaymentToken";
  static String walletUrl = "";
}
