// import 'package:partyspot/utils/services/part_spot_api_service.dart';
// import '../../../../networking/api_urls.dart';
// import '../../../hashtags/data/model/hashtag_response_model.dart';
// import '../../../home/data/model/post_response_model.dart';
// import '../../domain/repository/global_search_repository.dart';
// import '../model/search_response_model.dart';
//
// class GlobalSearchRepositoryImpl extends GlobalSearchRepository {
//   final _apiService = WeUApiService();
//
//   @override
//   Future<HashtagResponseModel> searchHashtags(
//       {required int page, required int limit, required String searchKey}) async {
//     final response = await _apiService.getRequest(ApiUrl.search, queryParams: {
//       'page': page,
//       'limit': limit,
//       'searchKey': searchKey,
//       'searchType': 'hashtag',
//     });
//     return HashtagResponseModel.fromJson(response.data['data'] ?? '');
//   }
//
//   @override
//   Future<SearchResponse> searchPeople({required int page, required int limit, required String searchKey}) async {
//     final response = await _apiService.getRequest(ApiUrl.search, queryParams: {
//       'page': page,
//       'limit': limit,
//       'searchKey': searchKey,
//       'searchType': 'people',
//     });
//     return SearchResponse.fromJson(response.data);
//   }
//
//   @override
//   Future<PostResponseModel> searchPosts({required int page, required int limit, required String searchKey}) async {
//     final response = await _apiService.getRequest(ApiUrl.search, queryParams: {
//       'page': page,
//       'limit': limit,
//       'searchKey': searchKey,
//       'searchType': 'post',
//     });
//
//     return PostResponseModel.fromJson(response.data['data'] ?? '');
//   }
// }
