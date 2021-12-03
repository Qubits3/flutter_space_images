import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart';
import 'dart:convert';
import 'package:space_images/model/nasa_image.dart';

class NasaAPI {
  late String url;

  NasaAPI({required this.url});

  Future<NASAImage> getImage() async {
    Response response = await get(Uri.parse(url));
    List dataList = jsonDecode(response.body);
    Map data = dataList[0] as Map;

    return NASAImage(
        date: data["date"],
        explanation: data["explanation"],
        hdImageUrl: data["hdurl"],
        title: data["title"],
        imageUrl: data["url"]);
  }
}
