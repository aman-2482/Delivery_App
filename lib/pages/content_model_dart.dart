class UnboardingContent{
  String image;
  String title ;
  String description;
  UnboardingContent({required this.description, required this.title , required this.image});

}
List<UnboardingContent> contents = [
  UnboardingContent(description: "Pick your Food", title: 'Select from our\n    Best Menu', image: "images/screen1.png"),
  UnboardingContent(description: 'Both  Card and COD Payment is available', title: 'Easy Payment \n       Options', image: "images/screen2.png"),
  UnboardingContent(description: 'Deliver your food at your\n  Doorstep ', title: '     Quick Drops,\n    Happy Stops!', image: "images/screen3.png")

];