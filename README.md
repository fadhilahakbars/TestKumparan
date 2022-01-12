# TestKumparan

Pertanyaan 
1. What if there are thousands of articles in the database?
2. What if many are accessing your API at the same time?

Jawaban 
1. Jika mengalami kasus seperti itu maka yang harus dipertimbangkan adalah bagaimana mengatur data tersebut saat dipanggil tidak mengalami perlambatan, salah satu solusinya adalah dengan menggunakan index, index merupakan suatu metode dimana saat melakukan pemanggilan query maka data akan langsung diarahkan sesuai index yang dipanggil sehingga data tidak akan dicari menggunakan full scan. Kemudian data di dalam sebuah table bisa di normalisasi sehingga dengan adanya normalisasi data yang ada didalam table bisa lebih sederhana dan efektif penggunaanya. 
2. Jika banyak user mengakses bersamaan maka akan menimbulkan masalah, solusi yang bisa dipertimbangkan adalah menggunakan Pessimistic Locking atau Optimistic Locking. Jika menggunakan Pessimistic Locking maka ketika ada user sedang mengakses duluan maka resource tersebut akan dikunci terlebih dahulu sehingga user lain harus menunggu hingga user yang pertama sudah mengedit dan menyimpan perubahan tersebut, akan tetapi dalam penggunakan RESTful API ini kurang cocok karena user lain harus menunggu hingga user pertama membuka kuncian tersebut. Cara kedua adalah Optimistic Locking, dimana cara kerjanya adalah user bisa mengakses resource secara paralel, optimistic locking merupakan suatu metode dimana ketika ada user mengkases sumber secara bersamaan maka ketika lagi prsoses mengedit atau menambahkan, kemudian ketika selesai dan melakukan penyimpanan salah satu user tersebut yang tercepat akan disimpan sebagai versi 38, kemudian ada user lain ingin menyimpan perubahan maka nama versinya menjadi 39 sehingga perubahan yang dia lakukan tidak akan menimpa perubahan sebelumnya.  

## Memasukkan data kedalam database
1. Gunakanlah file command.sql untuk membuat database article 
2. di dalam command tersebut terdapat pembuatan table articles dan author, kemudian ada insert data dari masing-masing table

## Menjalankan Node JS
1. Gunakanlah file index.js yang ada di dalam folder backend
2. Buka CMD, kemudian masuk kedalam direktori backend
3. Ketik node index.js
4. Tunggu beberapa saat hingga tulisan database connected

## Menjalankan Postman untuk mencoba API
1. Buka aplikasi postman
2. Kemudian klik file lalu import
3. Masukkan file json yang ada di folder unit testing postman
4. lalu terdapat 5 pilihan ada request POST dan GET
5. Kemudian pilih body lalu klik raw
6. Kemudian ganti parameter yang sudah disediakan di aplikasi Postman.
