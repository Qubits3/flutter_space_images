import 'package:flutter/material.dart';
import 'package:space_images/services/nasa_api.dart';
import 'package:space_images/model/nasa_image.dart';

void main() => runApp(const MaterialApp(home: Home()));

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  NASAImage nasaImage = NASAImage.initializeNull();
  String imageUrl =
      "https://c.tenor.com/I6kN-6X7nhAAAAAj/loading-buffering.gif";

  void getImage() async {
    NasaAPI nasaAPI = NasaAPI(
        url:
            "https://api.nasa.gov/planetary/apod?api_key=zxdm3EbWt4YsT1AifpVgFXgB13ezkZW0devHnLPj&count=1");
    nasaImage = await nasaAPI.getImage();

    setState(() {
      imageUrl = nasaImage.imageUrl;
    });
  }

  @override
  void initState() {
    super.initState();

    getImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("NASA Images"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(nasaImage.title,
                style: const TextStyle(
                    fontSize: 25.0, fontWeight: FontWeight.bold)),
            const SizedBox(width: 15.0),
            Text(nasaImage.date, style: const TextStyle(fontSize: 25.0)),
            const SizedBox(height: 10.0),
            Container(
              height: 300,
              width: 300,
              decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(imageUrl), fit: BoxFit.contain)),
            ),
            const SizedBox(height: 10.0),
            TextButton(
              onPressed: () {
                getImage();
              },
              child: const Text("Refresh"),
              style: ButtonStyle(
                  foregroundColor: MaterialStateProperty.all(Colors.white),
                  backgroundColor: MaterialStateProperty.all(Colors.cyan)),
            )
          ],
        ),
      ),
    );
  }
}
