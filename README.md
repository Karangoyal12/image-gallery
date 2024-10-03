# Image Gallery Flutter App

A Flutter application that displays a gallery of images loaded from the [Pixabay API](https://pixabay.com/api/docs/). The images are shown in a square grid, where the number of columns dynamically adjusts based on the screen width. Additional features include displaying the number of likes and views for each image and loading new images as the user scrolls downwards (infinite scrolling). The web version of the app is deployed on GitHub Pages.

## Features

- **Dynamic Grid Layout**: The number of columns in the grid adjusts automatically based on the screen width.
- **Image Data from Pixabay**: Images are fetched using the Pixabay API, displaying the number of likes and views under each image.
- **Infinite Scrolling**: Automatically loads more images as the user scrolls to the bottom of the page.
- **Mobile, Desktop, and Web Compatibility**: Built using Flutter for cross-platform deployment, including a web version hosted on GitHub Pages.

## Demo

The web version of the application is available at [GitHub Pages link].

## Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- A Pixabay API key (You can obtain one by signing up at the [Pixabay website](https://pixabay.com/api/docs/)).

### Installation

1. Clone the repository:

    ```bash
    git clone https://github.com/yourusername/image-gallery-app.git
    ```

2. Navigate to the project directory:

    ```bash
    cd image-gallery-app
    ```

3. Install the required dependencies:

    ```bash
    flutter pub get
    ```

4. Create a `.env` file in the root directory and add your Pixabay API key:

    ```env
    PIXABAY_API_KEY=your_api_key_here
    ```

### Running the Application

1. To run the app on a local device or emulator, use:

    ```bash
    flutter run
    ```

2. To build the web version and deploy it to GitHub Pages:

    ```bash
    flutter build web
    ```

3. Deploy the web version to GitHub Pages:

    You can follow this guide to deploy the web version to GitHub Pages:
    [Flutter Web Deploy on GitHub Pages](https://flutter.dev/docs/deployment/web#building-and-deploying-to-github-pages).

### API Configuration

The app uses the Pixabay API to fetch images. Make sure to replace the placeholder `your_api_key_here` in the `.env` file with your actual Pixabay API key.

```dart
const String pixabayApiKey = String.fromEnvironment('PIXABAY_API_KEY');
```

### Technologies Used
  - Flutter: For building the mobile, desktop, and web application.
  - Pixabay API: For fetching image data.
  - GitHub Pages: For hosting the web version.

