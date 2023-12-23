// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'marvel_service.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _MarvelService implements MarvelService {
  _MarvelService(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://gateway.marvel.com/v1/public';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  @override
Future<Map<String, dynamic>> getCharacters(
  String timestamp,
  String publicKey,
  String hash,
) async {
  const _extra = <String, dynamic>{};
  final queryParameters = <String, dynamic>{
    r'ts': timestamp,
    r'apikey': publicKey,
    r'hash': hash,
  };
  final _headers = <String, dynamic>{};
  const Map<String, dynamic>? _data = null;
  final _result = await _dio.fetch<Map<String, dynamic>>(
    _setStreamType<Map<String, dynamic>>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
    .compose(
      _dio.options,
      '/characters',
      queryParameters: queryParameters,
      data: _data,
    )
    .copyWith(
      baseUrl: _combineBaseUrls(
        _dio.options.baseUrl,
        baseUrl,
      ),
    ),
  ));
  return _result.data!;
}


  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
