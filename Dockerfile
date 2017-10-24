FROM ruby:2.4.2-stretch

ENV APP_ROOT /app/ditter

WORKDIR $APP_ROOT

COPY Gemfile $APP_ROOT

RUN bundle install \
	&& rm -rf ~/.gem

COPY . $APP_ROOT
EXPOSE 8080

ENTRYPOINT ["./docker-entrypoint.sh"]
CMD ["bundle", "exec", "rails", "s"]
