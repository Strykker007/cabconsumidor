enum BankEnum {
  // bancoABCBrasil,
  // bancoAlfa,
  // bancoAlvorada,
  // bancoBanerj,
  // bancoBanestado,
  // bancoBankpar,
  // bancoBarclays,
  // bancoBBM,
  // bancoBeg,
  // bancoBMF,
  // bancoBMG,
  // bancoBNPParibasBrasil,
  // bancoBoavistaInteratlantico,
  // bancoBradescoBBI,
  // bancoBradescoCartoes,
  // bancoBrascan,
  // bancoBVA,
  // bancoCacique,
  // bancoCaixaGeralBrasil,
  // bancoCalyonBrasil,
  // bancoCargill,
  // bancoCiticard,
  // bancoCNHCapital,
  // bancoComercialInvestimentoSudameris,
  // bancoCooperativoBrasil,
  // bancoCooperativoSicredi,
  // bancoCreditSuisseBrasil,
  // bancoCruzeiroSul,
  // bancoDaAmazonia,
  // bancoDaChinaBrasil,
  // bancoDaycoval,
  // bancoDeLageLandenBrasil,
  // bancoDePernambuco,
  // bancoDeTokyoMitsubishiUFJBrasil,
  // bancoDibens,
  // bancoEstadoSergipe,
  // bancoEstadoPara,
  // bancoEstadoRioGrandeSul,
  // bancoNordesteBrasil,
  // bancoFator,
  // bancoFiat,
  // bancoFibra,
  // bancoFicsa,
  // bancoFinasaBMC,
  // bancoFord,
  // bancoGECapital,
  // bancoGerdau,
  // bancoGMAC,
  // bancoGuanabara,
  // bancoHonda,
  // bancoIbi,
  // bancoIBM,
  // bancoIndustrialBrasil,
  // bancoIndustrialComercial,
  // bancoIndusval,
  // bancoIntercap,
  // bancoInvestcredUnibanco,
  // bancoItauBBA,
  // bancoItauBank,
  // bancoItaucredFinanciamentos,
  // bancoJPMSafra,
  // bancoJohnDeere,
  // bancoLemon,
  // bancoLusoBrasileiro,
  // bancoMerrillLynchInvestimentos,
  // bancoModal,
  // bancoNossaCaixa,
  // bancoOpportunity,
  // bancoPanamericano,
  // bancoPaulista,
  // bancoPine,
  // bancoProsper,
  // bancoRabobankInternationalBrasil,
  // bancoRodobens,
  // bancoRuralMais,
  // bancoSchahin,
  // bancoSimples,
  // bancoSocieteGeneraleBrasil,
  // bancoSofisa,
  // bancoSumitomoMitsuiBrasileiro,
  // bancoTopazio,
  // bancoToyotaBrasil,
  // bancoTriangulo,
  // bancoUBSPactual,
  // bancoVolkswagen,
  // bancoVotorantim,
  // bancoVR,
  // bancoWestLBBrasil,
  // bancoBanestes,
  // bancoBanif,
  // bancoBBPopularBrasil,
  // bancoBESInvestimentoBrasil,
  // bancoBPNBrasil,
  // bancoBRBBancoBrasilia,
  // bancoCitibank,
  // bancoConcordia,
  // bancoDeutscheBank,
  // bancoDresdnerBankBrasil,
  // bancoHipercard,
  // bancoINGBank,
  // bancoJPMorganChase,
  bancoUnibanco,
  bancoUnicard,
  bancoBrasil,
  bancoSantander,
  caixaEconomica,
  bancoBradesco,
  bancoItau,
  bancoReal,
  bancoMercantil,
  hsbc,
  bancoSafra,
  bancoRural,
  bancoRendimento,
  itauUnibanco,
}

