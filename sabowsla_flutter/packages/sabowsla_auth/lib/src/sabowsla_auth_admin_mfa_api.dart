import 'fetch.dart';
import 'types/fetch_options.dart';
import 'types/mfa.dart';

class SabowslaAuthAdminMFAApi {
  final String _url;
  final Map<String, String> _headers;
  final SabowslaAuthFetch _fetch;

  SabowslaAuthAdminMFAApi({
    required String url,
    required Map<String, String> headers,
    required SabowslaAuthFetch fetch,
  })  : _url = url,
        _headers = headers,
        _fetch = fetch;

  Future<AuthMFAAdminListFactorsResponse> listFactors(
      {required String userId}) async {
    final data = await _fetch.request(
      '$_url/admin/users/$userId/factors',
      RequestMethodType.get,
      options: SabowslaAuthRequestOptions(
        headers: _headers,
      ),
    );

    return AuthMFAAdminListFactorsResponse(
        factors: (data as List).map((e) => Factor.fromJson(e)).toList());
  }

  Future<AuthMFAAdminDeleteFactorResponse> deleteFactor({
    required String userId,
    required String factorId,
  }) async {
    final data = await _fetch.request(
      '$_url/admin/users/$userId/factors/$factorId',
      RequestMethodType.delete,
      options: SabowslaAuthRequestOptions(
        headers: _headers,
      ),
    );

    return AuthMFAAdminDeleteFactorResponse.fromJson(data);
  }
}
