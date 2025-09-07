
class PessoasModel {
  int? id;
  String? nome;
  int? idade;
  String? sexo;
  bool? vivo;
  String? urlFoto;
  UltimaOcorrencia? ultimaOcorrencia;

  PessoasModel(
      {this.id,
        this.nome,
        this.idade,
        this.sexo,
        this.vivo,
        this.urlFoto,
        this.ultimaOcorrencia});

  PessoasModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    nome = json['nome'];
    idade = json['idade'];
    sexo = json['sexo'];
    vivo = json['vivo'];
    urlFoto = json['urlFoto'];
    ultimaOcorrencia = json['ultimaOcorrencia'] != null
        ? new UltimaOcorrencia.fromJson(json['ultimaOcorrencia'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['nome'] = this.nome;
    data['idade'] = this.idade;
    data['sexo'] = this.sexo;
    data['vivo'] = this.vivo;
    data['urlFoto'] = this.urlFoto;
    if (this.ultimaOcorrencia != null) {
      data['ultimaOcorrencia'] = this.ultimaOcorrencia!.toJson();
    }
    return data;
  }
}

class UltimaOcorrencia {
  String? dtDesaparecimento;
  Null? dataLocalizacao;
  bool? encontradoVivo;
  String? localDesaparecimentoConcat;
  OcorrenciaEntrevDesapDTO? ocorrenciaEntrevDesapDTO;
  Null? listaCartaz;
  int? ocoId;

  UltimaOcorrencia(
      {this.dtDesaparecimento,
        this.dataLocalizacao,
        this.encontradoVivo,
        this.localDesaparecimentoConcat,
        this.ocorrenciaEntrevDesapDTO,
        this.listaCartaz,
        this.ocoId});

  UltimaOcorrencia.fromJson(Map<String, dynamic> json) {
    dtDesaparecimento = json['dtDesaparecimento'];
    dataLocalizacao = json['dataLocalizacao'];
    encontradoVivo = json['encontradoVivo'];
    localDesaparecimentoConcat = json['localDesaparecimentoConcat'];
    ocorrenciaEntrevDesapDTO = json['ocorrenciaEntrevDesapDTO'] != null
        ? new OcorrenciaEntrevDesapDTO.fromJson(
        json['ocorrenciaEntrevDesapDTO'])
        : null;
    listaCartaz = json['listaCartaz'];
    ocoId = json['ocoId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dtDesaparecimento'] = this.dtDesaparecimento;
    data['dataLocalizacao'] = this.dataLocalizacao;
    data['encontradoVivo'] = this.encontradoVivo;
    data['localDesaparecimentoConcat'] = this.localDesaparecimentoConcat;
    if (this.ocorrenciaEntrevDesapDTO != null) {
      data['ocorrenciaEntrevDesapDTO'] =
          this.ocorrenciaEntrevDesapDTO!.toJson();
    }
    data['listaCartaz'] = this.listaCartaz;
    data['ocoId'] = this.ocoId;
    return data;
  }
}

class OcorrenciaEntrevDesapDTO {
  String? informacao;
  String? vestimentasDesaparecido;

  OcorrenciaEntrevDesapDTO({this.informacao, this.vestimentasDesaparecido});

  OcorrenciaEntrevDesapDTO.fromJson(Map<String, dynamic> json) {
    informacao = json['informacao'];
    vestimentasDesaparecido = json['vestimentasDesaparecido'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['informacao'] = this.informacao;
    data['vestimentasDesaparecido'] = this.vestimentasDesaparecido;
    return data;
  }
}