String getBankName(BankEnum banco) {
  switch (banco) {
    // case BankEnum.bancoABCBrasil:
    //   return "Banco ABC Brasil S.A.";
    // case BankEnum.bancoAlfa:
    //   return "Banco Alfa S.A.";
    // case BankEnum.bancoAlvorada:
    //   return "Banco Alvorada S.A.";
    // case BankEnum.bancoBanerj:
    //   return "Banco Banerj S.A.";
    // case BankEnum.bancoBanestado:
    //   return "Banco Banestado S.A.";
    // case BankEnum.bancoBankpar:
    //   return "Banco Bankpar S.A.";
    // case BankEnum.bancoBarclays:
    //   return "Banco Barclays S.A.";
    // case BankEnum.bancoBBM:
    //   return "Banco BBM S.A.";
    // case BankEnum.bancoBeg:
    //   return "Banco Beg S.A.";
    // case BankEnum.bancoBMF:
    //   return "Banco BM&F de Serviços de Liquidação e Custódia S.A";
    // case BankEnum.bancoBMG:
    //   return "Banco BMG S.A.";
    // case BankEnum.bancoBNPParibasBrasil:
    //   return "Banco BNP Paribas Brasil S.A.";
    // case BankEnum.bancoBoavistaInteratlantico:
    //   return "Banco Boavista Interatlântico S.A.";
    // case BankEnum.bancoBradescoBBI:
    //   return "Banco Bradesco BBI S.A.";
    // case BankEnum.bancoBradescoCartoes:
    //   return "Banco Bradesco Cartões S.A.";
    // case BankEnum.bancoBrascan:
    //   return "Banco Brascan S.A.";
    // case BankEnum.bancoBVA:
    //   return "Banco BVA S.A.";
    // case BankEnum.bancoCacique:
    //   return "Banco Cacique S.A.";
    // case BankEnum.bancoCaixaGeralBrasil:
    //   return "Banco Caixa Geral – Brasil S.A.";
    // case BankEnum.bancoCalyonBrasil:
    //   return "Banco Calyon Brasil S.A.";
    // case BankEnum.bancoCargill:
    //   return "Banco Cargill S.A.";
    // case BankEnum.bancoCiticard:
    //   return "Banco Citicard S.A.";
    // case BankEnum.bancoCNHCapital:
    //   return "Banco CNH Capital S.A.";
    // case BankEnum.bancoComercialInvestimentoSudameris:
    //   return "Banco Comercial e de Investimento Sudameris S.A.";
    // case BankEnum.bancoCooperativoBrasil:
    //   return "Banco Cooperativo do Brasil S.A. – BANCOOB";
    // case BankEnum.bancoCooperativoSicredi:
    //   return "Banco Cooperativo Sicredi S.A.";
    // case BankEnum.bancoCreditSuisseBrasil:
    //   return "Banco Credit Suisse (Brasil) S.A.";
    // case BankEnum.bancoCruzeiroSul:
    //   return "Banco Cruzeiro do Sul S.A.";
    // case BankEnum.bancoDaAmazonia:
    //   return "Banco da Amazônia S.A.";
    // case BankEnum.bancoDaChinaBrasil:
    //   return "Banco da China Brasil S.A.";
    // case BankEnum.bancoDaycoval:
    //   return "Banco Daycoval S.A.";
    // case BankEnum.bancoDeLageLandenBrasil:
    //   return "Banco de Lage Landen Brasil S.A.";
    // case BankEnum.bancoDePernambuco:
    //   return "Banco de Pernambuco S.A. – BANDEPE";
    // case BankEnum.bancoDeTokyoMitsubishiUFJBrasil:
    //   return "Banco de Tokyo-Mitsubishi UFJ Brasil S.A.";
    // case BankEnum.bancoDibens:
    //   return "Banco Dibens S.A.";
    // case BankEnum.bancoEstadoSergipe:
    //   return "Banco do Estado de Sergipe S.A.";
    // case BankEnum.bancoEstadoPara:
    //   return "Banco do Estado do Pará S.A.";
    // case BankEnum.bancoEstadoRioGrandeSul:
    //   return "Banco do Estado do Rio Grande do Sul S.A.";
    // case BankEnum.bancoNordesteBrasil:
    //   return "Banco do Nordeste do Brasil S.A.";
    // case BankEnum.bancoFator:
    //   return "Banco Fator S.A.";
    // case BankEnum.bancoFiat:
    //   return "Banco Fiat S.A.";
    // case BankEnum.bancoFibra:
    //   return "Banco Fibra S.A.";
    // case BankEnum.bancoFicsa:
    //   return "Banco Ficsa S.A.";
    // case BankEnum.bancoFinasaBMC:
    //   return "Banco Finasa BMC S.A.";
    // case BankEnum.bancoFord:
    //   return "Banco Ford S.A.";
    // case BankEnum.bancoGECapital:
    //   return "Banco GE Capital S.A.";
    // case BankEnum.bancoGerdau:
    //   return "Banco Gerdau S.A.";
    // case BankEnum.bancoGMAC:
    //   return "Banco GMAC S.A.";
    // case BankEnum.bancoGuanabara:
    //   return "Banco Guanabara S.A.";
    // case BankEnum.bancoHonda:
    //   return "Banco Honda S.A.";
    // case BankEnum.bancoIbi:
    //   return "Banco Ibi S.A. Banco Múltiplo";
    // case BankEnum.bancoIBM:
    //   return "Banco IBM S.A.";
    // case BankEnum.bancoIndustrialBrasil:
    //   return "Banco Industrial do Brasil S.A.";
    // case BankEnum.bancoIndustrialComercial:
    //   return "Banco Industrial e Comercial S.A.";
    // case BankEnum.bancoIndusval:
    //   return "Banco Indusval S.A.";
    // case BankEnum.bancoIntercap:
    //   return "Banco Intercap S.A.";
    // case BankEnum.bancoInvestcredUnibanco:
    //   return "Banco Investcred Unibanco S.A.";
    // case BankEnum.bancoItauBBA:
    //   return "Banco Itaú BBA S.A.";
    // case BankEnum.bancoItauBank:
    //   return "Banco ItaúBank S.A";
    // case BankEnum.bancoItaucredFinanciamentos:
    //   return "Banco Itaucred Financiamentos S.A.";
    // case BankEnum.bancoJPMSafra:
    //   return "Banco J. P. Morgan S.A.";
    // case BankEnum.bancoJohnDeere:
    //   return "Banco John Deere S.A.";
    // case BankEnum.bancoLemon:
    //   return "Banco Lemon S.A.";
    // case BankEnum.bancoLusoBrasileiro:
    //   return "Banco Luso Brasileiro S.A.";
    // case BankEnum.bancoMerrillLynchInvestimentos:
    //   return "Banco Merrill Lynch de Investimentos S.A.";
    // case BankEnum.bancoModal:
    //   return "Banco Modal S.A.";
    // case BankEnum.bancoNossaCaixa:
    //   return "Banco Nossa Caixa S.A.";
    // case BankEnum.bancoOpportunity:
    //   return "Banco Opportunity S.A.";
    // case BankEnum.bancoPanamericano:
    //   return "Banco Panamericano S.A.";
    // case BankEnum.bancoPaulista:
    //   return "Banco Paulista S.A.";
    // case BankEnum.bancoPine:
    //   return "Banco Pine S.A.";
    // case BankEnum.bancoProsper:
    //   return "Banco Prosper S.A.";
    // case BankEnum.bancoRabobankInternationalBrasil:
    //   return "Banco Rabobank International Brasil S.A.";
    // case BankEnum.bancoRodobens:
    //   return "Banco Rodobens S.A.";
    // case BankEnum.bancoRuralMais:
    //   return "Banco Rural Mais S.A.";
    // case BankEnum.bancoSchahin:
    //   return "Banco Schahin S.A.";
    // case BankEnum.bancoSimples:
    //   return "Banco Simples S.A.";
    // case BankEnum.bancoSocieteGeneraleBrasil:
    //   return "Banco Société Générale Brasil S.A.";
    // case BankEnum.bancoSofisa:
    //   return "Banco Sofisa S.A.";
    // case BankEnum.bancoSumitomoMitsuiBrasileiro:
    //   return "Banco Sumitomo Mitsui Brasileiro S.A.";
    // case BankEnum.bancoTopazio:
    //   return "Banco Topázio S.A.";
    // case BankEnum.bancoToyotaBrasil:
    //   return "Banco Toyota do Brasil S.A.";
    // case BankEnum.bancoTriangulo:
    //   return "Banco Triângulo S.A.";
    // case BankEnum.bancoUBSPactual:
    //   return "Banco UBS Pactual S.A.";
    // case BankEnum.bancoVolkswagen:
    //   return "Banco Volkswagen S.A.";
    // case BankEnum.bancoVotorantim:
    //   return "Banco Votorantim S.A.";
    // case BankEnum.bancoVR:
    //   return "Banco VR S.A.";
    // case BankEnum.bancoWestLBBrasil:
    //   return "Banco WestLB do Brasil S.A.";
    // case BankEnum.bancoBanestes:
    //   return "BANESTES S.A. Banco do Estado do Espírito Santo";
    // case BankEnum.bancoBanif:
    //   return "Banif-Banco Internacional do Funchal (Brasil)S.A.";
    // case BankEnum.bancoBBPopularBrasil:
    //   return "BB Banco Popular do Brasil S.A.";
    // case BankEnum.bancoBESInvestimentoBrasil:
    //   return "BES Investimento do Brasil S.A.-Banco de Investimento";
    // case BankEnum.bancoBPNBrasil:
    //   return "BPN Brasil Banco Múltiplo S.A.";
    // case BankEnum.bancoBRBBancoBrasilia:
    //   return "BRB – Banco de Brasília S.A.";
    // case BankEnum.bancoCitibank:
    //   return "Citibank N.A.";
    // case BankEnum.bancoConcordia:
    //   return "Concórdia Banco S.A.";
    // case BankEnum.bancoDeutscheBank:
    //   return "Deutsche Bank S.A. – Banco Alemão";
    // case BankEnum.bancoDresdnerBankBrasil:
    //   return "Dresdner Bank Brasil S.A. – Banco Múltiplo";
    // case BankEnum.bancoHipercard:
    //   return "Hipercard Banco Múltiplo S.A.";
    // case BankEnum.bancoINGBank:
    //   return "ING Bank N.V.";
    // case BankEnum.bancoJPMorganChase:
    //   return "JPMorgan Chase Bank";
    case BankEnum.bancoUnibanco:
      return "UNIBANCO – União de Bancos Brasileiros S.A.";
    case BankEnum.bancoUnicard:
      return "Unicard Banco Múltiplo S.A.";
    case BankEnum.bancoBrasil:
      return "Banco do Brasil S.A.";
    case BankEnum.bancoSantander:
      return "Banco Santander (Brasil) S.A.";
    case BankEnum.caixaEconomica:
      return "Caixa Econômica Federal";
    case BankEnum.bancoBradesco:
      return "Banco Bradesco S.A.";
    case BankEnum.bancoItau:
      return "Banco Itaú S.A.";
    case BankEnum.bancoReal:
      return "Banco Real S.A. (antigo)";
    case BankEnum.bancoMercantil:
      return "Banco Mercantil do Brasil S.A.";
    case BankEnum.hsbc:
      return "HSBC Bank Brasil S.A. – Banco Múltiplo";
    case BankEnum.bancoSafra:
      return "Banco Safra S.A.";
    case BankEnum.bancoRural:
      return "Banco Rural S.A.";
    case BankEnum.bancoRendimento:
      return "Banco Rendimento S.A.";
    case BankEnum.itauUnibanco:
      return "Itaú Unibanco Holding S.A.";
  }
}

