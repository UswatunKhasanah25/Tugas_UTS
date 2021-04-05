class ItemK {
  int _id;
  String _kode;
  String _kategori;

  int get id => _id;

  String get kode => this._kode;
  set kode(String value) => this._kode = value;

  String get kategori => this._kategori;
  set kategori(String value) => this._kategori = value;

  ItemK(this._kode, this._kategori);

  ItemK.fromMap(Map<String, dynamic> map) {
    this._id = map['id'];
    this._kode = map['kode'];
    this._kategori = map['kategori'];
  }

  Map<String, dynamic> toMap() {
  Map<String, dynamic> map = Map<String, dynamic>();
  map['id'] = this._id;
  map['kode'] = kode;
  map['kategori'] = kategori;
  return map;
  }
}