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
  static const postCreateApi = "post/create";
  static const userProfileApi = "user/profile";
  static const getUserProfile = "/user/profile";
  static const deletePost = "/post/delete/";
  static const deletePostPic = "/post/edit/";
  static const editPost = "/post/edit/";
  static const breedsDetailsApi = "/breed/details/";
  static const breedsCommentApi = "/breed/comment/";
  static const aboutUsApi = "/about-us";
  static const contactUsApi = "/contact-us";
  static const deleteUser = "user/delete";
  static const videoListApi = "video/list";
}

class ArgumentConstant {
  static const postId = "postId";
  static const breedersId = "breedersId";
  static const userId = "userId";
  static const name = "name";
  static const number = "number";
  static const token = "token";
  static const password = "password";
  static const isFromBreeder = "isFromBreeder";
  static const breederName = "breederName";
  static const breederId = "breederId";
  static const isForEditPost = "isForEditPost";
}

getLogOut() {
  box.write(ArgumentConstant.token, "");
  box.write(ArgumentConstant.password, "");
  box.write(ArgumentConstant.userId, "");
  box.write(ArgumentConstant.name, "");
  box.write(ArgumentConstant.number, "");
  Get.offAllNamed(Routes.HOME_SCREEN);
}

String getYoutubeThumbnail({required String videoId}) {
  return "https://img.youtube.com/vi/$videoId/hqdefault.jpg";
}
