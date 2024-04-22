class LevelModel {
  final int number;
  final int digitsCount;
  final String levelImage;
  final String doneImage;
  final String disableImage;
  bool isDone;
  bool isAvailable;


  LevelModel(
      {required this.digitsCount,
        required this.number,
        required this.isDone,
        required this.isAvailable,
        required this.levelImage,
        required this.doneImage,
        required this.disableImage,
        });
}