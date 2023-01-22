require "active_support/core_ext/integer/time"

Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # In the development environment your application's code is reloaded any time
  # it changes. This slows down response time but is perfect for development
  # since you don't have to restart the web server when you make code changes.
  config.cache_classes = false

  # Do not eager load code on boot.
  config.eager_load = false

  # Show full error reports.
  config.consider_all_requests_local = true

  # Enable/disable caching. By default caching is disabled.
  # Run rails dev:cache to toggle caching.
  if Rails.root.join('tmp', 'caching-dev.txt').exist?
    config.action_controller.perform_caching = true
    config.action_controller.enable_fragment_cache_logging = true

    config.cache_store = :memory_store
    config.public_file_server.headers = {
      'Cache-Control' => "public, max-age=#{2.days.to_i}"
    }
  else
    config.action_controller.perform_caching = false

    config.cache_store = :null_store
  end

  # Store uploaded files on the local file system (see config/storage.yml for options).
  config.active_storage.service = :local

  # Don't care if the mailer can't send.
  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.perform_caching = false

  # Print deprecation notices to the Rails logger.
  config.active_support.deprecation = :log

  # Raise exceptions for disallowed deprecations.
  config.active_support.disallowed_deprecation = :raise

  # Tell Active Support which deprecation messages to disallow.
  config.active_support.disallowed_deprecation_warnings = []

  # Raise an error on page load if there are pending migrations.
  config.active_record.migration_error = :page_load

  # Highlight code that triggered database queries in logs.
  config.active_record.verbose_query_logs = true

  config.active_job.queue_adapter = :inline

  # Debug mode disables concatenation and preprocessing of assets.
  # This option may cause significant delays in view rendering with a large
  # number of complex assets.
  config.assets.debug = true

  # Suppress logger output for asset requests.
  config.assets.quiet = true

  # Raises error for missing translations.
  # config.i18n.raise_on_missing_translations = true

  # Annotate rendered view with file names.
  # config.action_view.annotate_rendered_view_with_filenames = true

  # Use an evented file watcher to asynchronously detect changes in source code,
  # routes, locales, etc. This feature depends on the listen gem.
  config.file_watcher = ActiveSupport::EventedFileUpdateChecker

  # Uncomment if you wish to allow Action Cable access from any origin.
  # config.action_cable.disable_request_forgery_protection = true
  config.hosts.clear
end

#1章
#「rails new meshiterro」実行
#config/environments/development.rb内一番下のendの上に「config.hosts.clear」と記述
#「rails g controller homes top」実行
#config/routes.rb内に「get 'homes/top'」と「root to: "homes#top"」追加
#app/views/homes/top.html.erb内に「<h1>Topページ</h1>」追加・P内は中身だけ消す。
#「rails active_storage:install」実行
#「rails db:migrate」実行
#Gemfile内の「# gem 'image_processing', '~> 1.2'」の下に「gem 'image_processing', '~>1.2'」追加
#「bundle install」実行
#config/environments/development.rb内「config.active_record.verbose_query_logs = true」の下に
 #「config.active_job.queue_adapter = :inline」追加
#5-1の下の「画像」クリック、ダウンロード
#app/assets内にドラック&ドロップ(Overwrite か Skip を訊かれたときは、Overwrite を指定)

#2章

#3章

#4章
#Gemfile内の一番最後に「gem 'devise'」追加
#「bundle install」実行

#5章
#「rails g devise:install」実行
#「rails g devise User」実行
#db/migrate/（年月日時分秒）_devise_create_users.rb内の「# t.datetime :locked_at」の下に以下追加
 #「## 名前を保存するカラム」
 #「t.string :name」
#「rails db:migrate」実行

#6章
#「rails g devise:views」実行
#app/views/devise/registrations/new.html.erb内の3行目の後に
 #「<div class="field"><%= f.label :name %><br><%= f.text_field :name %></div>」を4行に分けて追加
#app/controllers/application_controller.rb内1行目の下に
 #meshiterro6/app/controllers/application_controller.rb内2行目以降追加
#app/views/layouts/application.html.erb内にmeshiterro6/app/views/layouts/application.html.erb内の「<body>/<header>内」追加
#app/views/devise/registrations/new.html.erb内2行目に「<%= form_with model: @user, url: user_registration_path do |f| %>」追加
#app/views/devise/sessions/new.html.erb内2行目に「<%= form_with model: @user, url: user_session_path do |f| %>」追加

#7章
#Aboutページの作成
 #config/routes.rb内の「get 'homes/top'」を「get 'homes/top' =>"homes#top"」に書き換え、その次行に「get "homes/about" =>"homes#about", as: 'about'」追加
 #app/views/homes内に新ファイル「about.html.erb」追加about.html.erb内に「<h1>Aboutページ</h1>」記述
