import 'package:equatable/equatable.dart';

class Author extends Equatable {
  final String name;
  final String? username;
  final String? twitterUsername;
  final String? githubUsername;
  final String? profileImage;
  final String? profileImage90;

  const Author({
    required this.name,
    this.username,
    this.twitterUsername,
    this.githubUsername,
    this.profileImage,
    this.profileImage90,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      name: json['name'],
      username: json['username'],
      twitterUsername: json['twitter_username'],
      githubUsername: json['github_username'],
      profileImage: json['profile_image'],
      profileImage90: json['profile_image_90'],
    );
  }

  @override
  List<Object?> get props => [
        name,
        username,
        twitterUsername,
        githubUsername,
        profileImage,
        profileImage90,
      ];
}