BankEnum getBankByCode(String codigo) {
  switch (codigo) {
    // case "246":
    //   return BankEnum.bancoABCBrasil;
    // case "025":
    //   return BankEnum.bancoAlfa;
    // case "641":
    //   return BankEnum.bancoAlvorada;
    // case "029":
    //   return BankEnum.bancoBanerj;
    // case "038":
    //   return BankEnum.bancoBanestado;
    // case "000":
    //   return BankEnum.bancoBankpar;
    // case "740":
    //   return BankEnum.bancoBarclays;
    // case "107":
    //   return BankEnum.bancoBBM;
    // case "031":
    //   return BankEnum.bancoBeg;
    // case "096":
    //   return BankEnum.bancoBMF;
    // case "318":
    //   return BankEnum.bancoBMG;
    // case "752":
    //   return BankEnum.bancoBNPParibasBrasil;
    // case "248":
    //   return BankEnum.bancoBoavistaInteratlantico;
    // case "036":
    //   return BankEnum.bancoBradescoBBI;
    // case "204":
    //   return BankEnum.bancoBradescoCartoes;
    // case "225":
    //   return BankEnum.bancoBrascan;
    // case "044":
    //   return BankEnum.bancoBVA;
    // case "263":
    //   return BankEnum.bancoCacique;
    // case "473":
    //   return BankEnum.bancoCaixaGeralBrasil;
    // case "222":
    //   return BankEnum.bancoCalyonBrasil;
    // case "040":
    //   return BankEnum.bancoCargill;
    // case "M08":
    //   return BankEnum.bancoCiticard;
    // case "M19":
    //   return BankEnum.bancoCNHCapital;
    // case "215":
    //   return BankEnum.bancoComercialInvestimentoSudameris;
    // case "756":
    //   return BankEnum.bancoCooperativoBrasil;
    // case "748":
    //   return BankEnum.bancoCooperativoSicredi;
    // case "505":
    //   return BankEnum.bancoCreditSuisseBrasil;
    // case "229":
    //   return BankEnum.bancoCruzeiroSul;
    // case "003":
    //   return BankEnum.bancoDaAmazonia;
    // case "083-3":
    //   return BankEnum.bancoDaChinaBrasil;
    // case "707":
    //   return BankEnum.bancoDaycoval;
    // case "M06":
    //   return BankEnum.bancoDeLageLandenBrasil;
    // case "024":
    //   return BankEnum.bancoDePernambuco;
    // case "456":
    //   return BankEnum.bancoDeTokyoMitsubishiUFJBrasil;
    // case "214":
    //   return BankEnum.bancoDibens;
    // case "047":
    //   return BankEnum.bancoEstadoSergipe;
    // case "037":
    //   return BankEnum.bancoEstadoPara;
    // case "041":
    //   return BankEnum.bancoEstadoRioGrandeSul;
    // case "004":
    //   return BankEnum.bancoNordesteBrasil;
    // case "265":
    //   return BankEnum.bancoFator;
    // case "M03":
    //   return BankEnum.bancoFiat;
    // case "224":
    //   return BankEnum.bancoFibra;
    // case "626":
    //   return BankEnum.bancoFicsa;
    // case "394":
    //   return BankEnum.bancoFinasaBMC;
    // case "M18":
    //   return BankEnum.bancoFord;
    // case "233":
    //   return BankEnum.bancoGECapital;
    // case "734":
    //   return BankEnum.bancoGerdau;
    // case "M07":
    //   return BankEnum.bancoGMAC;
    // case "612":
    //   return BankEnum.bancoGuanabara;
    // case "M22":
    //   return BankEnum.bancoHonda;
    // case "063":
    //   return BankEnum.bancoIbi;
    // case "M11":
    //   return BankEnum.bancoIBM;
    // case "604":
    //   return BankEnum.bancoIndustrialBrasil;
    // case "320":
    //   return BankEnum.bancoIndustrialComercial;
    // case "653":
    //   return BankEnum.bancoIndusval;
    // case "630":
    //   return BankEnum.bancoIntercap;
    // case "249":
    //   return BankEnum.bancoInvestcredUnibanco;
    // case "184":
    //   return BankEnum.bancoItauBBA;
    // case "479":
    //   return BankEnum.bancoItauBank;
    // case "M09":
    //   return BankEnum.bancoItaucredFinanciamentos;
    // case "376":
    //   return BankEnum.bancoJPMSafra;
    // case "074":
    //   return BankEnum.bancoJohnDeere;
    // case "217":
    //   return BankEnum.bancoLemon;
    // case "600":
    //   return BankEnum.bancoLusoBrasileiro;
    // case "755":
    //   return BankEnum.bancoMerrillLynchInvestimentos;
    // case "746":
    //   return BankEnum.bancoModal;
    // case "151":
    //   return BankEnum.bancoNossaCaixa;
    // case "045":
    //   return BankEnum.bancoOpportunity;
    // case "623":
    //   return BankEnum.bancoPanamericano;
    // case "611":
    //   return BankEnum.bancoPaulista;
    // case "643":
    //   return BankEnum.bancoPine;
    // case "638":
    //   return BankEnum.bancoProsper;
    // case "747":
    //   return BankEnum.bancoRabobankInternationalBrasil;
    // case "M16":
    //   return BankEnum.bancoRodobens;
    // case "072":
    //   return BankEnum.bancoRuralMais;
    // case "250":
    //   return BankEnum.bancoSchahin;
    // case "749":
    //   return BankEnum.bancoSimples;
    // case "366":
    //   return BankEnum.bancoSocieteGeneraleBrasil;
    // case "637":
    //   return BankEnum.bancoSofisa;
    // case "464":
    //   return BankEnum.bancoSumitomoMitsuiBrasileiro;
    // case "082-5":
    //   return BankEnum.bancoTopazio;
    // case "M20":
    //   return BankEnum.bancoToyotaBrasil;
    // case "634":
    //   return BankEnum.bancoTriangulo;
    // case "208":
    //   return BankEnum.bancoUBSPactual;
    // case "M14":
    //   return BankEnum.bancoVolkswagen;
    // case "655":
    //   return BankEnum.bancoVotorantim;
    // case "610":
    //   return BankEnum.bancoVR;
    // case "370":
    //   return BankEnum.bancoWestLBBrasil;
    // case "021":
    //   return BankEnum.bancoBanestes;
    // case "719":
    //   return BankEnum.bancoBanif;
    // case "073":
    //   return BankEnum.bancoBBPopularBrasil;
    // case "078":
    //   return BankEnum.bancoBESInvestimentoBrasil;
    // case "069":
    //   return BankEnum.bancoBPNBrasil;
    // case "070":
    //   return BankEnum.bancoBRBBancoBrasilia;
    // case "477":
    //   return BankEnum.bancoCitibank;
    // case "081-7":
    //   return BankEnum.bancoConcordia;
    // case "487":
    //   return BankEnum.bancoDeutscheBank;
    // case "751":
    //   return BankEnum.bancoDresdnerBankBrasil;
    // case "062":
    //   return BankEnum.bancoHipercard;
    // case "492":
    //   return BankEnum.bancoINGBank;
    // case "488":
    //   return BankEnum.bancoJPMorganChase;
    case "409":
      return BankEnum.bancoUnibanco;
    case "230":
      return BankEnum.bancoUnicard;
    case "001":
      return BankEnum.bancoBrasil;
    case "033":
      return BankEnum.bancoSantander;
    case "104":
      return BankEnum.caixaEconomica;
    case "237":
      return BankEnum.bancoBradesco;
    case "341":
      return BankEnum.bancoItau;
    case "356":
      return BankEnum.bancoReal;
    case "389":
      return BankEnum.bancoMercantil;
    case "399":
      return BankEnum.hsbc;
    case "422":
      return BankEnum.bancoSafra;
    case "453":
      return BankEnum.bancoRural;
    case "633":
      return BankEnum.bancoRendimento;
    case "652":
      return BankEnum.itauUnibanco;
    default:
      throw Exception("Código de banco desconhecido: $codigo");
  }
}

