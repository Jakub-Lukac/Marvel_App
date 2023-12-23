import 'package:dio/dio.dart';

import 'package:retrofit/http.dart';

part 'marvel_service.g.dart';

@RestApi(baseUrl: "https://gateway.marvel.com/v1/public")
abstract class MarvelService {
  factory MarvelService(Dio dio, {String baseUrl}) = _MarvelService;

  @GET("/characters")
  Future<Map<String, dynamic>> getCharacters(
    @Query("ts") String timestamp,
    @Query("apikey") String publicKey,
    @Query("hash") String hash,
  );
}
