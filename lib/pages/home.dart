import 'package:flutter/material.dart';
import 'package:tugas_uts/pages/listMenu.dart';

class Home extends StatelessWidget {
  const Home({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column ( 
      children: <Widget>[
         Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Expanded(
            child: RaisedButton(
              onPressed: (){
                Navigator.push(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => ListMenu(),
                  )
                );
              },
              child:  Text(
                "List Menu",
                style: TextStyle(fontSize: 14)
              ),
            )
          ),
          Expanded(
            child: RaisedButton(
              onPressed: (){},
              child:  Text(
                "List Kategori",
                style: TextStyle(fontSize: 14),
              ),
            )
          ),
          ],
          ),
        Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                "Welcome to Resto Uswa",
                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: 30),
                ),
              ),
            ),
        Image.network("https://image-cdn.medkomtek.com/_kMbLH1NBowEFKXTIICc0emiLho=/1200x675/smart/klikdokter-media-buckets/medias/2301403/original/041071400_1541671527-Tips-Sehat-Saat-Makan-di-Restoran-Thailand-By-supatchai-Shutterstock.jpg"),
        Image.network("https://cdn-2.tstatic.net/tribunnews/foto/bank/images2/resep-minuman-hangat-cocok-dinikmati-saat-musim-hujan-berikut-cara-membuatnya.jpg"),
        Image.network("https://cf.shopee.co.id/file/96c8b7c5690fa1271258cf6053990415"),
      
      ]
    );
  }
}