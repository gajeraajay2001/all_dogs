import 'package:get/get.dart';
import '../../main.dart';
import '../routes/app_pages.dart';

const imagePath = "assets/images/";
const baseUrl = "https://alldogs.in/api/";
const imageBaseUrl = "https://alldogs.in/public/uploads/";

class ApiConstant {
  static const homeDataApi = "home";
  static const signup = "signup";
  static const login = "login";
  static const resetPassword = "reset-password";
  static const getPostDetailsApi = "post/details/";
  static const getBlogDetailsApi = "blog/details/";
  static const likePostApi = "/post/like-post/";
  static const breederListApi = "breeder/list";
  static const breedsListApi = "breed/list";
  static const blogsListApi = "blog/list";
  static const puppiesPostListApi = "post/list";
  static const commentApi = "blog/comment/";
}

class ArgumentConstant {
  static const postId = "postId";
  static const token = "token";
}

getLogOut() {
  box.write(ArgumentConstant.token, "");
  Get.offAllNamed(Routes.HOME_SCREEN);
}
