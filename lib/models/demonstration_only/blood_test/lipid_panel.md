# Lipid Panel Model/Metadata

```dart
class LipidPanel {
  final double? totalCholesterol; // mg/dL
  final double? hdlCholesterol; // mg/dL
  final double? ldlCholesterol; // mg/dL
  final double? triglycerides; // mg/dL
  final double? vldlCholesterol; // mg/dL

  LipidPanel({
    this.totalCholesterol,
    this.hdlCholesterol,
    this.ldlCholesterol,
    this.triglycerides,
    this.vldlCholesterol,
  });

  factory LipidPanel.fromJson(Map<String, dynamic> json) {
    return LipidPanel(
      totalCholesterol: (json['totalCholesterol'] as num?)?.toDouble(),
      hdlCholesterol: (json['hdlCholesterol'] as num?)?.toDouble(),
      ldlCholesterol: (json['ldlCholesterol'] as num?)?.toDouble(),
      triglycerides: (json['triglycerides'] as num?)?.toDouble(),
      vldlCholesterol: (json['vldlCholesterol'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalCholesterol': totalCholesterol,
      'hdlCholesterol': hdlCholesterol,
      'ldlCholesterol': ldlCholesterol,
      'triglycerides': triglycerides,
      'vldlCholesterol': vldlCholesterol,
    };
  }
}

class BasicMetabolicPanel {
  final double? sodium; // mmol/L
  final double? potassium; // mmol/L
  final double? chloride; // mmol/L
  final double? bicarbonate; // mmol/L
  final double? bun; // mg/dL (Blood Urea Nitrogen)
  final double? creatinine; // mg/dL
  final double? glucose; // mg/dL
  final double? calcium; // mg/dL

  BasicMetabolicPanel({
    this.sodium,
    this.potassium,
    this.chloride,
    this.bicarbonate,
    this.bun,
    this.creatinine,
    this.glucose,
    this.calcium,
  });

  factory BasicMetabolicPanel.fromJson(Map<String, dynamic> json) {
    return BasicMetabolicPanel(
      sodium: (json['sodium'] as num?)?.toDouble(),
      potassium: (json['potassium'] as num?)?.toDouble(),
      chloride: (json['chloride'] as num?)?.toDouble(),
      bicarbonate: (json['bicarbonate'] as num?)?.toDouble(),
      bun: (json['bun'] as num?)?.toDouble(),
      creatinine: (json['creatinine'] as num?)?.toDouble(),
      glucose: (json['glucose'] as num?)?.toDouble(),
      calcium: (json['calcium'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'sodium': sodium,
      'potassium': potassium,
      'chloride': chloride,
      'bicarbonate': bicarbonate,
      'bun': bun,
      'creatinine': creatinine,
      'glucose': glucose,
      'calcium': calcium,
    };
  }
}

```
