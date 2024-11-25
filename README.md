# Screenshot program Tugas 4

## Login dan Register
<img src="https://github.com/user-attachments/assets/d37b34ba-4d0d-4966-8f9c-0151e6f875c4" height="320"/>
<img src="https://github.com/user-attachments/assets/50a7daf3-263e-4cb9-9a8f-17901ae741f9" height="320"/><br/>

## CRUD Produk
<img src="https://github.com/user-attachments/assets/08b972b0-38b9-4c99-b9ef-80bd107ff4b5" height="320"/>
<img src="https://github.com/user-attachments/assets/3a88ee45-f197-483e-ae48-511e024d2eb9" height="320"/>
<img src="https://github.com/user-attachments/assets/1c1dad24-27b8-4f98-853e-4e9209365725" height="320"/>
<img src="https://github.com/user-attachments/assets/437b0ac6-f4d4-4675-89db-161aadda00b5" height="320"/>
<img src="https://github.com/user-attachments/assets/441b7a02-bc2c-41de-8912-8e386d9b0141" height="320"/><br/>

# Penjelasan Program Tugas 5
## 1. Proses Login
### a. Login Berhasil
<img src="https://github.com/user-attachments/assets/d00813b9-ed10-4d18-944b-dbdebc6f356a" height="320"/>
#### Penjelasan:
Proses login berhasil akan mengarahkan ke halaman ProdukPage()
#### Kode:
void _submit() {
  _formKey.currentState!.save();
  setState(() {
    _isLoading = true;
  });
  LoginBloc.login(
    email: _emailTextboxController.text,
    password: _passwordTextboxController.text)
    .then((value) async {
      if (value.code == 200) {
        await UserInfo().setToken(value.token.toString());
        await UserInfo().setUserID(int.parse(value.userID.toString()));
        Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (context) => const ProdukPage()));
      }

### b. Login Gagal
<img src="https://github.com/user-attachments/assets/89f2b391-31f9-4424-8d3b-8d09ea89d254" height="320"/>
#### Penjelasan:
Proses login gagal akan memunculkan notif gagal
#### Kode:
else {
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) => const WarningDialog(
            description: "Login gagal, silahkan coba lagi",
        ));
      }
    }, onError: (error) {
      print(error);   
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) => const WarningDialog(
        description: "Login gagal, silahkan coba lagi",
      ));
    }

## 2. Proses Tambah Data Produk
<img src="https://github.com/user-attachments/assets/cbbdd40d-2986-49a1-911b-7ea9e4bfe9c6" height="320"/>
#### Penjelasan:
Menambah data produk menggunakan halaman form produk, disini ketika tambah maka button tambah produk akan menyimmpan dan memanggil fungsi simpan()
#### Kode:
void simpan() {
    setState(() {
      _isLoading = true;
    });
    Produk createProduk = Produk(id: null);
    createProduk.kodeProduk = _kodeProdukTextboxController.text;
    createProduk.namaProduk = _namaProdukTextboxController.text;
    createProduk.hargaProduk = int.parse(_hargaProdukTextboxController.text);
    ProdukBloc.addProduk(produk: createProduk).then((value) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const ProdukPage()));
    }, onError: (error) {
      showDialog(
        context: context,
        builder: (BuildContext context) => const WarningDialog(
          description: "Simpan gagal, silahkan coba lagi",
        ),
      );
    });
    setState(() {
      _isLoading = false;
    });
  }

## 3. Proses Tampil Data Produk
<img src="https://github.com/user-attachments/assets/3311acd2-a653-49a3-bcdc-81a8bd58f0cf" height="320"/>
<img src="https://github.com/user-attachments/assets/5d08d4b0-3187-4bb0-bd49-06b329f7fe5d" height="320"/>
#### Penjelasan:
Menampilkan data detail produk dengan seluruh kolom
#### Kode:
children: [
            Text(
              "Kode : ${widget.produk!.kodeProduk}",
              style: const TextStyle(fontSize: 20.0),
            ),
            Text(
              "Nama : ${widget.produk!.namaProduk}",
              style: const TextStyle(fontSize: 18.0),
            ),
            Text(
              "Harga : Rp. ${widget.produk!.hargaProduk.toString()}",
              style: const TextStyle(fontSize: 18.0),
            ),
            _tombolHapusEdit()
          ],

## 4. Proses Ubah Data Produk
<img src="https://github.com/user-attachments/assets/9d1ce5a7-0422-4aef-93e5-325c686d3616" height="320"/>
<img src="https://github.com/user-attachments/assets/6f60d52b-ea9a-4316-827a-e85fb0bd23f9" height="320"/>
#### Penjelasan:
Program akan memanggil halaman form edit dengan percabangan, dan kemudian mengupdate data dari form tersebut
#### Kode:
isUpdate() {
    if (widget.produk != null) {
      setState(() {
        judul = "UBAH PRODUK ACHMAD";
        tombolSubmit = "UBAH";
        _kodeProdukTextboxController.text = widget.produk!.kodeProduk!;
        _namaProdukTextboxController.text = widget.produk!.namaProduk!;
        _hargaProdukTextboxController.text =
            widget.produk!.hargaProduk.toString();
      });
    } else {
      judul = "Tambah Produk Achmad";
      tombolSubmit = "SIMPAN";
    }
  }
    
## 5. Proses Hapus Data Produk
<img src="https://github.com/user-attachments/assets/4be917e0-3e99-4959-9b47-891b9513aa52" height="320"/>
#### Penjelasan:
Hapus data memanggil fungsi confirmHapus dan akan menggunakan ID dari data yg diselect dan menghapus data tersebut di database.
#### Kode:
void confirmHapus() {
    AlertDialog alertDialog = AlertDialog(
      content: const Text("Yakin ingin menghapus data ini?"),
      actions: [
//tombol hapus
        OutlinedButton(
          child: const Text("Ya"),
          onPressed: () {
            ProdukBloc.deleteProduk(id: int.parse(widget.produk!.id!)).then(
                (value) => {
                      Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ProdukPage()))
                    }, onError: (error) {
              showDialog(
                  context: context,
                  builder: (BuildContext context) => const WarningDialog(
                        description: "Hapus gagal, silahkan coba lagi",
                      ));
            });
          },
        ),

//tombol batal
        OutlinedButton(
          child: const Text("Batal"),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );
    showDialog(builder: (context) => alertDialog, context: context);
  }






