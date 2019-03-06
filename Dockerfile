FROM ruby:2.6

EXPOSE 4000
WORKDIR /src

RUN apt-get update && \
    apt-get install -y nodejs && \
    rm -rf /var/lib/apt/lists/*
    
RUN gem install jekyll-materialdocs

COPY Gemfile* /src/
RUN bundle install

CMD jekyll serve --host 0.0.0.0