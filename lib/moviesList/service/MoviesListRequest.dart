import 'package:moviesapp/network/APIRequest.dart';
import 'package:moviesapp/network/APIRequestMethod.dart';

class MoviesListRequest extends APIRequest {
  int _page;

  MoviesListRequest(this._page){
    _page = _page;
  }

  @override
  APIRequestMethod get method => APIRequestMethod.get;

  @override
  Map<String, dynamic> get parameters => {"page": "$_page"};

  @override
  String get path => "movie/popular";
}
