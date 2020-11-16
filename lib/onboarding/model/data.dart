class SliderModel {
  String imgPath;
  String title;
  String description;

  SliderModel({this.description, this.imgPath, this.title});

  //setter
  void setImagePath(String getImgPath) {
    imgPath = getImgPath;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDescription(String getDescription) {
    description = getDescription;
  }

  // getters
  String get getImgPath => imgPath;
  String get getTitle => title;
  String get getDescription => description;
}

// ignore: missing_return
List<SliderModel> getSlides() {
  List<SliderModel> slides = new List<SliderModel>();
  SliderModel sliderModel = new SliderModel();

  /// First Onboard info

  sliderModel
      .setImagePath("assets/1.jpg");
  sliderModel.setTitle("search");
  sliderModel.setDescription("Documentation or n from beginning to end.");
  slides.add(sliderModel);

  // Second Onboard info
   sliderModel = new SliderModel();

  sliderModel
      .setImagePath("assets/2.jpg");
  sliderModel.setTitle("search");
  sliderModel.setDescription("Laravel News is a community driven  new packages");
  slides.add(sliderModel);

  // Third Onboard info
  sliderModel = new SliderModel();

  sliderModel
      .setImagePath("assets/3.jpg");
  sliderModel.setTitle("search");
  sliderModel.setDescription("latest and most important news the Laravel ecosystem");
  slides.add(sliderModel);

  sliderModel = new SliderModel();

  sliderModel
      .setImagePath("assets/19.jpg");
  sliderModel.setTitle("search");
  sliderModel.setDescription("Laravel News is a community driven portal and newsletter aggregating");
  slides.add(sliderModel);


  return slides;
}
