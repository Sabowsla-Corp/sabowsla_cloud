import 'dart:convert';

import 'package:crypto/crypto.dart';

String createJwt(Map<String, dynamic> payload, String secret) {
  // Step 1: Encode the header
  Map<String, String> header = {'alg': 'HS256', 'typ': 'JWT'};
  String encodedHeader = base64Url.encode(utf8.encode(json.encode(header)));

  // Step 2: Encode the payload
  String encodedPayload = base64Url.encode(utf8.encode(json.encode(payload)));

  // Step 3: Combine the encoded header and payload with a dot (.)
  String combinedData = '$encodedHeader.$encodedPayload';

  // Step 4: Create the signature using HMAC-SHA256 algorithm
  List<int> signatureBytes = Hmac(sha256, utf8.encode(secret))
      .convert(utf8.encode(combinedData))
      .bytes;
  String signature = base64Url.encode(signatureBytes);

  // Step 5: Combine the encoded header, payload, and signature with dots (.)
  String jwt = '$combinedData.$signature';

  return jwt;
}

Map<String, dynamic>? decodeJwt(String jwt, String secret) {
  // Split the JWT into header, payload, and signature
  List<String> parts = jwt.split('.');
  if (parts.length != 3) {
    // Invalid JWT format
    return null;
  }

  // Decode header and payload
  String encodedHeader = parts[0];
  String encodedPayload = parts[1];
  String combinedData = '$encodedHeader.$encodedPayload';

  // Verify the signature
  List<int> signatureBytes = Hmac(sha256, utf8.encode(secret))
      .convert(utf8.encode(combinedData))
      .bytes;
  String calculatedSignature = base64Url.encode(signatureBytes);
  String providedSignature = parts[2];

  if (calculatedSignature != providedSignature) {
    // Invalid signature
    return null;
  }

  // Decode the payload
  String payloadJson = utf8.decode(base64Url.decode(encodedPayload));
  Map<String, dynamic> payload = json.decode(payloadJson);

  return payload;
}
