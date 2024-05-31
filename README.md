![MasterHeader](https://zphhqkbfmmilwzqcmdgu.supabase.co/storage/v1/object/public/profile/musicapp_banner.webp)

# MusicApp

Welcome to the MusicApp Repository, a mobile app designed to give users easy access to their favorite music. This project showcases my experience in developing mobile applications using Flutter and demonstrates advanced techniques in managing data from an API using clean architecture principles and state management with Flutter Bloc.

## Features

- **Favorites Section**: Save your favorite tracks for easy access.
- **Search Functionality**: Find songs, albums, and artists quickly.
- **Music Downloads**: Download your favorite tracks to listen offline.
- **Offline Listening**: Enjoy your downloaded music without an internet connection.
- **Artist Profiles**: View detailed information and songs from your favorite artists.

## Technology Used
- **Flutter**: For creating high-quality cross-platform mobile applications.
- **API**: This app uses the Deezer API to fetch music data, including tracks, albums, and artist profiles.
- **Dart**: The programming language used alongside Flutter.

## Project Structure
- **Onboarding Page**: Displays the loading or welcome screen.
- **Home Page**: Shows a list of featured songs and artists.
- **Search Page**: Allows users to search for songs, albums, and artists.
- **Favorites Page**: Displays the user's saved tracks.
- **Artist Details Page**: Shows detailed information about an artist and their songs.

### Previous requirements
You will need the following tools installed on your machine:
- Flutter 3.19.3
- Dart 3.3.1
- An IDE (VSCode, Android Studio or IntelliJ)

### Facility
Clone the repository:
```play
git clone https://github.com/lucadevv/music_app
cd rickandmortyapp
```
Install dependencies:
```play
pub flutter get
```

## Architecture
This project adheres to clean architecture guidelines, which are structured as follows:
- **Data layer**: Manages data transactions and transformations to and from the database.
- **Domain layer**: Contains entities and business logic.
- **Presentation layer**: comprises state management and UI components handled by Flutter Bloc.

## Contributions
Feel free to contribute to this project! Fork the repository and submit pull requests with the proposed changes. This project is for educational use.
