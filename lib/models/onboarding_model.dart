class OnboardingModel {
  final String image;
  final String text;
  final String subtitle;

  OnboardingModel({
    required this.image,
    required this.text,
    required this.subtitle,
  });
}

List<OnboardingModel> onboardingData = [
  OnboardingModel(
    image: "assets/onboardingimgs/onboardingImg1.png",
    text: 'Maintaining the quality of residences and vehicles',
    subtitle: '',
  ),
  OnboardingModel(
    image: 'assets/onboardingimgs/onboardingImg2.png',
    text: 'Professional vehicle maintenance',
    subtitle: 'Comfortable interiors to shiny exteriors - we do both',
  ),
  OnboardingModel(
    image: 'assets/onboardingimgs/onboardingImg3.png',
    text: 'Efficient apartment maintenance system',
    subtitle: 'We protect our community by high-security systems from Google',
  ),
];
