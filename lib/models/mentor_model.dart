// Data model for a mentor.
// This class encapsulates all the information related to a mentor.
// It no longer contains any icon data or helper functions for icons.
class Mentor {
  final String id;
  final String name;
  final String imageUrl; // Placeholder for network image or local asset path
  final double rating;
  final String sector;
  final String experience; // e.g., "4 years"
  final String role; // e.g., "Business Administration"
  final int reviews;
  final String description;
  final int compatibility; // Percentage e.g., 98

  Mentor({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.rating,
    required this.sector,
    required this.experience,
    required this.role,
    required this.reviews,
    required this.description,
    required this.compatibility,
  });
}