String? getCodeByEnum(BankEnum value) {
  switch (value) {
    // case BankEnum.bancoABCBrasil:
    //   return "246";
    // case BankEnum.bancoAlfa:
    //   return "025";
    // case BankEnum.bancoAlvorada:
    //   return "641";
    // case BankEnum.bancoBanerj:
    //   return "029";
    // case BankEnum.bancoBanestado:
    //   return "038";
    // case BankEnum.bancoBankpar:
    //   return "000";
    // case BankEnum.bancoBarclays:
    //   return "740";
    // case BankEnum.bancoBBM:
    //   return "107";
    // case BankEnum.bancoBeg:
    //   return "031";
    // case BankEnum.bancoBMF:
    //   return "096";
    // case BankEnum.bancoBMG:
    //   return "318";
    // case BankEnum.bancoBNPParibasBrasil:
    //   return "752";
    // case BankEnum.bancoBoavistaInteratlantico:
    //   return "248";
    // case BankEnum.bancoBradescoBBI:
    //   return "036";
    // case BankEnum.bancoBradescoCartoes:
    //   return "204";
    // case BankEnum.bancoBrascan:
    //   return "225";
    // case BankEnum.bancoBVA:
    //   return "044";
    // case BankEnum.bancoCacique:
    //   return "263";
    // case BankEnum.bancoCaixaGeralBrasil:
    //   return "473";
    // case BankEnum.bancoCalyonBrasil:
    //   return "222";
    // case BankEnum.bancoCargill:
    //   return "040";
    // case BankEnum.bancoCiticard:
    //   return "M08";
    // case BankEnum.bancoCNHCapital:
    //   return "M19";
    // case BankEnum.bancoComercialInvestimentoSudameris:
    //   return "215";
    // case BankEnum.bancoCooperativoBrasil:
    //   return "756";
    // case BankEnum.bancoCooperativoSicredi:
    //   return "748";
    // case BankEnum.bancoCreditSuisseBrasil:
    //   return "505";
    // case BankEnum.bancoCruzeiroSul:
    //   return "229";
    // case BankEnum.bancoDaAmazonia:
    //   return "003";
    // case BankEnum.bancoDaChinaBrasil:
    //   return "083-3";
    // case BankEnum.bancoDaycoval:
    //   return "707";
    // case BankEnum.bancoDeLageLandenBrasil:
    //   return "M06";
    // case BankEnum.bancoDePernambuco:
    //   return "024";
    // case BankEnum.bancoDeTokyoMitsubishiUFJBrasil:
    //   return "456";
    // case BankEnum.bancoDibens:
    //   return "214";
    // case BankEnum.bancoEstadoSergipe:
    //   return "047";
    // case BankEnum.bancoEstadoPara:
    //   return "037";
    // case BankEnum.bancoEstadoRioGrandeSul:
    //   return "041";
    // case BankEnum.bancoNordesteBrasil:
    //   return "004";
    // case BankEnum.bancoFator:
    //   return "265";
    // case BankEnum.bancoFiat:
    //   return "M03";
    // case BankEnum.bancoFibra:
    //   return "224";
    // case BankEnum.bancoFicsa:
    //   return "626";
    // case BankEnum.bancoFinasaBMC:
    //   return "394";
    // case BankEnum.bancoFord:
    //   return "M18";
    // case BankEnum.bancoGECapital:
    //   return "233";
    // case BankEnum.bancoGerdau:
    //   return "734";
    // case BankEnum.bancoGMAC:
    //   return "M07";
    // case BankEnum.bancoGuanabara:
    //   return "612";
    // case BankEnum.bancoHonda:
    //   return "M22";
    // case BankEnum.bancoIbi:
    //   return "063";
    // case BankEnum.bancoIBM:
    //   return "M11";
    // case BankEnum.bancoIndustrialBrasil:
    //   return "604";
    // case BankEnum.bancoIndustrialComercial:
    //   return "320";
    // case BankEnum.bancoIndusval:
    //   return "653";
    // case BankEnum.bancoIntercap:
    //   return "630";
    // case BankEnum.bancoInvestcredUnibanco:
    //   return "249";
    // case BankEnum.bancoItauBBA:
    //   return "184";
    // case BankEnum.bancoItauBank:
    //   return "479";
    // case BankEnum.bancoItaucredFinanciamentos:
    //   return "M09";
    // case BankEnum.bancoJohnDeere:
    //   return "217";
    // case BankEnum.bancoLemon:
    //   return "065";
    // case BankEnum.bancoLusoBrasileiro:
    //   return "600";
    // case BankEnum.bancoModal:
    //   return "746";
    // case BankEnum.bancoNossaCaixa:
    //   return "151";
    // case BankEnum.bancoOpportunity:
    //   return "045";
    // case BankEnum.bancoPanamericano:
    //   return "623";
    // case BankEnum.bancoPaulista:
    //   return "611";
    // case BankEnum.bancoPine:
    //   return "643";
    // case BankEnum.bancoProsper:
    //   return "638";
    // case BankEnum.bancoRodobens:
    //   return "M16";
    // case BankEnum.bancoRuralMais:
    //   return "072";
    // case BankEnum.bancoSchahin:
    //   return "250";
    // case BankEnum.bancoSimples:
    //   return "749";
    // case BankEnum.bancoSofisa:
    //   return "637";
    // case BankEnum.bancoTopazio:
    //   return "082-5";
    // case BankEnum.bancoTriangulo:
    //   return "634";
    // case BankEnum.bancoUBSPactual:
    //   return "208";
    // case BankEnum.bancoVolkswagen:
    //   return "M14";
    // case BankEnum.bancoVotorantim:
    //   return "655";
    // case BankEnum.bancoVR:
    //   return "610";
    // case BankEnum.bancoBanestes:
    //   return "021";
    // case BankEnum.bancoBanif:
    //   return "719";
    // case BankEnum.bancoBPNBrasil:
    //   return "069";
    // case BankEnum.bancoBRBBancoBrasilia:
    //   return "070";
    // case BankEnum.bancoCitibank:
    //   return "477";
    // case BankEnum.bancoConcordia:
    //   return "081-7";
    // case BankEnum.bancoDeutscheBank:
    //   return "487";
    // case BankEnum.bancoHipercard:
    //   return "062";
    // case BankEnum.bancoINGBank:
    //   return "492";
    // case BankEnum.bancoJPMorganChase:
    //   return "488";
    case BankEnum.bancoUnibanco:
      return "409";
    case BankEnum.bancoUnicard:
      return "230";
    case BankEnum.bancoBrasil:
      return "001";
    case BankEnum.bancoSantander:
      return "033";
    case BankEnum.caixaEconomica:
      return "104";
    case BankEnum.bancoBradesco:
      return "237";
    case BankEnum.bancoItau:
      return "341";
    case BankEnum.bancoReal:
      return "356";
    case BankEnum.bancoMercantil:
      return "389";
    case BankEnum.hsbc:
      return "399";
    case BankEnum.bancoSafra:
      return "422";
    case BankEnum.bancoRural:
      return "453";
    case BankEnum.bancoRendimento:
      return "633";
    case BankEnum.itauUnibanco:
      return "652";
    // case BankEnum.bancoJPMSafra:
    //   return '488';
    // case BankEnum.bancoMerrillLynchInvestimentos:
    //   return '755';
    // case BankEnum.bancoRabobankInternationalBrasil:
    //   return '747';
    // case BankEnum.bancoSocieteGeneraleBrasil:
    //   return '366';
    // case BankEnum.bancoSumitomoMitsuiBrasileiro:
    //   return '464';
    // case BankEnum.bancoToyotaBrasil:
    //   return 'M20';
    // case BankEnum.bancoWestLBBrasil:
    //   return '370';
    // case BankEnum.bancoBBPopularBrasil:
    //   return '073';
    // case BankEnum.bancoBESInvestimentoBrasil:
    //   return '078';
    // case BankEnum.bancoDresdnerBankBrasil:
    //   return '751';
  }
}

