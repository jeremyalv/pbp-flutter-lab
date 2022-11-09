# Repository Lab PBP
### Jeremy Alva Prathama
### PBP-B
### 2106640354

## Definisi dan perbedaan _stateless_ dan _stateful_ widget pada Flutter
Stateless widget: sebuah widget yang tidak pernah berubah. Sifat permanensi ini ada karena widget tidak menyimpan state (data tentang status quo) suatu aplikasi, 
sehingga dari awal hingga terminasi program ia akan berbentuk sama. Stateless widget akan meng-inherit `StatelessWidget`.

Stateful widget: sebuah widget yang dapat berubah semasa hidup aplikasi. Sifat dinamis ini muncul karena widget mampu mengetahui state (data terkait status quo) suatu aplikasi,
dan widget mampu memproses data tersebut untuk menentukan aksi yang dapat merubah widget tersebut. Stateful widget akan meng-inherit `StatefulWidget`

## Widget yang digunakan di proyek ini dan fungsinya
* `StatelessWidget`: membuat widget yang bersifat stateless / tidak dinamis
* `StatefulWidget`: membuat widget yang bersifat stateful / dinamis
* `build`: membangun "deskripsi" widget pada user interface (menaruh widget pada UI)
* `MaterialApp`: menggunakan template Material yang dimiliki oleh Flutter pada aplikasi
* `ThemeData`: menentukan konfigurasi dari theme yang dimiliki suatu widget tertentu
* `Scaffold`: mengimplementasikan struktur layout visual dasar dari Material Design
* `AppBar`: membuat app bar di bagian atas aplikasi
* `Text`: membuat komponen teks
* `Center`: menengahkan child dari widget tersebut
* `Column`: men-display child dalam array vertikal
* `TextStyle`: mengatur style dari suatu teks
* `Padding`: menentukan padding dari suatu child yang dimiliki
* `EdgeInsets`: untuk memberikan offset visual dari keempat sisi dari sebuah kotak
* `Stack`: memosisikan children yang dimiliki relatif terhadap pojokan dari kotak
* `Align`: memosisikan child dengan konfigurasi tertentu pada widget
* `FloatingActionButton`: tombol lingkaran yang meng-hover diatas konten original
* `Icon`: sebuah icon grafis yang terdefinisikan di Material

## Apa fungsi dari `setState()`? Jelaskan variabel yang terdampak!
`setState()` memberikan notifikasi kepada aplikasi bahwa sebuah state ("status quo dari aplikasi") telah mengalami perubahan.
Method ini akan memanggil suatu callback function yang dapat digunakan untuk mendeskripsikan perubahan yang terjadi.
`setState()` dapat memanggil `build()` untuk suatu `State` object, yang akan mengakibatkan perubahan pada user interface.

Variabel yang terdampak `setState()` pada aplikasi ini antara lain:
* `_counter`: akan di increment (+1) atau decrement (-1) sesuai aksi user
* `_isOdd`: akan berubah menjadi `true` atau `false` sesuai nilai `_counter`

## Perbedaan antara `const` dan `final`
`final` digunakan pada variabel. `final` berarti bersifat hanya dapat di assign sekali saja. 
Nilai dari `final` tidak dapat diubah di kemudian waktu.


`const` digunakan pada values, misal pada saat membuat object. `const` akan bernilai konstan pada saat compile-time.
Setelah kompilasi, object akan "dibekukan" dan akan bersifat immutable.

## Implementasi checklist diatas
1. Membuat proyek baru flutter pada directory yang telah dibuat sebelumnya
`cd pbp-flutter-lab`
`flutter create counter_7`

2. Membuat fields untuk widget home page
```dart
int _counter = 0;
bool _isOdd = false;
```

3. Membuat fungsi untuk decrement counter dan increment counter
```dart
void _incrementCounter() {
  setState(() {
    _counter++;
    _isOdd = _counter % 2 == 0 ? false : true;
  });
}

void _decrementCounter() {
  setState(() {
    if (_counter > 0) {
      _counter--;
      _isOdd = _counter % 2 == 0 ? false : true;
    }
  });
}
```

4. Menambahkan logic untuk menenetukan teks yang di display diatas counter
```dart
Text(_isOdd ? 'GANJIL' : 'GENAP')
```

5. Menambahkan logic untuk mendisplay button (+, -) dan tambah logic untuk hilangkan (-) saat counter == 0
```dart
@override
  Widget build(BuildContext context) {
    ...,
    floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: _counter > 0 ?
        Stack(
          children: [
            Align(
              alignment: Alignment.bottomLeft,
              child: FloatingActionButton(
                // Widget decrementCounter
              ),
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: FloatingActionButton(
                // Widget incrementCounter
              ),
            )
          ]
        )
        :
        Stack(
            children: [
              Align(
                alignment: Alignment.bottomRight,
                child: FloatingActionButton(
                  // Widget decrementCounter
                ),
              )
            ],
        ),
       ),
```



