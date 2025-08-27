# Complete Blood Count Model/Metadata

```dart
class CbcTest {
  final double? hemoglobin; // g/dL
  final double? hematocrit; // %
  final double? redBloodCells; // million/µL
  final double? whiteBloodCells; // thousand/µL
  final double? platelets; // thousand/µL
  final double? meanCorpuscularVolume; // fL (MCV)
  final double? meanCorpuscularHemoglobin; // pg (MCH)
  final double? meanCorpuscularHemoglobinConcentration; // g/dL (MCHC)
  final double? redCellDistributionWidth; // %
  final double? neutrophils; // %
  final double? lymphocytes; // %
  final double? monocytes; // %
  final double? eosinophils; // %
  final double? basophils; // %

  CbcTest({
    this.hemoglobin,
    this.hematocrit,
    this.redBloodCells,
    this.whiteBloodCells,
    this.platelets,
    this.meanCorpuscularVolume,
    this.meanCorpuscularHemoglobin,
    this.meanCorpuscularHemoglobinConcentration,
    this.redCellDistributionWidth,
    this.neutrophils,
    this.lymphocytes,
    this.monocytes,
    this.eosinophils,
    this.basophils,
  });

  factory CbcTest.fromJson(Map<String, dynamic> json) {
    return CbcTest(
      hemoglobin: (json['hemoglobin'] as num?)?.toDouble(),
      hematocrit: (json['hematocrit'] as num?)?.toDouble(),
      redBloodCells: (json['redBloodCells'] as num?)?.toDouble(),
      whiteBloodCells: (json['whiteBloodCells'] as num?)?.toDouble(),
      platelets: (json['platelets'] as num?)?.toDouble(),
      meanCorpuscularVolume:
          (json['meanCorpuscularVolume'] as num?)?.toDouble(),
      meanCorpuscularHemoglobin:
          (json['meanCorpuscularHemoglobin'] as num?)?.toDouble(),
      meanCorpuscularHemoglobinConcentration:
          (json['meanCorpuscularHemoglobinConcentration'] as num?)?.toDouble(),
      redCellDistributionWidth:
          (json['redCellDistributionWidth'] as num?)?.toDouble(),
      neutrophils: (json['neutrophils'] as num?)?.toDouble(),
      lymphocytes: (json['lymphocytes'] as num?)?.toDouble(),
      monocytes: (json['monocytes'] as num?)?.toDouble(),
      eosinophils: (json['eosinophils'] as num?)?.toDouble(),
      basophils: (json['basophils'] as num?)?.toDouble(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'hemoglobin': hemoglobin,
      'hematocrit': hematocrit,
      'redBloodCells': redBloodCells,
      'whiteBloodCells': whiteBloodCells,
      'platelets': platelets,
      'meanCorpuscularVolume': meanCorpuscularVolume,
      'meanCorpuscularHemoglobin': meanCorpuscularHemoglobin,
      'meanCorpuscularHemoglobinConcentration':
          meanCorpuscularHemoglobinConcentration,
      'redCellDistributionWidth': redCellDistributionWidth,
      'neutrophils': neutrophils,
      'lymphocytes': lymphocytes,
      'monocytes': monocytes,
      'eosinophils': eosinophils,
      'basophils': basophils,
    };
  }
}
```
