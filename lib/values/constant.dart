import 'package:flutter/material.dart';

 getWidthMedia( int width , BuildContext context) {
  return MediaQuery.of(context).size.width * (width / 375);
}

getHeightMedia( int height , BuildContext context) {
  return MediaQuery.of(context).size.height * (height / 812);
}

// List<OnBoardingModel> onboardingList = [
//   OnBoardingModel(
//       arTitle: 'تسوق أون لاين',
//       arDescription:
//           'تصفح داخل المتاجر اون لاين واطلب اللي بدك إياه والباقي سيبه علينا',
//       image: onboarding1SvgsName),
//   OnBoardingModel(
//     arTitle: 'طلبك واصل لحد بيتك',
//     arDescription:
//         'الديليفري جاهز ليوصل طلبك من المتجر لباب بيتك من دون أي تعب',
//     image: onboarding2SvgsName,
//   ),
//   OnBoardingModel(
//     arTitle: 'الدفع اون لاين او عند الاستلام',
//     arDescription:
//         'مش مهم كيف تدفع ، وفرنالك الدفع بالطريقتين الكاش والاون لاين',
//     image: onboarding3SvgsName,
//   ),
// ];



// ============ baseUrl ================
String baseUrl = 'https://salthaqafy.com/books_api/';
//String baseUrl2 = 'http://palphenix.com/vendors/public/images/';
//------------------------------------------------------------------
String allBooksEndPoint = 'fetch_books.php';
 String contactUsEndPoint = 'send_message.php';
 String allAboutMeEndPoint = 'fetch_cv.php';



