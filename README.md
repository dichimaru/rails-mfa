rails でMFA認証するサンプル
# やったこと
- 1. ruby2.6.5インストール
  - `rbenv install 2.6.5`
  - `rbenv local 2.6.5`
- 2. bunderインストール
  - `gem install bundler`
- 3. `bunde init`
- 4. Gemfileに`gem "rails"`を追加
- 5. `bundle install --path vendor/bundle`を実施
- 6. `bundle exec rails new . -d mysql`を実施
  - README.mdとGemfileを上書き
- 7. エラーが出てたので、`bundle update`実施
  - mysql2でエラーが出たので、bundle config追加
    - `bundle config --local build.mysql2 "--with-cppflags=-I/usr/local/opt/openssl/include"`
    - `bundle config --local build.mysql2 "--with-ldflags=-L/usr/local/opt/openssl/lib"`
- 8. mysql8を`docker-compose`で追加
- 9. `docker-compose up -d`でmysql起動
- 10. `bin/rails db:create`
- 11. `rails webpacker:install`でwebpackerを追加

