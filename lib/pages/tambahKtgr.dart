import 'package:flutter/material.dart';
import 'package:tugas_uts/models/itemK.dart';

class TambahKtgr extends StatefulWidget {
  final ItemK itemK;
  TambahKtgr(this.itemK);
  @override 
  TambahKtgrState createState() => TambahKtgrState(this.itemK);
}

//class controller
class TambahKtgrState extends State<TambahKtgr> {
  ItemK itemK;
  
  TambahKtgrState(this.itemK);
 
 TextEditingController kodeController = TextEditingController();
 TextEditingController kategoriController = TextEditingController();

 @override
  Widget build(BuildContext context) {
  //kondisi
  if (itemK != null) {
    kodeController.text = itemK.kode;
    kategoriController.text = itemK.kategori;
  }
  //rubah   
  return Scaffold(
    backgroundColor: Colors.brown[100],
    appBar: AppBar(
    title: itemK == null ? Text('Tambah') : Text('Ubah'),
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
              if (itemK == null) {
                // tambah data
                itemK = ItemK(kodeController.text, kategoriController.text);
              } else {
                // ubah data
                itemK.kode = kodeController.text;
                itemK.kategori = kategoriController.text;
              }
            // kembali ke layar sebelumnya dengan membawa objek item
            Navigator.pop(context, itemK);
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
