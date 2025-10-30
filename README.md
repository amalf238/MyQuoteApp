# MyQuote

A Ruby on Rails application for managing and organizing philosophical quotes. MyQuote allows users to collect, categorize, and explore quotes from various philosophers with user authentication and role-based access.

---

## Description

MyQuote is a comprehensive quote management system built with Ruby on Rails 7. The application provides a platform for users to contribute quotes, attribute them to philosophers, organize them by categories, and search through the collection. With user authentication and different access levels, MyQuote offers both public browsing and personalized quote collections.

---

## Features

- **User Authentication**: Secure login/logout functionality with bcrypt password encryption
- **Role-Based Access**: Different interfaces for administrators and standard users
- **Quote Management**: Full CRUD operations for quotes
  - Add new quotes with philosopher attribution
  - Edit and delete your own quotes
  - View all quotes or just your contributions
- **Philosopher Management**: Create and manage philosopher profiles
- **Category System**: Organize quotes with multiple categories
- **Search Functionality**: Search through quotes, philosophers, and categories
- **Personalized Dashboard**: Users can view their own quote collections
- **Admin Interface**: Administrative panel for managing all content
- **Responsive Design**: Built with modern Rails frontend technologies (Hotwire, Turbo, Stimulus)

---

## Technology Stack

- **Ruby**: 3.2.2
- **Rails**: 7.0.8.1
- **Database**: SQLite3
- **Authentication**: BCrypt
- **Frontend**:
  - Hotwire (Turbo Rails & Stimulus)
  - Import maps for JavaScript
  - Sprockets for asset pipeline
- **Web Server**: Puma
- **Testing**: Capybara, Selenium WebDriver

---

## Getting Started
### Prerequisites

You only need **Docker** and **Docker Compose** installed on your machine to run this application.

- **Docker Desktop** (Windows/Mac): [Download here](https://www.docker.com/products/docker-desktop)
- **Docker Engine** (Linux): [Install guide](https://docs.docker.com/engine/install/)

---

### User Account Info
The account info has been shared below to access the demo application.

- **ADMIN USER** (John Jones) Login Info: [ Email: admin@myquotes.com | Password: admin123 ]
- Standard User1 (Vincent Brown) Login Info: [ Email: vinceb@myemail.com | Password: vince123 ]
- Standard User2 (Amal Fernando) Login Info: [ Email: amal@gmail.com | Password: abc123 ]
- Standard User3 (Sansannah Aaron) Login Info: [ Email: sunny@gmail.com | Password: abc123 ]

---

### Installation & Running with Docker

#### 1. Clone the repository

```bash
git clone <repository-url>
cd MyQuote
```

#### 2. Build and start the application

```bash
docker-compose up --build
```

This command will:
- Build the Docker image with Ruby 3.2.2 and all dependencies
- Create the SQLite database
- Run migrations
- Seed the database with initial data
- Start the Rails server

#### 3. Access the application

Once you see `Listening on http://0.0.0.0:3000` in the terminal, open your browser and navigate to:

```
http://localhost:3000
```

#### 4. Stop the application

Press `Ctrl+C` in the terminal, then run:

```bash
docker-compose down
```

---

## Docker Commands

### Run in Background (Detached Mode)

```bash
docker-compose up -d
```

### View Logs

```bash
docker-compose logs -f
```

### Stop the Application

```bash
docker-compose down
```

### Rebuild After Code Changes

```bash
docker-compose up --build
```

### Access Rails Console

```bash
docker-compose exec web rails console
```

### Run Database Migrations

```bash
docker-compose exec web rails db:migrate
```

### Seed Database

```bash
docker-compose exec web rails db:seed
```

### Reset Database (Fresh Start)

```bash
docker-compose exec web rails db:drop db:create db:migrate db:seed
```

### Run Tests

```bash
docker-compose exec web rails test
```

---

## Application Routes

### Main Routes

| Route | Path | Description |
|-------|------|-------------|
| Home | `/` | Landing page |
| About | `/about` | Information about the application |
| Search | `/search` | Search quotes, philosophers, and categories |
| Login | `/login` | User login |
| Logout | `/logout` | User logout |
| Admin Dashboard | `/admin` | Administrative interface |
| User Dashboard | `/userhome` | User personal dashboard |
| Your Quotes | `/your-quotes` | View your contributed quotes |

### Resource Routes

| Resource | Path | Description |
|----------|------|-------------|
| Quotes | `/quotes` | Browse and manage quotes |
| Philosophers | `/philosophers` | Browse and manage philosophers |
| Categories | `/categories` | Browse and manage categories |
| Users | `/users` | User registration and management |

---

## Development Notes

- The application code is mounted as a volume, so changes to the code are reflected immediately
- The database files persist in the local `db/` directory between container restarts
- Logs are stored in the local `log/` directory
- For Gemfile changes, rebuild the container: `docker-compose up --build`
- For database schema changes, run migrations: `docker-compose exec web rails db:migrate`

---

## Troubleshooting

### Port 3000 Already in Use

If port 3000 is already in use, modify `docker-compose.yml`:

```yaml
ports:
  - "3001:3000"  # Use port 3001 instead
```

Then access the app at `http://localhost:3001`

### Database Issues

For a fresh database start:

```bash
docker-compose down -v  # Remove volumes
docker-compose up --build
```

### Permission Issues (Linux/Mac)

If you encounter permission issues:

```bash
sudo chown -R $USER:$USER .
```

---

## Project Structure

```
MyQuote/
├── app/
│   ├── controllers/      # Application controllers
│   ├── models/          # Data models (Quote, Philosopher, Category, User)
│   ├── views/           # View templates
│   ├── helpers/         # View helpers
│   └── javascript/      # JavaScript files (Stimulus controllers)
├── config/              # Application configuration
├── db/                  # Database files and migrations
├── test/                # Test files
├── Dockerfile           # Docker configuration
├── docker-compose.yml   # Docker Compose configuration
└── Gemfile             # Ruby dependencies
```

---

## Models

| Model | Description |
|-------|-------------|
| **User** | Application users with authentication |
| **Quote** | Quotes with content and attribution |
| **Philosopher** | Philosopher profiles |
| **Category** | Quote categories |
| **QuoteCategory** | Join table for many-to-many relationship between quotes and categories |

---

## Contributing

1. Fork the repository
2. Create your feature branch: `git checkout -b feature/my-new-feature`
3. Commit your changes: `git commit -am 'Add some feature'`
4. Push to the branch: `git push origin feature/my-new-feature`
5. Submit a pull request

---

## License

This project is available for educational and personal use.

---

## Support

For issues or questions, please open an issue in the repository.

---

**Built with Ruby on Rails 7 and containerized with Docker for easy deployment across any platform.**
