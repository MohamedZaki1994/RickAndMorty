# RickAndMorty

The app is implemented on Xcode 16 with iOS 18 with swift 5. SPM has been used to add Kingfisher.

I used kingfisher for download images. also i limited the caching in memory as kingfisher will save the image in both memory and disk.

I made the first screen with UIKit except the TableCells. And Made the second screen fully by SwiftUI.

Also MVVM architecture has been used in the app.

Handled error if there is no connection.

Added unit test for the ViewModels of both the main screen and the second screen with mocking the repos and the network.

Filtration has been added on the main screen.
