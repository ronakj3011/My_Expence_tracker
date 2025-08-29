FROM ruby:3.1.0

# Install dependencies
RUN apt-get update -qq && apt-get install -y \
  build-essential \
  libpq-dev \
  libsqlite3-dev \
  libxml2-dev \
  libxslt1-dev \
  nodejs \
  npm \
  git \
  curl

# Set working directory
WORKDIR /app

# Copy Gemfiles first (important!)
COPY Gemfile ./

# Install gems
RUN bundle install

# Copy all project files
COPY . .

# Expose Rails port
EXPOSE 3000

# Start Rails server
CMD ["bin/rails", "server", "-b", "0.0.0.0", "-p", "3000"]

