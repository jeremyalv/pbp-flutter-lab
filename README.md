# Repository Lab PBP
### Jeremy Alva Prathama
### PBP-B
### 2106640354

<br/>

# Tugas 9
##  Apakah bisa kita melakukan pengambilan data JSON tanpa membuat model terlebih dahulu? Jika iya, apakah hal tersebut lebih baik daripada membuat model sebelum melakukan pengambilan data JSON?
Secara teori, pengambilan data JSON dapat dilakukan secara langsung tanpa membuat models terlebih dahulu. Bahasa pemrograman Dart memiliki method map yang memiliki struktur key-value pair sama seperti JSON. Namun tentunya akan lebih baik bila kita menggunakan model dalam proses pengambilan data agar mengurangi resiko kesalahan yang dapat terjadi di proses.

##  Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
* `MaterialApp`: menggunakan template Material yang dimiliki oleh Flutter pada aplikasi
* `Scaffold`: mengimplementasikan struktur layout visual dasar dari Material Design
* `AppBar`: membuat app bar di bagian atas aplikasi
* `Drawer`: menunjukkan navigation link pada suatu aplikasi
* `Text`: membuat komponen teks
* `Center`: menengahkan child dari widget tersebut
* `Column`: men-display child dalam array vertikal
* `Padding`: menentukan padding dari suatu child yang dimiliki
* `Stack`: memosisikan children yang dimiliki relatif terhadap pojokan dari kotak
* `Align`: memosisikan child dengan konfigurasi tertentu pada widget
* `FloatingActionButton`: tombol lingkaran yang meng-hover diatas konten original
* `Icon`: sebuah icon grafis yang terdefinisikan di Material
* `Form`: sebuah container untuk menggabungkan form widgets
* `SingleChildScrollView`: sebuah kotak yang memungkinkan suatu widget untuk bisa di scroll
* `TextFormField`: sebuah FormField yang mengandung TextField
* `InputDecoration`: meliputi border, label, styles untuk memberikan styling pada Material Design Text Field
* `ListTile`: sebuah row dengan height yang tetap
* `DropdownButton`: Material Design button untuk memilih sekumpulan pilihan
* `DropdownMenuItem`: sebuah item di menu yang dibuah oleh DropdownButton
* `ListView`: sekumpulan widget yang dapat di scroll dan tersusun secara linier
* `Card`: sebuah panel dengan ujung yang rounded dan memiliki shadow
* `Container`:  sebuah widget yang bertujuan untuk mengandung widget lain, digunakan untuk styling ataupun positioning
* `RoundedRectangleBorder`: bertujuan untuk membuat border kartu yang bersifat persegi panjang
* `BorderRadius`: bertujuan untuk menentukan kelengkungan dari border suatu kotak
* `Checkbox`: bertujuan untuk membentuk checkbox 
* `Flexible`: bertujuan untuk memberikan sifat user interface yang fleksibel pada suatu widget
* `SizedBox`: bertujuan untuk membuat elemen kotak yang memiliki ukuran tetap
* `BoxDecoration`: bertujuan untuk membuat dekorasi pada suatu kotak yang telah dibuat
* `ElevatedButton`: membuat sebuah button yang memiliki style dimensi dan sesuai dengan Material Design
* `CircularProgressIndicator`: bertujuan untuk membuat sebuah progress indicator sebagai spinner

##  Jelaskan mekanisme pengambilan data dari json hingga dapat ditampilkan pada Flutter.
1. Membuat method HTTP asynchronous dengan tipe GET untuk mengambil data dari API endpoint yang menyediakan data JSON
2. Lakukan decoding data tersebut menjadi format JSON dengan menggunakan method `json.decode` 
3. Ubah data JSON tadi menjadi suatu object dengan menggunakan method `Movie.fromJson`
4. Agar widget dengan data yang asynchronous dapat ditampilkan dengan baik, gunakan tipe data `Future` sebagai penyimpan variabel async
5. Gunakan widget `FutureBuilder` untuk membuat sebuah komponen yang membutuhkan data asynchronous

