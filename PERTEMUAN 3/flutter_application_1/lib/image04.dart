import 'package:flutter/material.dart';


class Image04 extends StatelessWidget{
  const Image04({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Menampilkan Gambar'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            buildImageCard('https://id.pinterest.com/pin/296322850491520739/'),
            buildImageCard('https://id.pinterest.com/pin/246501779595693898/'),
            buildImageCard('https://id.pinterest.com/pin/82050024454986984/'),
            buildImageCard('https://id.pinterest.com/pin/34691859624259099/'),
            buildImageCard('https://id.pinterest.com/pin/67483694407410919/'),
            buildImageCard('https://id.pinterest.com/pin/606086062361423862/'),
           ],
        )
      ),
    );
  }
   //Funsgi untuk membangun kotak gambar
  Widget buildImageCard(String imageUrl) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10), // Sudut melengkung
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10), // Sudut melengkung untuk gambar
        child: Image.network(
          imageUrl,
          fit: BoxFit.cover, // Memastikan gambar penuh di dalam kontainer
          height: 150.0, // Tinggi kontainer
          width: double.infinity, // Lebah penuh
          loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(value: loadingProgress.expectedTotalBytes != null ? loadingProgress.cumulativeBytesLoaded /
              (loadingProgress.expectedTotalBytes ?? 1): null),
            );
          },
          errorBuilder: (BuildContext context, Object error, StackTrace? StackTrace) {
            return Center(child: const Text('Gagal memeuat gambar'));
          }
      ),
      ),
    );
  }
}