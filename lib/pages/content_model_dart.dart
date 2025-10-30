class ContentModel {
  final String image;
  final String title;
  final String description;

  ContentModel({required this.image, required this.title, required this.description});
}

List<ContentModel> contents = [
  ContentModel(image: 'images/onboard1.png', title: 'Welcome', description: 'Welcome to the app'),
  ContentModel(image: 'images/onboard2.png', title: 'Discover', description: 'Discover great food'),
  ContentModel(image: 'images/onboard3.png', title: 'Fast', description: 'Fast delivery'),
];
