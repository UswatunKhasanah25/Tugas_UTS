import 'package:flutter/material.dart';
import 'package:tugas_uts/models/item.dart';

class TambahMenu extends StatefulWidget {
  final Item item;
  TambahMenu(this.item);
  @override 
  TambahMenuState createState() => TambahMenuState(this.item);
}

//class controller
class TambahMenuState extends State<TambahMenu> {
  Item item;
  
  TambahMenuState(this.item);
 
 TextEditingController kodeController = TextEditingController();
 TextEditingController menuController = TextEditingController();
 TextEditingController kategoriController = TextEditingController();
 TextEditingController hargaController = TextEditingController();

 
 @override
  Widget build(BuildContext context) {
  //kondisi
  if (item != null) {
    kodeController.text = item.kode;
    menuController.text = item.menu;
    kategoriController.text = item.kategori;
    hargaController.text = item.harga.toString();
  }
  //rubah   
  return Scaffold(
    backgroundColor: Colors.brown[100],
    appBar: AppBar(
    title: item == null ? Text('Tambah') : Text('Ubah'),
    leading: Icon(Icons.keyboard_arrow_left),
  ),
  body: Padding(
    padding: EdgeInsets.only(top: 15.0, left:10.0, right:10.0),
    child: ListView(
    children: <Widget> [
    // kode
     Padding (
      padding: EdgeInsets.only(top:20.0, bottom:20.0),
      child: TextField(
        controller: kodeController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: 'Kode',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        onChanged: (value) {
        //
        },
      ),
    ),

    // menu
     Padding (
      padding: EdgeInsets.only(top:20.0, bottom:20.0),
      child: TextField(
        controller: menuController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: 'Menu',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        onChanged: (value) {
        //
        },
      ),
    ),
    
    // kategori
     Padding (
      padding: EdgeInsets.only(top:20.0, bottom:20.0),
      child: TextField(
        controller: kategoriController,
        keyboardType: TextInputType.text,
        decoration: InputDecoration(
          labelText: 'Kategori',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        onChanged: (value) {
        //
        },
      ),
    ),

    // harga
    Padding (
      padding: EdgeInsets.only(top:20.0, bottom:20.0),
        child: TextField(
          controller: hargaController,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            labelText: 'Harga',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          onChanged: (value) {
          },
        ),
    ),
    
    // tombol button
    Padding (
      padding: EdgeInsets.only(top:20.0, bottom:20.0),
      child: Row(
        children: <Widget> [
        // tombol simpan
          Expanded(
            child: RaisedButton(
              color: Theme.of(context).primaryColorDark,
              textColor: Theme.of(context).primaryColorLight,
              child: Text(
                'Save',
                textScaleFactor: 1.5,
              ),
            onPressed: () {
              if (item == null) {
                // tambah data
                item = Item(kodeController.text, menuController.text, kategoriController.text, int.parse(hargaController.text));
              } else {
                // ubah data
                item.kode = kodeController.text;
                item.menu = menuController.text;
                item.kategori = kategoriController.text;
                item.harga = int.parse(hargaController.text);
              }
            // kembali ke layar sebelumnya dengan membawa objek item
            Navigator.pop(context, item);
            },
            ),
          ),
          Container(width: 5.0,),
 
          // tombol batal
          Expanded(
            child: RaisedButton(
              color: Theme.of(context).primaryColorDark,
              textColor: Theme.of(context).primaryColorLight,
                child: Text(
                  'Cancel',
                  textScaleFactor: 1.5,
                ),
                onPressed: () {
                  Navigator.pop(context);
                },
            ),
          ),
        ],
      ),
    ),
    ],
    )
     )
  );
 }
}
