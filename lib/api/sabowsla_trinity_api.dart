// ignore_for_file: prefer_typing_uninitialized_variables

import 'dart:developer';

import 'package:http/http.dart';
import 'package:sabowsla_server/api/env.dart';
import 'package:sabowsla_server/core/network/http_client.dart';

class SabowslaTrinityApi {
  CustomClient client = HttpClientImpl(client: Client());
  Future<dynamic> generateImage(String prompt) async {
    var image;
    var body = {
      'data': prompt,
    };
    var res = await client.post(imageGenerationUrl, body: body);
    log("Genearting image response ${res.message} with promt $prompt");
    return image;
  }
}
