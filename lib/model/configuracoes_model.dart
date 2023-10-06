class ConfiguracoesModel {
  String _nomeUsuario = "";
  double _altura = 0;
  bool _receberNotificacoes = false;
  bool _temaEscuro = false;

  ConfiguracoesModel.vazio() {
    String _nomeUsuario = "";
    double _altura = 0;
    bool _receberNotificacoes = false;
    bool _temaEscuro = false;
  }

  ConfiguracoesModel(this._nomeUsuario, this._altura, this._receberNotificacoes,
      this._temaEscuro);

  String get nomeUsuario => _nomeUsuario;

  void set nomeUsuario(String nomeUsuario) {
    _nomeUsuario = nomeUsuario;
  }

  double get altura => _altura;

  void set altura(double altura) {
    _altura = altura;
  }

  bool get receberNotificacoes => _receberNotificacoes;

  void set receberNotificacoes(bool receberNotificacoes) {
    _receberNotificacoes = receberNotificacoes;
  }

  bool get temaEscuro => _temaEscuro;

  void set temaEscuro(bool temaEscuro) {
    _temaEscuro = temaEscuro;
  }
}
