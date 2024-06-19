class TempatWisata {
  String id;
  String nama;
  String alamat;
  String deskripsi;
  List<String> fotoUrls;
  double rating;
  int uptrend;
  String label;
  String? link; 

  TempatWisata({
    required this.id,
    required this.nama,
    required this.alamat,
    required this.deskripsi,
    required this.fotoUrls,
    this.rating = 0.0,
    this.uptrend = 0,
    required this.label,
    this.link,
  });

  factory TempatWisata.fromMap(Map<String, dynamic> map) {
    return TempatWisata(
      id: map['id'] ?? '',
      nama: map['nama'] ?? '',
      alamat: map['alamat'] ?? '',
      deskripsi: map['deskripsi'] ?? '',
      fotoUrls: List<String>.from(map['fotoUrls'] ?? []),
      rating: (map['rating'] ?? 0.0).toDouble(),
      uptrend: map['uptrend'] ?? 0,
      label: map['label'] ?? '',
      link: map['link'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'nama': nama,
      'alamat': alamat,
      'deskripsi': deskripsi,
      'fotoUrls': fotoUrls,
      'rating': rating,
      'uptrend': uptrend,
      'label': label,
      'link': link,
    };
  }
}