extension BanksExtensionEnum on BankEnum {
  String? get label {
    switch (this) {
      // case BankEnum.bancoABCBrasil:
      //   return "Banco ABC Brasil S.A.";
      // case BankEnum.bancoAlfa:
      //   return "Banco Alfa S.A.";
      // case BankEnum.bancoAlvorada:
      //   return "Banco Alvorada S.A.";
      // case BankEnum.bancoBanerj:
      //   return "Banco Banerj S.A.";
      // case BankEnum.bancoBanestado:
      //   return "Banco Banestado S.A.";
      // case BankEnum.bancoBankpar:
      //   return "Banco Bankpar S.A.";
      // case BankEnum.bancoBarclays:
      //   return "Banco Barclays S.A.";
      // case BankEnum.bancoBBM:
      //   return "Banco BBM S.A.";
      // case BankEnum.bancoBeg:
      //   return "Banco Beg S.A.";
      // case BankEnum.bancoBMF:
      //   return "Banco BM&F de Serviços de Liquidação e Custódia S.A";
      // case BankEnum.bancoBMG:
      //   return "Banco BMG S.A.";
      // case BankEnum.bancoBNPParibasBrasil:
      //   return "Banco BNP Paribas Brasil S.A.";
      // case BankEnum.bancoBoavistaInteratlantico:
      //   return "Banco Boavista Interatlântico S.A.";
      // case BankEnum.bancoBradescoBBI:
      //   return "Banco Bradesco BBI S.A.";
      // case BankEnum.bancoBradescoCartoes:
      //   return "Banco Bradesco Cartões S.A.";
      // case BankEnum.bancoBrascan:
      //   return "Banco Brascan S.A.";
      // case BankEnum.bancoBVA:
      //   return "Banco BVA S.A.";
      // case BankEnum.bancoCacique:
      //   return "Banco Cacique S.A.";
      // case BankEnum.bancoCaixaGeralBrasil:
      //   return "Banco Caixa Geral – Brasil S.A.";
      // case BankEnum.bancoCalyonBrasil:
      //   return "Banco Calyon Brasil S.A.";
      // case BankEnum.bancoCargill:
      //   return "Banco Cargill S.A.";
      // case BankEnum.bancoCiticard:
      //   return "Banco Citicard S.A.";
      // case BankEnum.bancoCNHCapital:
      //   return "Banco CNH Capital S.A.";
      // case BankEnum.bancoComercialInvestimentoSudameris:
      //   return "Banco Comercial e de Investimento Sudameris S.A.";
      // case BankEnum.bancoCooperativoBrasil:
      //   return "Banco Cooperativo do Brasil S.A. – BANCOOB";
      // case BankEnum.bancoCooperativoSicredi:
      //   return "Banco Cooperativo Sicredi S.A.";
      // case BankEnum.bancoCreditSuisseBrasil:
      //   return "Banco Credit Suisse (Brasil) S.A.";
      // case BankEnum.bancoCruzeiroSul:
      //   return "Banco Cruzeiro do Sul S.A.";
      // case BankEnum.bancoDaAmazonia:
      //   return "Banco da Amazônia S.A.";
      // case BankEnum.bancoDaChinaBrasil:
      //   return "Banco da China Brasil S.A.";
      // case BankEnum.bancoDaycoval:
      //   return "Banco Daycoval S.A.";
      // case BankEnum.bancoDeLageLandenBrasil:
      //   return "Banco de Lage Landen Brasil S.A.";
      // case BankEnum.bancoDePernambuco:
      //   return "Banco de Pernambuco S.A. – BANDEPE";
      // case BankEnum.bancoDeTokyoMitsubishiUFJBrasil:
      //   return "Banco de Tokyo-Mitsubishi UFJ Brasil S.A.";
      // case BankEnum.bancoDibens:
      //   return "Banco Dibens S.A.";
      // case BankEnum.bancoEstadoSergipe:
      //   return "Banco do Estado de Sergipe S.A.";
      // case BankEnum.bancoEstadoPara:
      //   return "Banco do Estado do Pará S.A.";
      // case BankEnum.bancoEstadoRioGrandeSul:
      //   return "Banco do Estado do Rio Grande do Sul S.A.";
      // case BankEnum.bancoNordesteBrasil:
      //   return "Banco do Nordeste do Brasil S.A.";
      // case BankEnum.bancoFator:
      //   return "Banco Fator S.A.";
      // case BankEnum.bancoFiat:
      //   return "Banco Fiat S.A.";
      // case BankEnum.bancoFibra:
      //   return "Banco Fibra S.A.";
      // case BankEnum.bancoFicsa:
      //   return "Banco Ficsa S.A.";
      // case BankEnum.bancoFinasaBMC:
      //   return "Banco Finasa BMC S.A.";
      // case BankEnum.bancoFord:
      //   return "Banco Ford S.A.";
      // case BankEnum.bancoGECapital:
      //   return "Banco GE Capital S.A.";
      // case BankEnum.bancoGerdau:
      //   return "Banco Gerdau S.A.";
      // case BankEnum.bancoGMAC:
      //   return "Banco GMAC S.A.";
      // case BankEnum.bancoGuanabara:
      //   return "Banco Guanabara S.A.";
      // case BankEnum.bancoHonda:
      //   return "Banco Honda S.A.";
      // case BankEnum.bancoIbi:
      //   return "Banco Ibi S.A. Banco Múltiplo";
      // case BankEnum.bancoIBM:
      //   return "Banco IBM S.A.";
      // case BankEnum.bancoIndustrialBrasil:
      //   return "Banco Industrial do Brasil S.A.";
      // case BankEnum.bancoIndustrialComercial:
      //   return "Banco Industrial e Comercial S.A.";
      // case BankEnum.bancoIndusval:
      //   return "Banco Indusval S.A.";
      // case BankEnum.bancoIntercap:
      //   return "Banco Intercap S.A.";
      // case BankEnum.bancoInvestcredUnibanco:
      //   return "Banco Investcred Unibanco S.A.";
      // case BankEnum.bancoItauBBA:
      //   return "Banco Itaú BBA S.A.";
      // case BankEnum.bancoItauBank:
      //   return "Banco ItaúBank S.A";
      // case BankEnum.bancoItaucredFinanciamentos:
      //   return "Banco Itaucred Financiamentos S.A.";
      // case BankEnum.bancoJPMSafra:
      //   return "Banco J. P. Morgan S.A.";
      // case BankEnum.bancoJohnDeere:
      //   return "Banco John Deere S.A.";
      // case BankEnum.bancoLemon:
      //   return "Banco Lemon S.A.";
      // case BankEnum.bancoLusoBrasileiro:
      //   return "Banco Luso Brasileiro S.A.";
      // case BankEnum.bancoMerrillLynchInvestimentos:
      //   return "Banco Merrill Lynch de Investimentos S.A.";
      // case BankEnum.bancoModal:
      //   return "Banco Modal S.A.";
      // case BankEnum.bancoNossaCaixa:
      //   return "Banco Nossa Caixa S.A.";
      // case BankEnum.bancoOpportunity:
      //   return "Banco Opportunity S.A.";
      // case BankEnum.bancoPanamericano:
      //   return "Banco Panamericano S.A.";
      // case BankEnum.bancoPaulista:
      //   return "Banco Paulista S.A.";
      // case BankEnum.bancoPine:
      //   return "Banco Pine S.A.";
      // case BankEnum.bancoProsper:
      //   return "Banco Prosper S.A.";
      // case BankEnum.bancoRabobankInternationalBrasil:
      //   return "Banco Rabobank International Brasil S.A.";
      // case BankEnum.bancoRodobens:
      //   return "Banco Rodobens S.A.";
      // case BankEnum.bancoRuralMais:
      //   return "Banco Rural Mais S.A.";
      // case BankEnum.bancoSchahin:
      //   return "Banco Schahin S.A.";
      // case BankEnum.bancoSimples:
      //   return "Banco Simples S.A.";
      // case BankEnum.bancoSocieteGeneraleBrasil:
      //   return "Banco Société Générale Brasil S.A.";
      // case BankEnum.bancoSofisa:
      //   return "Banco Sofisa S.A.";
      // case BankEnum.bancoSumitomoMitsuiBrasileiro:
      //   return "Banco Sumitomo Mitsui Brasileiro S.A.";
      // case BankEnum.bancoTopazio:
      //   return "Banco Topázio S.A.";
      // case BankEnum.bancoToyotaBrasil:
      //   return "Banco Toyota do Brasil S.A.";
      // case BankEnum.bancoTriangulo:
      //   return "Banco Triângulo S.A.";
      // case BankEnum.bancoUBSPactual:
      //   return "Banco UBS Pactual S.A.";
      // case BankEnum.bancoVolkswagen:
      //   return "Banco Volkswagen S.A.";
      // case BankEnum.bancoVotorantim:
      //   return "Banco Votorantim S.A.";
      // case BankEnum.bancoVR:
      //   return "Banco VR S.A.";
      // case BankEnum.bancoWestLBBrasil:
      //   return "Banco WestLB do Brasil S.A.";
      // case BankEnum.bancoBanestes:
      //   return "BANESTES S.A. Banco do Estado do Espírito Santo";
      // case BankEnum.bancoBanif:
      //   return "Banif-Banco Internacional do Funchal (Brasil)S.A.";
      // case BankEnum.bancoBBPopularBrasil:
      //   return "BB Banco Popular do Brasil S.A.";
      // case BankEnum.bancoBESInvestimentoBrasil:
      //   return "BES Investimento do Brasil S.A.-Banco de Investimento";
      // case BankEnum.bancoBPNBrasil:
      //   return "BPN Brasil Banco Múltiplo S.A.";
      // case BankEnum.bancoBRBBancoBrasilia:
      //   return "BRB – Banco de Brasília S.A.";
      // case BankEnum.bancoCitibank:
      //   return "Citibank N.A.";
      // case BankEnum.bancoConcordia:
      //   return "Concórdia Banco S.A.";
      // case BankEnum.bancoDeutscheBank:
      //   return "Deutsche Bank S.A. – Banco Alemão";
      // case BankEnum.bancoDresdnerBankBrasil:
      //   return "Dresdner Bank Brasil S.A. – Banco Múltiplo";
      // case BankEnum.bancoHipercard:
      //   return "Hipercard Banco Múltiplo S.A.";
      // case BankEnum.bancoINGBank:
      //   return "ING Bank N.V.";
      // case BankEnum.bancoJPMorganChase:
      //   return "JPMorgan Chase Bank";
      case BankEnum.bancoUnibanco:
        return "UNIBANCO – União de Bancos Brasileiros S.A.";
      case BankEnum.bancoUnicard:
        return "Unicard Banco Múltiplo S.A.";
      case BankEnum.bancoBrasil:
        return "Banco do Brasil S.A.";
      case BankEnum.bancoSantander:
        return "Banco Santander (Brasil) S.A.";
      case BankEnum.caixaEconomica:
        return "Caixa Econômica Federal";
      case BankEnum.bancoBradesco:
        return "Banco Bradesco S.A.";
      case BankEnum.bancoItau:
        return "Banco Itaú S.A.";
      case BankEnum.bancoReal:
        return "Banco Real S.A. (antigo)";
      case BankEnum.bancoMercantil:
        return "Banco Mercantil do Brasil S.A.";
      case BankEnum.hsbc:
        return "HSBC Bank Brasil S.A. – Banco Múltiplo";
      case BankEnum.bancoSafra:
        return "Banco Safra S.A.";
      case BankEnum.bancoRural:
        return "Banco Rural S.A.";
      case BankEnum.bancoRendimento:
        return "Banco Rendimento S.A.";
      case BankEnum.itauUnibanco:
        return "Itaú Unibanco Holding S.A.";
    }
  }

