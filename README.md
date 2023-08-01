<!DOCTYPE html>
<html>

<head>
  <meta charset="UTF-8">
  <title>Websocket App</title>
</head>

<body>
  <h1>Websocket App</h1>
  <p>Websocket App is a dynamic mobile application that leverages WebSockets to establish real-time connections with a server and display live data on a map. The app utilizes FlutterMap for mapping functionalities and Bloc for efficient state management. Additionally, Get_it is used for dependency injection, ensuring a smooth and maintainable development process.</p>

  <h2>Features</h2>
  <ul>
    <li><strong>Real-time Data Display:</strong> Websocket App establishes a WebSocket connection with the server to receive real-time data, which is then dynamically displayed on the map.</li>
    <li><strong>Map Integration:</strong> The app integrates FlutterMap to provide users with an interactive and seamless map experience.</li>
    <li><strong>Efficient State Management:</strong> Bloc is employed for state management, ensuring a clear separation of concerns and efficient data flow throughout the app.</li>
  </ul>

  <h2>Used Libraries</h2>
  <pre>
flutter_lints: ^2.0.0
web_socket_channel: ^2.4.0
bloc: ^8.1.2
flutter_bloc: ^8.1.3
equatable: ^2.0.5
flutter_map: ^5.0.0
get_it: ^7.2.0
  </pre>

  <h2>WebSocket Integration</h2>
  <p>Websocket App requires access to the internet to establish a WebSocket connection with the server and receive real-time data. The app efficiently handles incoming data and updates the map accordingly, providing users with a dynamic experience.</p>

  <h2>Getting Started</h2>
  <ol>
    <li>Make sure you have Flutter installed on your system.</li>
    <li>Clone this repository to your local machine.</li>
    <li>Install the required packages using the following command:</li>
  </ol>
  <pre>
flutter pub get
  </pre>
  <ol start="4">
    <li>Run the app on your device or emulator:</li>
  </ol>
  <pre>
flutter run
  </pre>

  <h2>Permissions</h2>
  <p>Websocket App requires access to the internet to establish the WebSocket connection and receive real-time data. The app does not request any other sensitive permissions to ensure user privacy and security.</p>

  <h2>How to Contribute</h2>
  <ol>
    <li>Fork the repository on GitHub.</li>
    <li>Create a new branch with a descriptive name:</li>
  </ol>
  <pre>
git checkout -b feature/your-feature-name
  </pre>
  <ol start="3">
    <li>Make your changes and commit them:</li>
  </ol>
  <pre>
git commit -m "Add your commit message here"
  </pre>
  <ol start="4">
    <li>Push your changes to your forked repository:</li>
  </ol>
  <pre>
git push origin feature/your-feature-name
  </pre>
  <ol start="5">
    <li>Create a pull request from your branch to the main repository.</li>
    <li>Await feedback from maintainers and participate in any discussions related to your pull request.</li>
  </ol>

  <h2>Credits</h2>
  <p>Websocket App is built with the contributions of the Flutter community and various open-source projects. Please see the LICENSE file for licensing information.</p>
</body>

</html>
