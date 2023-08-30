import 'dart:async';
import 'dart:io';
import 'package:flutter/foundation.dart';
Future<Uint8List> uploadImage(String imageUrl) async {
  HttpClient httpClient = HttpClient();
  try {
    Uri uri = Uri.parse(imageUrl);
    HttpClientRequest request = await httpClient.getUrl(uri);
    HttpClientResponse response = await request.close();
    if (response.statusCode != HttpStatus.ok) {
      throw Exception('Failed to load image from URL: $imageUrl');
    }
    Uint8List bytes = await consolidateHttpClientResponseBytes(response);
    return bytes;
  } catch (e) {
    throw Exception('Error loading image from URL: $imageUrl\n$e');
  } finally {
    httpClient.close();
  }
}

 

 