#app/controllers/application_controller.rb内の「before_action」の下に「def after_sign_in..end」追加
#app/controllers/application_controller.rb内の「def after_sign_in..end」の下に「def after_sign_out..end」追加

#8章
#「rails g model PostImage」実行
#db/migrate/(作成日時）_create_post_images.rb内に「t.string :shop_name」「t.string :caption」「t.integer :user_id」追加
#「rails db:migrate」実行
#app/models/post_image.rb内に「has_one_attached :image」追加

#9章
#app/models/user.rb内の「end」の上に「has_many :post_images, dependent: :destroy」記述
#app/models/post_image.rb内「has_one_attached :image」の下に「belongs_to :user」追加
#「rails g controller PostImages new index show」実行
#config/routes.rb内の「get 'post_images/new'～get 'post_images/show'」を「resources :post_images, only: [:new, :index, :show]」に変更

#10章
#app/controllers/post_images_controller.rb内の「def new..end」内に「@post_image = PostImage.new」記述
#app/views/post_images/new.html.erb内に「<h1>画像投稿フォーム</h1>～<% end %>」記述
#app/controllers/post_images_controller.rb内「def new..end」の下に「def create..end」記述、一番下に「private..end」記述
#config/routes.rb内の「resources」を「resources :post_images, only: [:new, :create, :index, :show]」に変更
#app/views/layouts/application.html.erb内の「<% if user_signed_in? %>」の下に「<li><%= link_to '投稿フォーム', new_post_image_path %></li>」追加

#11章
#app/models/post_image.rb内「def get_image..end」追加、その下にもう一つ「def get_image..end」追加
#app/controllers/post_images_controller.rb内の「def index」に「@post_images = PostImage.new」追加
#app/views/post_images/index.html.erb内に「<% @post_images.each do |post_image| %>～<% end %>」追加

#12章
#app/controllers/post_images_controller.rb内「def show..end」内に「@post_images = PostImage.new」追加
#app/views/post_images/show.html.erb内に「<div>～</div>」追加
#app/views/post_images/index.html.erb内の「<%= image_tag post_image.get_image %>」を「<%= link_to post_image_path(post_image.id) do %><% end %>」内に入れて記述

#13章
#app/controllers/post_images_controller.rb内「def destroy..end」内以下3行記述
 #@post_image = post_image.find(params[:id])
 #@post_image.destroy
 #redirect_to '/post_images'
#config/routes.rb内の「resources」を「resources :post_images, only: [:new, :create, :index, :show, :destroy]」に変更
#app/views/post_images/show.html.erb内「投稿日」の下に「<% if @post_image.user == current_user %>～<% end %>」記述

#14章
#app/models/user.rb内「has_many :post_images, dependent: :destroy」の下に「has_one_attached :profile_image」以降の記述を追加
#「rails g controller users show edit」実行
#config/routes.rb内「#get 'users/show'～#get 'users/edit'」を「resources :users, only: [:show, :edit]」に変更、12行目に記述

#15章
#app/controllers/users_controller.rb内の「def show..end」に「@user = PostImage.find(params[:id])」「@post_images = @user.post_images」追加
#app/views/users/show.html.erb内に「<!-- ユーザーの詳細 -->～<% end %>」追加
#app/views/layouts/application.html.erb内「<li><%= link_to '投稿フォーム', new_post_image_path %></li>」の下に
 #「<li><%= link_to 'マイページ', user_path(current_user.id) %></li>」追加
 
#16章
#app/controllers/users_controller.rb内の「def edit..end」に「@user = PostImage.find(params[:id])」追加
#app/views/users/edit.html.erb内に「<h2>プロフィール編集</h2>～<% end %>」記述
#app/views/users/show.html.erb内「<%= image_tag @user.get_profile_image(100,100) %>」の下に「<p><%= link_to "プロフィール編集", edit_user_path(@user) %></p>」記述
#app/controllers/users_controller.rb内に一番下に「def update..end」「private..end」追加
#config/routes.rb内の「resources :users, only: [:show, :edit]」を「resources :users, only: [:show, :edit, :update]」に変更
#app/views/users/show.html.erb内「<p><%= link_to "プロフィール編集", edit_user_path(@user) %></p>」の外側に「<% if @user == current_user %><% end %>」記述

#17章
#app/views/post_images/index.html.erb内「<p>投稿ユーザー画像：<%= image_tag 'sample-author1.jpg' %></p>」を
 #「<p>投稿ユーザー画像：<%= image_tag post_image.user.get_profile_image(100,100) %></p>」に変更
