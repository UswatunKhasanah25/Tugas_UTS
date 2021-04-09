class Item {
  int _id;
  String _kode;
  String _menu;
  String _kategori;
  int _harga;

  int get id => _id;

  String get kode => this._kode;
  set kode(String value) => this._kode = value;

  String get menu => this._menu;
  set menu(String value) => this._menu = value;

  String get kategori => this._kategori;
  set kategori(String value) => this._kategori = value;
  
  get harga => this._harga;
  set harga(value) => this._harga = value;

  Item(this._kode, this._menu, this._kategori, this._harga);

  Item.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._kode = map['kode'];
    this._menu = map['menu'];
    this._kategori = map['kategori'];
    this._harga = map['harga'];
  }

  Map<String, dynamic> toMap() {
  Map<String, dynamic> map = Map<String, dynamic>();
  map['id'] = this._id;
  map['kode'] = kode;
  map['menu'] = menu;
  map['kategori'] = kategori;
  map['harga'] = harga;
  return map;
  }
}