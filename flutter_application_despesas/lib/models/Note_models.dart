class Notes_Models {
  String? titulo;
  String? conteudo;
  String? Key;

  Notes_Models({this.titulo, this.conteudo});

  Notes_Models.fromJson(Map<String, dynamic> json) {
    titulo = json['titulo'];
    conteudo = json['conteudo'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['titulo'] = this.titulo;
    data['conteudo'] = this.conteudo;
    return data;
  }
}