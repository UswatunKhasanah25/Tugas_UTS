import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:tugas_uts/models/dbhelperKtgr.dart';
import 'package:tugas_uts/models/itemK.dart';
import 'package:tugas_uts/pages/tambahKtgr.dart';

//pendukung program asinkron
class ListKategori extends StatefulWidget {
  @override
  ListKategoriState createState() => ListKategoriState();
}

class ListKategoriState extends State<ListKategori> {
  DbHelperKtgr dbHelperKtgr = DbHelperKtgr();
  int count = 0;
  List<ItemK> itemList;
  
  @override
  void initState() {
    super.initState();
    updateListView(); //memanggil fungsi untuk dieksekusi
  }
  @override
  Widget build(BuildContext context) {
    if (itemList == null) {
      itemList = List<ItemK>();
    }
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text('Daftar List Kategori'),
    ),
    body: Column(children : [
      Expanded(child: 
        createListView()
      ),
      Container(
        alignment: Alignment.bottomCenter,
        child: SizedBox(
          width: double.infinity,
          child: RaisedButton(
            child: Text("Tambah List Kategori"),
            onPressed: () async {
              var itemK = await navigateToEntryForm(context, null);
              if (itemK != null) {
              //TODO 2 Panggil Fungsi untuk Insert ke DB
              int result = await dbHelperKtgr.insert(itemK);
                if (result > 0) {
                updateListView();
                }
              }
            },
          ),
        ),
      ),
    ]),
  );
  }

  Future<ItemK> navigateToEntryForm(BuildContext context, ItemK itemK) async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
        return TambahKtgr(itemK);
        }
      )
    );
    return result;
  }

  ListView createListView() {
    TextStyle textStyle = Theme.of(context).textTheme.headline5;
    return ListView.builder(
      itemCount: count,
      itemBuilder: (
        BuildContext context, int index) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.brown,
              child: Icon(Icons.food_bank_outlined),
            ),
            title: 
              Text(this.itemList[index].kode),
            subtitle: 
                Text(
                  (this.itemList[index].kategori)
                ),
            trailing: GestureDetector(
            child: 
              Icon(Icons.delete),
            onTap: ()
              async {
            //TODO 3 Panggil Fungsi untuk Delete dari DB berdasarkan Item
              dbHelperKtgr.delete(this.itemList[index].id);
              updateListView();
            },
            ),
            onTap: ()   
              async {
            var itemK = await navigateToEntryForm(context, this.itemList[index]);
            //TODO 4 Panggil Fungsi untuk Edit data
              if (itemK != null) {
                dbHelperKtgr.update(itemK);
                updateListView();
              }
              },
          ),
        );
      },
      );
    }

  //update List item
  void updateListView() {
    final Future<Database> dbFuture = dbHelperKtgr.initDb();
    dbFuture.then((database) {
      //TODO 1 Select data dari DB
      Future<List<ItemK>> itemListFuture = dbHelperKtgr.getItemList();
      itemListFuture.then((itemList) {
        setState(() {
          this.itemList = itemList;
          this.count = itemList.length;
        });
      });
    });
  }
}