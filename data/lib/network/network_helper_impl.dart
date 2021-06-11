import 'dart:convert';
import 'package:http/http.dart' as http;
import 'network_helper.dart';

class NetworkHelperImpl extends NetworkHelper {
  @override
  Future<http.Response> get(String url, {Map headers}) {
    return http.get(url, headers: appendHeader(headers: headers)).then((
      http.Response response,
    ) {
      return handleResponse(response);
    });
  }

  @override
  Future<http.Response> post(String url, {Map headers, body, encoding}) {
    return http
        .post(url,
            body: json.encode(body),
            headers: appendHeader(headers: headers),
            encoding: encoding)
        .then((http.Response response) {
      return handleResponse(response);
    });
  }

  @override
  Future<http.Response> multipart(String url,
      {Map headers,
      body,
      encoding,
      Map<String, String> fields,
      List<http.MultipartFile> files,
      bool modifyHeader = true,
      bool gzip = true}) async {
    var request = http.MultipartRequest('POST', Uri.parse(url));
    if (fields != null) {
      request.fields.addAll(fields);
    }
    if (files != null) {
      request.files.addAll(files);
    }
    request.headers.addAll(
      modifyHeader
          ? appendHeader(
              headers: headers,
              gzip: gzip,
              contentType: 'multipart/form-data',
            )
          : headers,
    );
    var response = http.Response.fromStream(await request.send());
    return response.then((response) {
      return response;
    });
  }

  @override
  Future<http.Response> delete(String url, {Map headers}) {
    return http
        .delete(url, headers: appendHeader(headers: headers))
        .then((http.Response response) {
      return handleResponse(response);
    });
  }

  @override
  Future<http.Response> put(String url, {Map headers, body, encoding}) {
    return http
        .put(url,
            body: json.encode(body),
            headers: appendHeader(headers: headers),
            encoding: encoding)
        .then(
      (http.Response response) {
        return handleResponse(response);
      },
    );
  }

  @override
  http.Response handleResponse(http.Response response) {
    final int statusCode = response.statusCode;
    switch (statusCode) {
      case 401:
        {
          throw new Exception("Unauthorized");
        }
      case 500:
        {
          throw new Exception("Internal server error");
        }
      default:
        return response;
    }
  }

  @override
  Map appendHeader({
    Map headers,
    bool refresh = false,
    bool gzip = true,
    String contentType = "application/json",
  }) {
    try {
      if (headers == null) {
        headers = <String, String>{};
      }

      if (gzip)
        headers["Accept-Encoding"] = "gzip";
      else
        headers['Content-Type'] = contentType;

      headers["Content-Type"] = "application/json";
    } catch (e) {
      print(e.toString());
    }

    return headers;
  }
}
