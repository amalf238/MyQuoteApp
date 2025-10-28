# Use official Ruby 3.2.2 image
FROM ruby:3.2.2

# Install dependencies
RUN apt-get update -qq && \
    apt-get install -y nodejs sqlite3 libsqlite3-dev && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Set working directory
WORKDIR /app

# Copy Gemfile and Gemfile.lock
COPY Gemfile Gemfile.lock ./

# Install gems
RUN bundle install

# Copy the rest of the application
COPY . .

# Precompile assets (optional, for production)
# RUN bundle exec rails assets:precompile

# Expose port 3000
EXPOSE 3000

# Create database directory if it doesn't exist
RUN mkdir -p db

# Start the Rails server
CMD ["bash", "-c", "rm -f tmp/pids/server.pid && bundle exec rails db:create db:migrate db:seed && bundle exec rails server -b 0.0.0.0"]
