class UIHelper {
  UIHelper._();

  static String updateText = "";

  static String updateDate(value) {
    if (value == "") {
      return "Altın / Döviz Kurları";
    } else {
      return "Güncellenme Zamanı: " + value;
    }
  }

  static String currencyType(String currency) {
    if (currency == "Turkish Lira") {
      return " TL";
    } else if (currency == "USD") {
      return " \$";
    } else {
      return " TL";
    }
  }

  static final Map<String, String> _correctGoldString = {
    "gram-altin": "Gram Altın",
    "22-ayar-bilezik": "22 Ayar Bilezik",
    "ceyrek-altin": "Çeyrek Altın",
    "yarim-altin": "Yarım Altın",
    "tam-altin": "Tam Altın",
    "14-ayar-altin": "14 Ayar Altın",
    "18-ayar-altin": "18 Ayar Altın",
    "22 Ayar\nAltın": "22 Ayar Altın",
    "cumhuriyet-altini": "Cumhuriyet Altını",
    "ata-altin": "Ata Altın",
    "resat-altin": "Reşat Altın",
    "gremse-altin": "Gremse Altın",
    "gumus": "Gümüş",
    "besli-altin": "Beşli Altın",
    "ikibucuk-altin": "2,5 Altın",
    "hamit-altin": "Hamit Altın",
  };

  static String correctGoldString(String type) {
    if (_correctGoldString.containsKey(type)) {
      return _correctGoldString[type] ?? "Error";
    } else {
      return "Error2";
    }
  }

  static final Map<String, String> _goldLongtoShort = {
    " TL": "TL",
    "gram-altin": "GA",
    "22-ayar-bilezik": "22 ABil",
    "ceyrek-altin": "C",
    "yarim-altin": "Y",
    "tam-altin": "T",
    "14-ayar-altin": "14 A",
    "18-ayar-altin": "18 A",
    "22 Ayar\nAltın": "22 A",
    "cumhuriyet-altini": "CMR",
    "ata-altin": "ATA",
    "resat-altin": "RST",
    "gremse-altin": "GR",
    "gumus": "GAG",
    "besli-altin": "BSL",
    "ikibucuk-altin": "2,5 A",
    "hamit-altin": "HA",
  };

  static String goldLongtoShort(String type) {
    if (_goldLongtoShort.containsKey(type)) {
      return _goldLongtoShort[type] ?? "Error";
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
     "gram-altin": "Gram Altın",
    "22-ayar-bilezik": "22 Ayar Bilezik",
    "ceyrek-altin": "Çeyrek Altın",
    "yarim-altin": "Yarım Altın",
    "tam-altin": "Tam Altın",
    "14-ayar-altin": "14 Ayar Altın",
    "18-ayar-altin": "18 Ayar Altın",
    "22 Ayar\nAltın": "22 Ayar Altın",
    "cumhuriyet-altini": "Cumhuriyet Altını",
    "ata-altin": "Ata Altın",
    "resat-altin": "Reşat Altın",
    "gremse-altin": "Gremse Altın",
    "gumus": "Gümüş",
    "besli-altin": "Beşli Altın",
    "ikibucuk-altin": "2,5 Altın",
    "hamit-altin": "Hamit Altın",
  };

  static String getStringFromStringCurrency(String type) {
    if (_currencyShortToLong.containsKey(type)) {
      return _currencyShortToLong[type] ?? "Error";
    } else {
      return type;
    }
  }

  static final Map<String, String> _currencyLongToShort = {
    "Dolar": "\$",
    "Euro": "€",
    "Sterlin": "£",
    "İsviçre Frangı": "CHF",
    "Kanada Doları": "CAD",
    "Ruble": "RUB",
    "Dubai Dirhemi": "AED",
    "Avustralya Doları": "AUD",
    "Danimarka Kronu": "DKK",
    "İsveç Kronu": "SEK",
    "Norveç Kronu": "NOK",
    "Japon Yeni": "JPY",
    "Kuveyt Dinarı": "KWD",
    "Güney Afrika Randı": "ZAR",
    "Umman Riyali": "OMR",
    "Malezya Ringiti": "MYR",
    "Filipin Pezosu": "PHP",
    "Katar Riyali": "QAR",
    "Suriye Lirası": "SYP",
    "Sırp Dinarı": "RSD",
    "Grivna": "UAH",
    "Tayvan Doları": "TWD",
    "Moldova Leyi": "MDL",
    "Peru Nuevo Solu": "PEN",
    "Singapur Doları": "SGD",
    "Makedonya Dinarı": "MKD",
    "Uruguay Pesosu": "UYU",
    "Pakistan Rupisi": "PKR",
    "Tayland Bahtı": "THB",
    "Riyal": "SAR",
    "İsrail Şekeli": "ILS",
    "Bahreyn Dinarı": "BHD",
    "Meksika Pezosu": "MXN",
    "Yeni Zelanda Doları": "NZD",
    "İran Riyali": "IRR",
    "Çek Korunası": "CSK",
    "Bulgar Levası": "BGN",
    "Arjantin Pezosu": "ARS",
    "Brezilya Reali": "BRL",
    "Manat": "AZN",
    "Şili Pezosu": "CLP",
    "Romen Leyi": "RON",
    "Kosta Rika Kolonu": "CRC",
    "Hong Kong Doları": "HKD",
    "Bosna-Hersek Markı": "BAM",
    "İzlanda Kronu": "ISK",
    "Tenge": "KZT",
    "Sri Lanka Rupisi": "LKR",
    "Cezayir Dinarı": "DZD",
    "Fas Dirhemi": "MAD",
    "Ürdün Dinarı": "JOD",
    "Litvanya Litası": "LTL",
    "Libya Dinarı": "LYD",
    "Hindistan Rupisi": "INR",
    "Endonezya Rupiahi": "IDR",
    "Irak Dinarı": "IQD",
    "Çin Yuanı": "CNY",
    "Macar Forinti": "HUF",
    "Belarus Rublesi": "BYR",
    "Polonya Zlotisi": "PLN",
    "Mısır Lirası": "EGP",
    "Arnavutluk Leki": "ALL",
    "Güney Kore Wonu": "KRW",
    "Kolombiya Pesosu": "COP",
    "Letonya Latsı": "LVL",
    "Hırvat Kunası": "HRK",
    "Lübnan Lirası": "LBP",
    "Gürcistan Larisi": "GEL",
    "DVZSP1": "DVZSP1",
    "Tunus Dinarı": "TND"
  };

  static String getStringFromStringCurrencyToShort(String type) {
    if (_currencyLongToShort.containsKey(type)) {
      return _currencyLongToShort[type] ?? "Error";
    } else {
      return "Error2";
    }
  }
}
