# syntax=docker/dockerfile:1
FROM ruby:3.0
RUN apt-get update -qq && \
    apt-get install -y nodejs postgresql-client npm && \
    npm install --global yarn
WORKDIR /myapp

COPY Gemfile /myapp/Gemfile
COPY Gemfile.lock /myapp/Gemfile.lock
RUN bundle install

COPY package.json /mayapp/package.json
COPY yarn.lock /myapp/yarn.lock
RUN yarn install

# Add a script to be executed every time the container starts.
COPY scripts/entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Configure the main process to run when running the image
#CMD ["rails", "server", "-b", "0.0.0.0"]
CMD ["bin/dev"]