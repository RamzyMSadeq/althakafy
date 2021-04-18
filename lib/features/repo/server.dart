import 'package:althaqafy/values/constant.dart';
import 'package:dio/dio.dart';

class Server {
  Server._();

  static Server server = Server._();

  Dio dio;
  initDio() {
    if (dio == null) {
      dio = Dio();
      return dio;
    } else {
      return dio;
    }
  }

  ///////////////////////////////////////////////
  getAllBooks() async {
    initDio();
    try {
      Response response = await dio.get(
        baseUrl + allBooksEndPoint,
        options: Options(
          headers: {
            Headers.contentTypeHeader: 'application/json',

            // 'Authorization':
            //     'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiM2M3OGZlODM5Zjg3NjdmMzU2ZWNkMDlkYmY1ZmY2ZDliY2M1MmNhYjA4NTZiNGIyYTZiMTRjZDY1MDAyYzQ5MTI2YWM1Njc4ZjQzOGMzZTUiLCJpYXQiOjE2MTAwMDgzMjgsIm5iZiI6MTYxMDAwODMyOCwiZXhwIjoxNjQxNTQ0MzI4LCJzdWIiOiI5Iiwic2NvcGVzIjpbXX0.vrOWK3G6LX7LRN_vRJ3dRhA4_gXoJVrXWHPvJx72VcyTYwMnmsaw82uKlhwjhnCjRFTcO-h3Ljlj6L3uC88-cewS8SgnIOr-ILAC7rISpSyxhMsnb3ims6HnS5KOHBkaIXrOj1kBQUmdRAO1S6ic0_RRsYDDWVGBG4GfpvALlsvqE5X7jQGSOCi8kVgzrTgpxsTnXJPcQ27JFAeCRDUgczW-7d1aJE2Bs6-MPTz76YHH1fTe04moQO1MG9_m-2mqGMmE0d972D1HidPcOSr1CKcYAvsFgPODM4GmnLsTW6NIQ52g7vUNcfI51mgZ3nwuJ359-akfLMlB1jyghmwvhrkhYKColN7tyz7PRkbgWRFa5L2SoLEN3o9Fgye9a0UZ9iMQ9HC3kYomG372ItxBDO3UX6KqIgJsReNMn6RRGMGO4wge6qwR9S8lOlGNNuLPC7W8UP1W85MHtNT-f5uukN1FIBr_eCSwFEsktsWLQZCo-4lsSr12Bv0xGcIHEONFru1Qk2YoCjGdpyMMG8VKCrwiXqBOPdV18lm48YqWKxQ5gI2Rqy3k5b2x2IRHGj1S5UtavNrcrKUNiRn3Le9pBzSG7USr1wVfDowz0U3EGgtOHrZU1ksMwgvtmmGPcyGb7M7JoWILNFqiXF7TyPRqAWy2ed_ZG3f9A2agYGn6OOE'
          },
        ),
      );
      print("4444444444444444444444444444 ${response.data}");
      return response.data;
    } catch (e) {
      return null;
    }
  }

  ///////////////////////////////////////////////
  sendContactUs(String name, String email, String message) async {
    initDio();
    try {
      Map data1 = {'name': name, 'email':email , 'content' : message};

      // FormData data =
      //     FormData.fromMap({'name': name, 'email': email, 'content': message});
      Response response = await dio.post(
        baseUrl + contactUsEndPoint,
        data: data1,
        options: Options(
          headers: {
            Headers.contentTypeHeader: 'application/json',
           // Headers.acceptHeader: '*/*',
            // 'Authorization':
            //     'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiM2M3OGZlODM5Zjg3NjdmMzU2ZWNkMDlkYmY1ZmY2ZDliY2M1MmNhYjA4NTZiNGIyYTZiMTRjZDY1MDAyYzQ5MTI2YWM1Njc4ZjQzOGMzZTUiLCJpYXQiOjE2MTAwMDgzMjgsIm5iZiI6MTYxMDAwODMyOCwiZXhwIjoxNjQxNTQ0MzI4LCJzdWIiOiI5Iiwic2NvcGVzIjpbXX0.vrOWK3G6LX7LRN_vRJ3dRhA4_gXoJVrXWHPvJx72VcyTYwMnmsaw82uKlhwjhnCjRFTcO-h3Ljlj6L3uC88-cewS8SgnIOr-ILAC7rISpSyxhMsnb3ims6HnS5KOHBkaIXrOj1kBQUmdRAO1S6ic0_RRsYDDWVGBG4GfpvALlsvqE5X7jQGSOCi8kVgzrTgpxsTnXJPcQ27JFAeCRDUgczW-7d1aJE2Bs6-MPTz76YHH1fTe04moQO1MG9_m-2mqGMmE0d972D1HidPcOSr1CKcYAvsFgPODM4GmnLsTW6NIQ52g7vUNcfI51mgZ3nwuJ359-akfLMlB1jyghmwvhrkhYKColN7tyz7PRkbgWRFa5L2SoLEN3o9Fgye9a0UZ9iMQ9HC3kYomG372ItxBDO3UX6KqIgJsReNMn6RRGMGO4wge6qwR9S8lOlGNNuLPC7W8UP1W85MHtNT-f5uukN1FIBr_eCSwFEsktsWLQZCo-4lsSr12Bv0xGcIHEONFru1Qk2YoCjGdpyMMG8VKCrwiXqBOPdV18lm48YqWKxQ5gI2Rqy3k5b2x2IRHGj1S5UtavNrcrKUNiRn3Le9pBzSG7USr1wVfDowz0U3EGgtOHrZU1ksMwgvtmmGPcyGb7M7JoWILNFqiXF7TyPRqAWy2ed_ZG3f9A2agYGn6OOE'
          },
        ),
      );
      print("4444444444444444444444444444 ${response.data}");
      return response.data;
    } catch (e) {
      return null;
    }
  }