  String? get code {
    switch (this) {
      // case BankEnum.bancoABCBrasil:
      //   return "246";
      // case BankEnum.bancoAlfa:
      //   return "025";
      // case BankEnum.bancoAlvorada:
      //   return "641";
      // case BankEnum.bancoBanerj:
      //   return "029";
      // case BankEnum.bancoBanestado:
      //   return "038";
      // case BankEnum.bancoBankpar:
      //   return "000";
      // case BankEnum.bancoBarclays:
      //   return "740";
      // case BankEnum.bancoBBM:
      //   return "107";
      // case BankEnum.bancoBeg:
      //   return "031";
      // case BankEnum.bancoBMF:
      //   return "096";
      // case BankEnum.bancoBMG:
      //   return "318";
      // case BankEnum.bancoBNPParibasBrasil:
      //   return "752";
      // case BankEnum.bancoBoavistaInteratlantico:
      //   return "248";
      // case BankEnum.bancoBradescoBBI:
      //   return "036";
      // case BankEnum.bancoBradescoCartoes:
      //   return "204";
      // case BankEnum.bancoBrascan:
      //   return "225";
      // case BankEnum.bancoBVA:
      //   return "044";
      // case BankEnum.bancoCacique:
      //   return "263";
      // case BankEnum.bancoCaixaGeralBrasil:
      //   return "473";
      // case BankEnum.bancoCalyonBrasil:
      //   return "222";
      // case BankEnum.bancoCargill:
      //   return "040";
      // case BankEnum.bancoCiticard:
      //   return "M08";
      // case BankEnum.bancoCNHCapital:
      //   return "M19";
      // case BankEnum.bancoComercialInvestimentoSudameris:
      //   return "215";
      // case BankEnum.bancoCooperativoBrasil:
      //   return "756";
      // case BankEnum.bancoCooperativoSicredi:
      //   return "748";
      // case BankEnum.bancoCreditSuisseBrasil:
      //   return "505";
      // case BankEnum.bancoCruzeiroSul:
      //   return "229";
      // case BankEnum.bancoDaAmazonia:
      //   return "003";
      // case BankEnum.bancoDaChinaBrasil:
      //   return "083-3";
      // case BankEnum.bancoDaycoval:
      //   return "707";
      // case BankEnum.bancoDeLageLandenBrasil:
      //   return "M06";
      // case BankEnum.bancoDePernambuco:
      //   return "024";
      // case BankEnum.bancoDeTokyoMitsubishiUFJBrasil:
      //   return "456";
      // case BankEnum.bancoDibens:
      //   return "214";
      // case BankEnum.bancoEstadoSergipe:
      //   return "047";
      // case BankEnum.bancoEstadoPara:
      //   return "037";
      // case BankEnum.bancoEstadoRioGrandeSul:
      //   return "041";
      // case BankEnum.bancoNordesteBrasil:
      //   return "004";
      // case BankEnum.bancoFator:
      //   return "265";
      // case BankEnum.bancoFiat:
      //   return "M03";
      // case BankEnum.bancoFibra:
      //   return "224";
      // case BankEnum.bancoFicsa:
      //   return "626";
      // case BankEnum.bancoFinasaBMC:
      //   return "394";
      // case BankEnum.bancoFord:
      //   return "M18";
      // case BankEnum.bancoGECapital:
      //   return "233";
      // case BankEnum.bancoGerdau:
      //   return "734";
      // case BankEnum.bancoGMAC:
      //   return "M07";
      // case BankEnum.bancoGuanabara:
      //   return "612";
      // case BankEnum.bancoHonda:
      //   return "M22";
      // case BankEnum.bancoIbi:
      //   return "063";
      // case BankEnum.bancoIBM:
      //   return "M11";
      // case BankEnum.bancoIndustrialBrasil:
      //   return "604";
      // case BankEnum.bancoIndustrialComercial:
      //   return "320";
      // case BankEnum.bancoIndusval:
      //   return "653";
      // case BankEnum.bancoIntercap:
      //   return "630";
      // case BankEnum.bancoInvestcredUnibanco:
      //   return "249";
      // case BankEnum.bancoItauBBA:
      //   return "184";
      // case BankEnum.bancoItauBank:
      //   return "479";
      // case BankEnum.bancoItaucredFinanciamentos:
      //   return "M09";
      // case BankEnum.bancoJohnDeere:
      //   return "217";
      // case BankEnum.bancoLemon:
      //   return "065";
      // case BankEnum.bancoLusoBrasileiro:
      //   return "600";
      // case BankEnum.bancoModal:
      //   return "746";
      // case BankEnum.bancoNossaCaixa:
      //   return "151";
      // case BankEnum.bancoOpportunity:
      //   return "045";
      // case BankEnum.bancoPanamericano:
      //   return "623";
      // case BankEnum.bancoPaulista:
      //   return "611";
      // case BankEnum.bancoPine:
      //   return "643";
      // case BankEnum.bancoProsper:
      //   return "638";
      // case BankEnum.bancoRodobens:
      //   return "M16";
      // case BankEnum.bancoRuralMais:
      //   return "072";
      // case BankEnum.bancoSchahin:
      //   return "250";
      // case BankEnum.bancoSimples:
      //   return "749";
      // case BankEnum.bancoSofisa:
      //   return "637";
      // case BankEnum.bancoTopazio:
      //   return "082-5";
      // case BankEnum.bancoTriangulo:
      //   return "634";
      // case BankEnum.bancoUBSPactual:
      //   return "208";
      // case BankEnum.bancoVolkswagen:
      //   return "M14";
      // case BankEnum.bancoVotorantim:
      //   return "655";
      // case BankEnum.bancoVR:
      //   return "610";
      // case BankEnum.bancoBanestes:
      //   return "021";
      // case BankEnum.bancoBanif:
      //   return "719";
      // case BankEnum.bancoBPNBrasil:
      //   return "069";
      // case BankEnum.bancoBRBBancoBrasilia:
      //   return "070";
      // case BankEnum.bancoCitibank:
      //   return "477";
      // case BankEnum.bancoConcordia:
      //   return "081-7";
      // case BankEnum.bancoDeutscheBank:
      //   return "487";
      // case BankEnum.bancoHipercard:
      //   return "062";
      // case BankEnum.bancoINGBank:
      //   return "492";
      // case BankEnum.bancoJPMorganChase:
      //   return "488";
      case BankEnum.bancoUnibanco:
        return "409";
      case BankEnum.bancoUnicard:
        return "230";
      case BankEnum.bancoBrasil:
        return "001";
      case BankEnum.bancoSantander:
        return "033";
      case BankEnum.caixaEconomica:
        return "104";
      case BankEnum.bancoBradesco:
        return "237";
      case BankEnum.bancoItau:
        return "341";
      case BankEnum.bancoReal:
        return "356";
      case BankEnum.bancoMercantil:
        return "389";
      case BankEnum.hsbc:
        return "399";
      case BankEnum.bancoSafra:
        return "422";
      case BankEnum.bancoRural:
        return "453";
      case BankEnum.bancoRendimento:
        return "633";
      case BankEnum.itauUnibanco:
        return "652";
      // case BankEnum.bancoJPMSafra:
      //   return '488';
      // case BankEnum.bancoMerrillLynchInvestimentos:
      //   return '755';
      // case BankEnum.bancoRabobankInternationalBrasil:
      //   return '747';
      // case BankEnum.bancoSocieteGeneraleBrasil:
      //   return '366';
      // case BankEnum.bancoSumitomoMitsuiBrasileiro:
      //   return '464';
      // case BankEnum.bancoToyotaBrasil:
      //   return 'M20';
      // case BankEnum.bancoWestLBBrasil:
      //   return '370';
      // case BankEnum.bancoBBPopularBrasil:
      //   return '073';
      // case BankEnum.bancoBESInvestimentoBrasil:
      //   return '078';
      // case BankEnum.bancoDresdnerBankBrasil:
      //   return '751';
    }
  }
}
