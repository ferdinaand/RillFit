class OnboardingCarouselSkeleton {
  final String image;
  final String title;
  final String description;

  const OnboardingCarouselSkeleton({
    required this.title,
    required this.image,
    required this.description,
  });
}

final onboardingCarouselContent = <OnboardingCarouselSkeleton>[
  const OnboardingCarouselSkeleton(
    title: "Welcome to Riilfit",
    image: 'assets/png/splash_image.png',
    description:
        "Riilfit has workouts on demand that you can find based on how much time you have",
  ),
  const OnboardingCarouselSkeleton(
    title: "Workout Categories",
    image: 'assets/png/splash_image.png',
    description:
        "Workout categories will help you gain strength, get in better shape and embrace a healthy lifestyle",
  ),
  const OnboardingCarouselSkeleton(
    title: "Save time & money",
    image: 'assets/png/splash_image.png',
    description:
        "Find exclusive deals on popular products and get the items you love delivered or ready for pickup.",
  ),
];
