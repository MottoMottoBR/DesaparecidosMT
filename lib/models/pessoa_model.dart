class PessoasModel {
  int? _id;
  String? _nome;
  int? _idade;
  String? _sexo;
  bool? _vivo;
  String? _urlFoto;
  UltimaOcorrencia? _ultimaOcorrencia;

  PessoaModel(
      {int? id,
        String? nome,
        int? idade,
        String? sexo,
        bool? vivo,
        String? urlFoto,
        UltimaOcorrencia? ultimaOcorrencia}) {
    if (id != null) {
      this._id = id;
    }
    if (nome != null) {
      this._nome = nome;
    }
    if (idade != null) {
      this._idade = idade;
    }
    if (sexo != null) {
      this._sexo = sexo;
    }
    if (vivo != null) {
      this._vivo = vivo;
    }
    if (urlFoto != null) {
      this._urlFoto = urlFoto;
    }
    if (ultimaOcorrencia != null) {
      this._ultimaOcorrencia = ultimaOcorrencia;
    }
  }

  int? get id => _id;
  set id(int? id) => _id = id;
  String? get nome => _nome;
  set nome(String? nome) => _nome = nome;
  int? get idade => _idade;
  set idade(int? idade) => _idade = idade;
  String? get sexo => _sexo;
  set sexo(String? sexo) => _sexo = sexo;
  bool? get vivo => _vivo;
  set vivo(bool? vivo) => _vivo = vivo;
  String? get urlFoto => _urlFoto;
  set urlFoto(String? urlFoto) => _urlFoto = urlFoto;
  UltimaOcorrencia? get ultimaOcorrencia => _ultimaOcorrencia;
  set ultimaOcorrencia(UltimaOcorrencia? ultimaOcorrencia) =>
      _ultimaOcorrencia = ultimaOcorrencia;

  PessoasModel.fromJson(Map<String, dynamic> json) {
    _id = json['id'];
    _nome = json['nome'];
    _idade = json['idade'];
    _sexo = json['sexo'];
    _vivo = json['vivo'];
    _urlFoto = json['urlFoto'];
    _ultimaOcorrencia = json['ultimaOcorrencia'] != null
        ? new UltimaOcorrencia.fromJson(json['ultimaOcorrencia'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this._id;
    data['nome'] = this._nome;
    data['idade'] = this._idade;
    data['sexo'] = this._sexo;
    data['vivo'] = this._vivo;
    data['urlFoto'] = this._urlFoto;
    if (this._ultimaOcorrencia != null) {
      data['ultimaOcorrencia'] = this._ultimaOcorrencia!.toJson();
    }
    return data;
  }
}

class UltimaOcorrencia {
  String? _dtDesaparecimento;
  Null? _dataLocalizacao;
  bool? _encontradoVivo;
  String? _localDesaparecimentoConcat;
  OcorrenciaEntrevDesapDTO? _ocorrenciaEntrevDesapDTO;
  Null? _listaCartaz;
  int? _ocoId;

  UltimaOcorrencia(
      {String? dtDesaparecimento,
        Null? dataLocalizacao,
        bool? encontradoVivo,
        String? localDesaparecimentoConcat,
        OcorrenciaEntrevDesapDTO? ocorrenciaEntrevDesapDTO,
        Null? listaCartaz,
        int? ocoId}) {
    if (dtDesaparecimento != null) {
      this._dtDesaparecimento = dtDesaparecimento;
    }
    if (dataLocalizacao != null) {
      this._dataLocalizacao = dataLocalizacao;
    }
    if (encontradoVivo != null) {
      this._encontradoVivo = encontradoVivo;
    }
    if (localDesaparecimentoConcat != null) {
      this._localDesaparecimentoConcat = localDesaparecimentoConcat;
    }
    if (ocorrenciaEntrevDesapDTO != null) {
      this._ocorrenciaEntrevDesapDTO = ocorrenciaEntrevDesapDTO;
    }
    if (listaCartaz != null) {
      this._listaCartaz = listaCartaz;
    }
    if (ocoId != null) {
      this._ocoId = ocoId;
    }
  }

  String? get dtDesaparecimento => _dtDesaparecimento;
  set dtDesaparecimento(String? dtDesaparecimento) =>
      _dtDesaparecimento = dtDesaparecimento;
  Null? get dataLocalizacao => _dataLocalizacao;
  set dataLocalizacao(Null? dataLocalizacao) =>
      _dataLocalizacao = dataLocalizacao;
  bool? get encontradoVivo => _encontradoVivo;
  set encontradoVivo(bool? encontradoVivo) => _encontradoVivo = encontradoVivo;
  String? get localDesaparecimentoConcat => _localDesaparecimentoConcat;
  set localDesaparecimentoConcat(String? localDesaparecimentoConcat) =>
      _localDesaparecimentoConcat = localDesaparecimentoConcat;
  OcorrenciaEntrevDesapDTO? get ocorrenciaEntrevDesapDTO =>
      _ocorrenciaEntrevDesapDTO;
  set ocorrenciaEntrevDesapDTO(
      OcorrenciaEntrevDesapDTO? ocorrenciaEntrevDesapDTO) =>
      _ocorrenciaEntrevDesapDTO = ocorrenciaEntrevDesapDTO;
  Null? get listaCartaz => _listaCartaz;
  set listaCartaz(Null? listaCartaz) => _listaCartaz = listaCartaz;
  int? get ocoId => _ocoId;
  set ocoId(int? ocoId) => _ocoId = ocoId;

  UltimaOcorrencia.fromJson(Map<String, dynamic> json) {
    _dtDesaparecimento = json['dtDesaparecimento'];
    _dataLocalizacao = json['dataLocalizacao'];
    _encontradoVivo = json['encontradoVivo'];
    _localDesaparecimentoConcat = json['localDesaparecimentoConcat'];
    _ocorrenciaEntrevDesapDTO = json['ocorrenciaEntrevDesapDTO'] != null
        ? new OcorrenciaEntrevDesapDTO.fromJson(
        json['ocorrenciaEntrevDesapDTO'])
        : null;
    _listaCartaz = json['listaCartaz'];
    _ocoId = json['ocoId'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['dtDesaparecimento'] = this._dtDesaparecimento;
    data['dataLocalizacao'] = this._dataLocalizacao;
    data['encontradoVivo'] = this._encontradoVivo;
    data['localDesaparecimentoConcat'] = this._localDesaparecimentoConcat;
    if (this._ocorrenciaEntrevDesapDTO != null) {
      data['ocorrenciaEntrevDesapDTO'] =
          this._ocorrenciaEntrevDesapDTO!.toJson();
    }
    data['listaCartaz'] = this._listaCartaz;
    data['ocoId'] = this._ocoId;
    return data;
  }
}

class OcorrenciaEntrevDesapDTO {
  String? _informacao;
  String? _vestimentasDesaparecido;

  OcorrenciaEntrevDesapDTO(
      {String? informacao, String? vestimentasDesaparecido}) {
    if (informacao != null) {
      this._informacao = informacao;
    }
    if (vestimentasDesaparecido != null) {
      this._vestimentasDesaparecido = vestimentasDesaparecido;
    }
  }

  String? get informacao => _informacao;
  set informacao(String? informacao) => _informacao = informacao;
  String? get vestimentasDesaparecido => _vestimentasDesaparecido;
  set vestimentasDesaparecido(String? vestimentasDesaparecido) =>
      _vestimentasDesaparecido = vestimentasDesaparecido;

  OcorrenciaEntrevDesapDTO.fromJson(Map<String, dynamic> json) {
    _informacao = json['informacao'];
    _vestimentasDesaparecido = json['vestimentasDesaparecido'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['informacao'] = this._informacao;
    data['vestimentasDesaparecido'] = this._vestimentasDesaparecido;
    return data;
  }
}