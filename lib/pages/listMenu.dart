import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:async';
import 'package:tugas_uts/models/dbhelperMenu.dart';
import 'package:tugas_uts/models/item.dart';
import 'package:tugas_uts/pages/tambahMenu.dart';

//pendukung program asinkron
class ListMenu extends StatefulWidget {
  @override
  ListMenuState createState() => ListMenuState();
}

class ListMenuState extends State<ListMenu> {
  DbHelperMenu dbHelperMenu = DbHelperMenu();
  int count = 0;
  List<Item> itemList;
  
  @override
  void initState() {
    super.initState();
    updateListView();
  }
  @override
  Widget build(BuildContext context) {
    if (itemList == null) {
      itemList = List<Item>();
    }
    return Scaffold(
      backgroundColor: Colors.brown[100],
      appBar: AppBar(
        title: Text('Daftar List Menu'),
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
            child: Text("Tambah List Menu"),
            onPressed: () async {
              var item = await navigateToEntryForm(context, null);
              if (item != null) {
              //TODO 2 Panggil Fungsi untuk Insert ke DB
              int result = await dbHelperMenu.insert(item);
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

  Future<Item> navigateToEntryForm(BuildContext context, Item item) async {
    var result = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) {
        return TambahMenu(item);
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
                  (this.itemList[index].menu) +
                  ("\nKategori : "+this.itemList[index].kategori) +
                  "\nHarga : Rp."+this.itemList[index].harga.toString()
                ),
            trailing: GestureDetector(
            child: 
              Icon(Icons.delete),
            onTap: ()
              async {
            //TODO 3 Panggil Fungsi untuk Delete dari DB berdasarkan Item
              dbHelperMenu.delete(this.itemList[index].id);
              updateListView();
            },
            ),
            onTap: ()   
              async {
            var item = await navigateToEntryForm(context, this.itemList[index]);
            //TODO 4 Panggil Fungsi untuk Edit data
              if (item != null) {
                dbHelperMenu.update(item);
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
    final Future<Database> dbFuture = dbHelperMenu.initDb();
    dbFuture.then((database) {
      //TODO 1 Select data dari DB
      Future<List<Item>> itemListFuture = dbHelperMenu.getItemList();
      itemListFuture.then((itemList) {
        setState(() {
          this.itemList = itemList;
          this.count = itemList.length;
        });
      });
    });
  }
}