##  Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
1. Membuat sebuah model baru bernama `movie.dart` pada `./models/` 
2. Membuat method konversi antara JSON dan data yang ingin digunakan pada model `Movie`
3. Membuat sebuah API bernama `watchlist_api.dart` pada `./api/` yang bertujuan untuk mengambil data dari endpoint API JSON yang telah dibuat sebelumnya
4. Membuat page bernama `watchlist.dart` yang bertujuan untuk menunjukkan list dari film yang didapatkan dari API
5. Menambahkan page `watchlist` pada Hamburger untuk navigasi
6. Buatlah widget Card bernama `movie_card.dart` dan buat class `MovieCard` yang mewakilkan object `Movie` pada halaman `watchlist`
7. Buatlah page bernama `movie_detail.dart` yang bertujuan untuk menunjukkan detail dari suatu film ketika `MovieCard` di klik oleh pengguna

<br />

# Tugas 8
## Jelaskan perbedaan Navigator.push dan Navigator.pushReplacement.
`Navigator.push()` menambahkan route ke dalam `Route` stack yang di atur oleh `Navigator`. `Navigator.pushReplacement()` berbeda dalam hal ia akan menghapus elemen yang digantikan dengan `Route` baru yang di push lewat method tersebut. `pushReplacement` akan menghapus `Route` sebelumnya sedangkan `push` tidak

## Sebutkan widget apa saja yang kamu pakai di proyek kali ini dan jelaskan fungsinya.
* `MaterialApp`: menggunakan template Material yang dimiliki oleh Flutter pada aplikasi
* `Scaffold`: mengimplementasikan struktur layout visual dasar dari Material Design
* `AppBar`: membuat app bar di bagian atas aplikasi
* `Drawer`: menunjukkan navigation link pada suatu aplikasi
* `Text`: membuat komponen teks
* `Center`: menengahkan child dari widget tersebut
* `Column`: men-display child dalam array vertikal
* `Padding`: menentukan padding dari suatu child yang dimiliki
* `Stack`: memosisikan children yang dimiliki relatif terhadap pojokan dari kotak
* `Align`: memosisikan child dengan konfigurasi tertentu pada widget
* `FloatingActionButton`: tombol lingkaran yang meng-hover diatas konten original
* `Icon`: sebuah icon grafis yang terdefinisikan di Material
* `Form`: sebuah container untuk menggabungkan form widgets
* `SingleChildScrollView`: sebuah kotak yang memungkinkan suatu widget untuk bisa di scroll
* `TextFormField`: sebuah FormField yang mengandung TextField
* `InputDecoration`: meliputi border, label, styles untuk memberikan styling pada Material Design Text Field
* `ListTile`: sebuah row dengan height yang tetap
* `DropdownButton`: Material Design button untuk memilih sekumpulan pilihan
* `DropdownMenuItem`: sebuah item di menu yang dibuah oleh DropdownButton
* `ListView`: sekumpulan widget yang dapat di scroll dan tersusun secara linier
* `Card`: sebuah panel dengan ujung yang rounded dan memiliki shadow
* `Container`:  sebuah widget yang bertujuan untuk mengandung widget lain, digunakan untuk styling ataupun positioning

## Sebutkan jenis-jenis event yang ada pada Flutter (contoh: onPressed).
* onPressed
* onHover
* onTap
* onChanged


## Jelaskan bagaimana cara kerja Navigator dalam "mengganti" halaman dari aplikasi Flutter.
`Navigator` memiliki sebuah stack of `Routes`, dimana stack ini mengandung elemen dari halaman yang diakses oleh user. Layaknya struktur data `Stack`, user dapat kembali ke halaman sebelumnya dengan melakukan operasi `pop()` atau menambahkan halaman dengan operasi `push()`. Elemen halaman yang paling atas akan ditampilkan kepada user.


## Jelaskan bagaimana cara kamu mengimplementasikan checklist di atas.
* Buat models Budget untuk merepresentasikan objek BudgetItem yang digunakan
* Pada `main.dart` buatlah sebuah List yang mengandung objek Budget untuk menyimpan data budget dari user
* Buat halaman bernama CreateBudget yang merupakan form untuk mengisi informasi budget
* Buat halaman bernama ViewBudget untuk melihat hasil entry yang telah dimasukkan oleh pengguna
* Melakukan _passing_ data berupa budgetData dari halaman ke objek Hamburger sebagai metode penyimpanan data dari user
* Buat Hamburger untuk melakukan routing dari satu halaman ke halaman lainnya, pastikan juga untuk _passing_ argument berupa budgetData ke setiap halaman pada routing
* Membuat widget bernama BudgetCard untuk merepresentasikan satu budget entry
* Hubungkan BudgetCard dengan halaman ViewBudget menggunakan ListView

<br/>

# Tugas 7
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