#app/views/post_images/show内「<p>投稿ユーザー画像：<%= image_tag 'sample-author1.jpg' %></p>」を
 #「<p>投稿ユーザー画像：<%= image_tag @post_image.user.get_profile_image(100,100) %></p>」に変更
 
#18章
#「rails g model PostComment comment:text user_id:integer post_image_id:integer」実行 モデル名の後に追加したいカラム名：データ型でファイル内に追加が不要になる
#「rails db:migrate」実行
#app/models/user.rb内「has_many :post_images, dependent: :destroy」の下に「has_many :post_comments, dependent: :destroy」追加
#app/models/post_image.rb内「belongs_to :user」の下に「has_many :post_comments, dependent: :destroy」追加
#app/models/post_comment.rb内「belongs_to :user」「belongs_to :post_image」追加
#「rails g controller post_comments」実行
#config/routes.rb内「resources :post_images, only: [:new, :create, :index, :show, :destroy]」を親にする記述、以下に変更
 #「resources :post_images, only: [:new, :create, :index, :show, :destroy] do～resources :users, only: [:show, :edit, :update]」
#app/controllers/post_comments_controller.rb内「def create～end」「private～end」記述
#app/controllers/post_images_controller.rb内の「def show」内「end」の上に「@post_comment = PostComment.new」追加
#app/views/post_images/show.html.erb内一番下に「<div>～</div><div>～</div>」追加
#app/views/post_images/index.html.erb内「<p>ユーザーネーム：<%= post_image.user.name %></p>」の下に
 #「<p><%= link_to "#{post_image.post_comments.count} コメント", post_image_path(post_image.id) %></p>」追加
#app/views/users/show.html.erb内内「<p>ユーザーネーム：<%= post_image.user.name %></p>」の下に
 #「<p><%= link_to "#{post_image.post_comments.count} コメント", post_image_path(post_image.id) %></p>」追加
#config/routes.rb内「resources :post_comments, only: [:create]」を「resources :post_comments, only: [:create, :destroy]」に変更
#app/controllers/post_comments_conteoller内「private」の上に「def destroy..end」追加
#app/views/post_images/show.html.erb内「<%= post_comment.created_at.strftime('%Y/%m/%d') %><%= post_comment.comment %>」の下に
 #「<% if post_comment.user == current_user %>～<% end %>」追加

#19章
#「rails g model Favorite user_id:integer post_image_id:integer」実行 モデル名の後に追加したいカラム名：データ型でファイル内に追加が不要になる
#「rails db:migrate」実行
#app/models/favorite.rb内「belongs_to :user」「belongs_to :post_image」追加
#app/models/post_image.rb内「has_many :post_comments, dependent: :destroy」の下に「has_many :favorites, dependent: :destroy」追加
 #一番下の「end」の上に「def favorited_by?(user)..end」追加
#app/models/user.rb内「has_many :post_comments, dependent: :destroy」の下に「has_many :favorites, dependent: :destroy」追加
#config/routes.rb内「resources :post_images, only: [:new, :create, :index, :show, :destroy] do」の下に「resource :favorites, only: [:create, :destroy]」追加
#「rails g controller favorites」実行
#app/controllers/favortes_controller.rb内「def create..end」「def destroy..end」追加
#app/views/post_images/show.html.erb内「<%= link_to "削除", post_image_path(@post_image), method: :delete %><% end %>」の下に
 #「<% if @post_image.favorited_by?(current_user) %>～<% end %>」追加

#20章
#app/views/post_imagesに新ファイル「_list.html.erb」を作成
#app/views/post_images/index.html.erb内かapp/views/users/show.html.erb内の「<% @post_images.each do |post_image| %>～<% end %>」を切り取り
 #app/views/post_images/_list.html.erb内に貼り付け
#app/views/post_images/_list.html.erb内「<% @post_images.each do |post_image| %>」を「<% post_images.each do |post_image| %>」に変更(＠を消すだけ)
#app/views/users/show.html.erb内一番下に「<%= render 'post_images/list', post_images: @post_images %>」追加

#21章
#app/controllers/application_controller.rb内一番上の「class」の下に「  before_action :authenticate_user!, except: [:top]」追加
#app/models/post_image.rb内「has_many :favorites, dependent: :destroy」の下に「validates :shop_name, presence: true」「validates :image, presence: true」追加
#app/controller/post_images_controller.rb内の「def create..end」内「@post_image.user_id = current_user.id」の下を「if @post_image.save..end」に変更
#app/views/post_images/new.html.erb内「<h1>画像投稿フォーム</h1>」の下に「<% if @post_image.errors.any? %>～<% end %>」追加

