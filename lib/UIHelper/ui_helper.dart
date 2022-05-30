class UIHelper {
  UIHelper._();

  static String currencyType(String currency) {
    if (currency == "Turkish Lira") {
      return " TL";
    } else if (currency == "USD") {
      return " \$";
    } else {
      return " TL";
    }
  }

  static final Map<String, String> _goldShortToLong = {
    "GA": "Gram\nAltın",
    "C": "Çeyrek\nAltın",
    "Y": "Yarım\nAltın",
    "T": "Tam Altın",
    "14": "14 Ayar\nAltın",
    "18": "18 Ayar\nAltın",
    "22": "22 Ayar\nAltın",
    "CMR": "Cumhuriyet\nAltını",
    "XAU/USD": "ONS Altın",
    "ATA": "Ata Altın",
    "GR": "Gremse\nAltın",
    "CE": "CE",
    "YE": "YE",
    "TE": "TE",
    "GRE": "GRE",
    "GAG": "Gümüş",
    "BSL": "Beşli\nAltın",
    "IKB": "İkibuçuk\nAltın",
    "HA": "Hamit\nAltın",
    "XAUEUR": "ONS Altın\nEUR",
    "XAU/XAG": "XAU/XAG"
  };

  static String getStringFromString(String type) {
    if (_goldShortToLong.containsKey(type)) {
      return _goldShortToLong[type] ?? "Error";
    } else {
      return "Error2";
    }
  }

  static final Map<String, String> _currencyShortToLong = {
    "USD": "Dolar",
    "EUR": "Euro",
    "GBP": "Sterlin",
    "CHF": "İsviçre Frangı",
    "CAD": "Kanada Doları",
    "RUB": "Ruble",
    "AED": "Dubai Dirhemi",
    "AUD": "Avustralya Doları",
    "DKK": "Danimarka Kronu",
    "SEK": "İsveç Kronu",
    "NOK": "Norveç Kronu",
    "JPY": "Japon Yeni",
    "KWD": "Kuveyt Dinarı",
    "ZAR": "Güney Afrika Randı",
    "OMR": "Umman Riyali",
    "MYR": "Malezya Ringiti",
    "PHP": "Filipin Pezosu",
    "QAR": "Katar Riyali",
    "SYP": "Suriye Lirası",
    "RSD": "Sırp Dinarı",
    "UAH": "Grivna",
    "TWD": "Tayvan Doları",
    "MDL": "Moldova Leyi",
    "PEN": "Peru Nuevo Solu",
    "SGD": "Singapur Doları",
    "MKD": "Makedonya Dinarı",
    "UYU": "Uruguay Pesosu",
    "PKR": "Pakistan Rupisi",
    "THB": "Tayland Bahtı",
    "SAR": "Riyal",
    "ILS": "İsrail Şekeli",
    "BHD": "Bahreyn Dinarı",
    "MXN": "Meksika Pezosu",
    "NZD": "Yeni Zelanda Doları",
    "IRR": "İran Riyali",
    "CSK": "Çek Korunası",
    "BGN": "Bulgar Levası",
    "ARS": "Arjantin Pezosu",
    "BRL": "Brezilya Reali",
    "AZN": "Manat",
    "CLP": "Şili Pezosu",
    "RON": "Romen Leyi",
    "CRC": "Kosta Rika Kolonu",
    "HKD": "Hong Kong Doları",
    "BAM": "Bosna-Hersek Markı",
    "ISK": "İzlanda Kronu",
    "KZT": "Tenge",
    "LKR": "Sri Lanka Rupisi",
    "DZD": "Cezayir Dinarı",
    "MAD": "Fas Dirhemi",
    "JOD": "Ürdün Dinarı",
    "LTL": "Litvanya Litası",
    "LYD": "Libya Dinarı",
    "INR": "Hindistan Rupisi",
    "IDR": "Endonezya Rupiahi",
    "IQD": "Irak Dinarı",
    "CNY": "Çin Yuanı",
    "HUF": "Macar Forinti",
    "BYR": "Belarus Rublesi",
    "PLN": "Polonya Zlotisi",
    "EGP": "Mısır Lirası",
    "ALL": "Arnavutluk Leki",
    "KRW": "Güney Kore Wonu",
    "COP": "Kolombiya Pesosu",
    "LVL": "Letonya Latsı",
    "HRK": "Hırvat Kunası",
    "LBP": "Lübnan Lirası",
    "GEL": "Gürcistan Larisi",
    "DVZSP1": "DVZSP1",
    "TND": "Tunus Dinarı",
  };

  static String getStringFromStringCurrency(String type) {
    if (_currencyShortToLong.containsKey(type)) {
      return _currencyShortToLong[type] ?? "Error";
    } else {
      return "Error2";
    }
  }
}
