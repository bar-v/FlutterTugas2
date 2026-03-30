import 'package:flutter/material.dart';
import 'form_page.dart';

void main() {
  runApp(const PraktikumApp());
}

class PraktikumApp extends StatelessWidget {
  const PraktikumApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas 2 Praktikum',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const PraktikumPage(),
    );
  }
}

class PraktikumPage extends StatefulWidget {
  const PraktikumPage({super.key});

  @override
  State<PraktikumPage> createState() => _PraktikumPageState();
}

class _PraktikumPageState extends State<PraktikumPage> {
  bool _showImage = false; // state toggle gambar

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Praktikum Tugas 2")),
      body: Column(
        children: [
          // Bagian teks panjang scrollable
          Expanded(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16),
              child: const Text(
                "Manusia menemukan banyak cara aneh untuk menikmati kafein. Salah satu yang cukup elegan datang dari Aceh: kopi sanger. Minuman ini lahir dari budaya warung kopi di Aceh, wilayah yang memang terkenal dengan tradisi minum kopi yang kuat, terutama karena produksi kopi dari daerah seperti Dataran Tinggi Gayo. Kopi sanger dipercaya mulai populer di kalangan mahasiswa dan pelanggan warung kopi di Banda Aceh pada sekitar tahun 1990-an. Kata “sanger” sendiri sering dijelaskan sebagai singkatan dari sama-sama ngerti, sebuah istilah informal antara pembeli dan peracik kopi yang berarti keduanya saling memahami bahwa minuman ini dibuat dengan porsi kopi dan gula yang lebih hemat dibanding kopi susu biasa, sehingga harganya lebih murah namun tetap nikmat. Dalam penyajiannya, kopi sanger dibuat dari kopi hitam khas Aceh yang diseduh kuat, kemudian dicampur dengan sedikit susu kental manis dan gula. Campuran tersebut biasanya ditarik berulang kali antara dua gelas oleh peracik kopi, teknik yang tidak hanya membantu mencampurkan bahan secara merata tetapi juga menghasilkan busa halus di permukaan minuman. Teknik tarik ini juga memberi tekstur yang lebih ringan dibanding kopi susu biasa. Seiring waktu, kopi sanger menjadi bagian penting dari budaya warung kopi Aceh, tempat masyarakat berkumpul untuk berdiskusi, bersosialisasi, atau sekadar menghabiskan waktu. Hingga kini, minuman ini tetap populer dan menjadi salah satu ikon kuliner kopi dari Aceh yang dikenal luas di berbagai daerah di Indonesia.",
                textAlign: TextAlign.justify,
                style: TextStyle(fontSize: 16),
              ),
            ),
          ),

          const SizedBox(height: 10),

          // Bagian ImageView / Container
          Container(
            height: 200,
            width: double.infinity,
            color: _showImage ? Colors.transparent : Colors.brown,
            child: _showImage
                ? Image.asset(
                    'assets/sanger.jpg', // pastikan ada di assets
                    fit: BoxFit.contain,
                  )
                : const Center(
                    child: Text(
                      "Warna Background",
                      style: TextStyle(fontSize: 18, color: Colors.black54),
                    ),
                  ),
          ),

          const SizedBox(height: 10),

          // Tombol-tombol (layout horizontal)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    _showImage = !_showImage; // toggle gambar ↔ warna
                  });
                },
                child: Text(
                  _showImage ? "Kembali ke Warna" : "Tampilkan Gambar",
                ),
              ),
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Tombol lain ditekan!")),
                  );
                },
                child: const Text("Tombol Lain"),
              ),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const FormPage()),
                  );
                },
                child: const Text("Tombol Tugas 3"),
              ),
            ],
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