#22章
#Gemfile内一番下に「gem 'kaminari','~> 1.2.1'」追加
#「bundle install」実行
#「rails g kaminari:config」実行
#「rails g kaminari:views default」実行
#app/controllers/post_images_controller.rb内の「def index」内「@post_images = PostImage.all」を「@post_images = PostImage.page(params[:page])」に変更
#app/controllers/users_controller.rb内の「def show」内「@post_images = @user.post_images」を「@post_images = @user.post_images.page(params[:page])」に変更
#app/views/post_images/_list.html.erb内一番最後に「<%= paginate post_images %>」追加
#config/initializers/kaminari_config.rb内「# config.default_per_page = 25」の下に「config.default_per_page = 5」追加

#23章
#23章「ひな形アプリをダウンロード」クリックで「Bootstrap」ダウンロード後「dmm webcamp」フォルダにドラック&ドロップ
#「cd bootstrap_template-main」で「bootstrap_template-main」に移動後「bundle install」実行「yarn install」実行「rails db:migrate」実行
#bootstrap_template-main/app/views/posts/index.html.erb内「<table>」を「<table class="table table-striped">」に変更
 #「<h1>Posts</h1>」の下に「<div class="container"><div class="row">」の2行と、「</table>」の下に「</div></div>」の2行追加
 #「<div class="row">」の下に「<div class="col-lg-4" style="background-color: orange;"><h2>サイドバー</h2></div>」追加
 #「<h2>サイドバー</h2><div>」の下に「<div class="col-lg-8">」追加、「</table>」の下に「</div>」追加
 #「<%= link_to 'New Post', new_post_path %>」を「<%= link_to 'New Post', new_post_path class: "btn btn-secondary" %>」に変更
 
#24章
#「yarn add jquery bootstrap@4.5 popper.js」実行
#config/webpack/environment.js内一番下に「const webpack～)」追加
#app/javascriptに「stylesheets」フォルダ作成、「stylesheets」フォルダ内に「application.scss」ファイル作成、
 #app/javascript/stylesheets/application.scss内に「@import '~bootstrap/scss/bootstrap';」記述
#app/javascript/packs/application.js内「import "channels"」の下に
 #「import "jquery";、import "popper.js";、import "bootstrap";、import "../stylesheets/application"」を4行にして追加
#app/views/layouts/application.html.erb内「<%= stylesheet_link_tag 'application', media: 'all', 'data-turbolinks-track': 'reload' %>」を
 #「<%= stylesheet_pack_tag 'application', media: 'all', 'data-turbolinks-track': 'reload' %>」に変更
#「yarn add @fortawesome/fontawesome-free@5.15.4」実行
#app/javascript/packs/application.js内「import "../stylesheets/application" 」の下に「import '@fortawesome/fontawesome-free/js/all'」追加
#app/javascript/stylesheets/application.scss内「@import '~bootstrap/scss/bootstrap';」の下に「@import '~@fortawesome/fontawesome-free/scss/fontawesome';」追加
#app/views/layouts/application.html.erb内「<%= csp_meta_tag %>」の下に「<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">」追加
 #「</head>」の下から「</html>」の上までの「<body class="d-flex flex-column vh-100">～</body>」を追加
#app/views/post_images/_list.html.erb内すべて「<div class="card-list-container py-5">～</div>」に変更
#app/views/post_images/new.html.erb内すべて「<div class="container">～</div>」に変更

#25章
#app/controllers/users_controller.rb内「def edit」の一番上、「def update」の一番上から「user_id = params[:id].to_i～end」追加
 #「private」内「end」の上に「def is_matching_login_user～end」追加
 #「def edit」「def update」内の「user_id = params[:id].to_i～end」を「is_matching_login_user」に書き換え
 #一番上から2行目にbefore_action :is_matching_login_user, only: [:edit, :update]追加、「is_matching_login_user」削除
 #「def edit」には「@user = User.find(params[:id])」のみ、
 #「def update」には「@user = User.find(params[:id])、@user.update(user_params)、redirect_to user_path(@user.id)」のみを記述

#26章
#config/initializers/devise.rb内「config.authentication_keys = [:email]」の「#」を外す、「[:email]」を「[:name]」に変更
#app/views/devise/sessions/new.html.erb内「<div class="container">～</div>」に変更、
 #「<p>ユーザー名と<br>パスワードを入力してください。</p>」の下「<p>メールアドレスと<br>パスワードを入力してください。</p>」を削除
 #「<%= f.text_field :name, autofocus: true, placeholder:"ユーザー名" %>」の下「<div class="input-group-prepend">～er:"メールアドレス" %>」を削除