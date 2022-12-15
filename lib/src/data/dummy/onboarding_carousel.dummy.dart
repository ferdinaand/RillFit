import 'package:riilfit/src/presentation/resources/res.dart';

class OnboardingCarouselSkeleton {
  const OnboardingCarouselSkeleton({
    required this.title,
    required this.image,
    required this.description,
  });

  final String image;
  final String title;
  final String description;
}

final onboardingCarouselContent = <OnboardingCarouselSkeleton>[
  const OnboardingCarouselSkeleton(
    title: 'Welcome to Riilfit',
    image: imagePlaceholder,
    description:
        'Riilfit has workouts on demand that you can find based on how much time you have',
  ),
  const OnboardingCarouselSkeleton(
    title: 'Workout Categories',
    image: imagePlaceholder,
    description:
        'Workout categories will help you gain strength, get in better shape and embrace a healthy lifestyle',
  ),
  const OnboardingCarouselSkeleton(
    title: 'Save time & money',
    image: imagePlaceholder,
    description:
        'Find exclusive deals on popular products and get the items you love delivered or ready for pickup.',
  ),
];