  ///////////////////////////////////////////////
  getAllAboutMe() async {
    initDio();
    try {
      Response response = await dio.post(
        baseUrl + allAboutMeEndPoint,
        options: Options(
          headers: {
            Headers.contentTypeHeader: 'application/json',

            // 'Authorization':
            //     'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiM2M3OGZlODM5Zjg3NjdmMzU2ZWNkMDlkYmY1ZmY2ZDliY2M1MmNhYjA4NTZiNGIyYTZiMTRjZDY1MDAyYzQ5MTI2YWM1Njc4ZjQzOGMzZTUiLCJpYXQiOjE2MTAwMDgzMjgsIm5iZiI6MTYxMDAwODMyOCwiZXhwIjoxNjQxNTQ0MzI4LCJzdWIiOiI5Iiwic2NvcGVzIjpbXX0.vrOWK3G6LX7LRN_vRJ3dRhA4_gXoJVrXWHPvJx72VcyTYwMnmsaw82uKlhwjhnCjRFTcO-h3Ljlj6L3uC88-cewS8SgnIOr-ILAC7rISpSyxhMsnb3ims6HnS5KOHBkaIXrOj1kBQUmdRAO1S6ic0_RRsYDDWVGBG4GfpvALlsvqE5X7jQGSOCi8kVgzrTgpxsTnXJPcQ27JFAeCRDUgczW-7d1aJE2Bs6-MPTz76YHH1fTe04moQO1MG9_m-2mqGMmE0d972D1HidPcOSr1CKcYAvsFgPODM4GmnLsTW6NIQ52g7vUNcfI51mgZ3nwuJ359-akfLMlB1jyghmwvhrkhYKColN7tyz7PRkbgWRFa5L2SoLEN3o9Fgye9a0UZ9iMQ9HC3kYomG372ItxBDO3UX6KqIgJsReNMn6RRGMGO4wge6qwR9S8lOlGNNuLPC7W8UP1W85MHtNT-f5uukN1FIBr_eCSwFEsktsWLQZCo-4lsSr12Bv0xGcIHEONFru1Qk2YoCjGdpyMMG8VKCrwiXqBOPdV18lm48YqWKxQ5gI2Rqy3k5b2x2IRHGj1S5UtavNrcrKUNiRn3Le9pBzSG7USr1wVfDowz0U3EGgtOHrZU1ksMwgvtmmGPcyGb7M7JoWILNFqiXF7TyPRqAWy2ed_ZG3f9A2agYGn6OOE'
          },
        ),
      );
      print("4444444444444444444444444444 ${response.data}");
      return response.data;
    } catch (e) {
      return null;
    }
  }

   ///////////////////////////////////////////////
  getAllLocations() async {
    initDio();
    try {
      Response response = await dio.get(
        baseUrl + allLocationsEndPoint,
        options: Options(
          headers: {
            Headers.contentTypeHeader: 'application/json',

            // 'Authorization':
            //     'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiM2M3OGZlODM5Zjg3NjdmMzU2ZWNkMDlkYmY1ZmY2ZDliY2M1MmNhYjA4NTZiNGIyYTZiMTRjZDY1MDAyYzQ5MTI2YWM1Njc4ZjQzOGMzZTUiLCJpYXQiOjE2MTAwMDgzMjgsIm5iZiI6MTYxMDAwODMyOCwiZXhwIjoxNjQxNTQ0MzI4LCJzdWIiOiI5Iiwic2NvcGVzIjpbXX0.vrOWK3G6LX7LRN_vRJ3dRhA4_gXoJVrXWHPvJx72VcyTYwMnmsaw82uKlhwjhnCjRFTcO-h3Ljlj6L3uC88-cewS8SgnIOr-ILAC7rISpSyxhMsnb3ims6HnS5KOHBkaIXrOj1kBQUmdRAO1S6ic0_RRsYDDWVGBG4GfpvALlsvqE5X7jQGSOCi8kVgzrTgpxsTnXJPcQ27JFAeCRDUgczW-7d1aJE2Bs6-MPTz76YHH1fTe04moQO1MG9_m-2mqGMmE0d972D1HidPcOSr1CKcYAvsFgPODM4GmnLsTW6NIQ52g7vUNcfI51mgZ3nwuJ359-akfLMlB1jyghmwvhrkhYKColN7tyz7PRkbgWRFa5L2SoLEN3o9Fgye9a0UZ9iMQ9HC3kYomG372ItxBDO3UX6KqIgJsReNMn6RRGMGO4wge6qwR9S8lOlGNNuLPC7W8UP1W85MHtNT-f5uukN1FIBr_eCSwFEsktsWLQZCo-4lsSr12Bv0xGcIHEONFru1Qk2YoCjGdpyMMG8VKCrwiXqBOPdV18lm48YqWKxQ5gI2Rqy3k5b2x2IRHGj1S5UtavNrcrKUNiRn3Le9pBzSG7USr1wVfDowz0U3EGgtOHrZU1ksMwgvtmmGPcyGb7M7JoWILNFqiXF7TyPRqAWy2ed_ZG3f9A2agYGn6OOE'
          },
        ),
      );
      print("66666666666666666666666666 ${response.data}");
      return response.data;
    } catch (e) {
      return null;
    }
  }
}
