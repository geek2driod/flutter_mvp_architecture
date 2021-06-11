import 'package:http/http.dart' as http;

abstract class NetworkHelper {
  Future<http.Response> get(String url, {Map headers});

  Future<http.Response> post(String url, {Map headers, body, encoding});

  Future<http.Response> multipart(String url,
      {Map headers,
      body,
      encoding,
      Map<String, String> fields,
      List<http.MultipartFile> files,
      bool modifyHeader = true,
      bool gzip = true});

  Future<http.Response> delete(String url, {Map headers});

  Future<http.Response> put(String url, {Map headers, body, encoding});

  Map appendHeader({Map headers});

  http.Response handleResponse(http.Response response);
}
