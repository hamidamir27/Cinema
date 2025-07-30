# GoodFlix Cinema App

A SwiftUI-based iOS cinema booking application that allows users to browse movies, select seats, and book tickets.

## Features

- **Cinema Selection**: Choose from multiple cinema locations
- **Movie Browsing**: Browse available movies with posters and descriptions
- **Seat Selection**: Interactive seat selection with visual feedback
- **Ticket Booking**: Complete booking flow with ticket generation
- **Ticket Management**: View booked tickets

## Architecture

The app follows the Model-View-Controller (MVC) pattern with SwiftUI views:

### Models
- **Movie** (`Cinema/Model/Movie.swift:11`): Represents a movie with image, title, showtimes, and seats
- **Cinema** (`Cinema/Model/Cinema.swift:10`): Represents a cinema location with its movies
- **Seat** (`Cinema/Model/Seat.swift:10`): Represents individual seats with occupancy status
- **Ticket** (`Cinema/Model/Ticket.swift:10`): Represents a booked ticket with movie, seat, and cinema info
- **User** (`Cinema/Model/User.swift`): User data model

### Views
- **CinemaView** (`Cinema/View/CinemaView.swift:10`): Main cinema selection screen
- **MovieView** (`Cinema/View/MovieView.swift`): Movie browsing and selection
- **SeatSelectionView** (`Cinema/View/SeatSelectionView.swift`): Interactive seat selection
- **BookingView** (`Cinema/View/BookingView.swift`): Booking confirmation
- **TicketView** (`Cinema/View/TicketView.swift`): Ticket display and management

### Controllers
- **CinemaViewController** (`Cinema/Controller/CinemaViewController.swift`): Manages cinema data
- **MovieViewController** (`Cinema/Controller/MovieViewController.swift`): Handles movie operations
- **SeatSelectionViewController** (`Cinema/Controller/SeatSelectionViewController.swift`): Manages seat selection logic
- **BookingViewController** (`Cinema/Controller/BookingViewController.swift`): Handles booking process
- **TicketViewController** (`Cinema/Controller/TicketViewController.swift`): Manages ticket data

### UI Components
- **ChairView** (`Cinema/View/UIComponents/ChairView.swift`): Individual seat visualization
- **TicketCard** (`Cinema/View/UIComponents/TicketCard.swift`): Ticket display component
- **SearchBar** (`Cinema/View/UIComponents/SearchBar.swift`): Search functionality
- **ScrollSection** (`Cinema/View/UIComponents/ScrollSection.swift`): Movie scrolling section

## Getting Started

### Prerequisites
- Xcode 15.0 or later
- iOS 17.0 or later
- Swift 5.9 or later

### Installation
1. Clone the repository
2. Open `Cinema.xcodeproj` in Xcode
3. Build and run the project

### Project Structure
```
Cinema/
├── CinemaApp.swift          # App entry point
├── Model/                   # Data models
├── View/                    # SwiftUI views
├── Controller/              # View controllers
├── Assets.xcassets/         # Movie posters and assets
└── Preview Content/         # SwiftUI previews
```

## Movies Available

The app includes several pre-loaded movies:
- Kung Fu Panda 4
- Godzilla
- Captain America: Civil War
- Abigail
- Amy (Amy Winehouse documentary)
- Monkey Man
- The Roundup
- Ghostbusters

## Testing

The project includes:
- Unit tests in `CinemaTests/`
- UI tests in `CinemaUITests/`

Run tests using Xcode's test navigator or:
```bash
xcodebuild test -scheme Cinema
```

## Author

Created by Felix Lush (April 2024)

## License

This project is for educational purposes as part of iOS Application Development coursework.