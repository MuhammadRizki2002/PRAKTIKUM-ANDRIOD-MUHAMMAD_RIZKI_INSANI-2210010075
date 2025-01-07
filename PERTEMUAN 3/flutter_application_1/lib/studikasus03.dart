import 'package:flutter/material.dart';

class Studikasus03 extends StatefulWidget {
  const Studikasus03({super.key});

  @override
  State<Studikasus03> createState() => _Studikasus03State();
}

class _Studikasus03State extends State<Studikasus03> {
  String? pilihan;
  String url = '';
  final List<String> hokage = ['PLAYER 067', '240 067', 'GUARD', 'SQUID GAME'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pimpinan'),
      ),
      body: Center(
        child: Column(
          children: [
            DropdownButton<String>(
              hint: const Text('Pilih Item'),
              value: pilihan,
              onChanged: (String? pilihannya) {
                setState(() {
                  pilihan = pilihannya; // Set item yang dipilih
                  if (pilihan == 'PLAYER 067') {
                    url =
                        'https://i.pinimg.com/736x/c1/8f/ae/c18fae235d6b302cec8ee5e12b0fd30d.jpg';
                  } else if (pilihan == '240 067') {
                    url =
                        'https://i.pinimg.com/736x/f8/3b/a3/f83ba361264a967fe61d466fe52eb155.jpg';
                  } else if (pilihan == 'GUARD') {
                    url =
                        'https://i.pinimg.com/736x/51/37/4d/51374db1f36c10ddc313cd2e91e21581.jpg';
                  } else if (pilihan == 'SQUID GAME') {
                    url =
                        'https://i.pinimg.com/736x/2c/d7/a8/2cd7a85d97bbcc8d0c6ec304e5572a59.jpg';
                  } else {
                    url =
                        'https://i.pinimg.com/736x/03/92/61/039261e98e835437213d6c5991e19603.jpg';
                  }
                });
              },
              items: hokage.map<DropdownMenuItem<String>>((String isi) {
                return DropdownMenuItem<String>(
                  value: isi,
                  child: Text(isi),
                );
              }).toList(),
            ),
            buildImageCard(url),
          ],
        ),
      ),
    );
  }

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
          fit: BoxFit.cover, // Memastikan gambar penuh di dalam container
          height: 150.0, // Tinggi container
          width: double.infinity, // Lebar penuh
          loadingBuilder: (BuildContext context, Widget child,
              ImageChunkEvent? loadingProgress) {
            if (loadingProgress == null) return child;
            return Center(
              child: CircularProgressIndicator(
                value: loadingProgress.expectedTotalBytes != null
                    ? loadingProgress.cumulativeBytesLoaded /
                        (loadingProgress.expectedTotalBytes ?? 1)
                    : null,
              ),
            );
          },
          errorBuilder:
              (BuildContext context, Object error, StackTrace? stackTrace) {
            return const Center(child: Text('Gagal memuat gambar'));
          },
        ),
      ),
    );
  }
}
