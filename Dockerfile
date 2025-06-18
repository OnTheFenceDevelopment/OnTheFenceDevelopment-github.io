FROM ruby:3.1

RUN apt-get update && apt-get install -y build-essential nodejs npm

WORKDIR /srv/jekyll

RUN gem install bundler jekyll

EXPOSE 4000

# CMD ["bundle", "exec", "jekyll", "serve", "--host", "0.0.0.0", "--watch"]
