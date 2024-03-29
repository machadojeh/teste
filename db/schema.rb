# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20120819233931) do

  create_table "comment_likes", :force => true do |t|
    t.integer  "comment_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comment_likes", ["comment_id"], :name => "index_comment_likes_on_comment_id"
  add_index "comment_likes", ["user_id"], :name => "index_comment_likes_on_user_id"

  create_table "comments", :force => true do |t|
    t.integer  "user_id"
    t.text     "body"
    t.integer  "post_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "comments", ["post_id"], :name => "index_comments_on_post_id"
  add_index "comments", ["user_id"], :name => "index_comments_on_user_id"

  create_table "conversa_ativas", :force => true do |t|
    t.integer  "destinatario"
    t.integer  "remetente"
    t.integer  "status"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "eventos", :force => true do |t|
    t.integer  "profile_id"
    t.string   "nome"
    t.datetime "data"
    t.string   "local"
    t.text     "desc"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
    t.string   "criador"
  end

  create_table "mensagems", :force => true do |t|
    t.string   "dono"
    t.string   "remet"
    t.string   "dest"
    t.text     "mensagem"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "mensagens", :force => true do |t|
    t.integer  "destinatario"
    t.integer  "remetente"
    t.string   "mensagem"
    t.integer  "lida"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  create_table "participacao_eventos", :id => false, :force => true do |t|
    t.integer  "evento_id"
    t.integer  "profile_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "participacao_eventos", ["evento_id", "profile_id"], :name => "index_relationships_on_evento_id_and_profile_id", :unique => true
  add_index "participacao_eventos", ["evento_id"], :name => "index_participacao_eventos_on_evento_id"
  add_index "participacao_eventos", ["profile_id"], :name => "index_relationships_on_profile_id"

  create_table "post_likes", :force => true do |t|
    t.integer  "post_id"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "post_likes", ["post_id"], :name => "index_post_likes_on_post_id"
  add_index "post_likes", ["user_id"], :name => "index_post_likes_on_user_id"

  create_table "posts", :force => true do |t|
    t.text     "content"
    t.integer  "user_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "posts", ["user_id"], :name => "index_posts_on_user_id"

  create_table "profiles", :force => true do |t|
    t.string   "full_name"
    t.text     "about"
    t.string   "website"
    t.string   "contact_email"
    t.date     "birthday"
    t.string   "gender"
    t.string   "country"
    t.string   "state"
    t.string   "city"
    t.string   "high_school"
    t.string   "college"
    t.string   "work_at"
    t.integer  "user_id"
    t.datetime "created_at",    :null => false
    t.datetime "updated_at",    :null => false
  end

  add_index "profiles", ["user_id"], :name => "index_profiles_on_user_id"

  create_table "relationships", :force => true do |t|
    t.integer  "follower_id"
    t.integer  "followed_id"
    t.datetime "created_at",  :null => false
    t.datetime "updated_at",  :null => false
  end

  add_index "relationships", ["followed_id"], :name => "index_relationships_on_followed_id"
  add_index "relationships", ["follower_id", "followed_id"], :name => "index_relationships_on_follower_id_and_followed_id", :unique => true
  add_index "relationships", ["follower_id"], :name => "index_relationships_on_follower_id"

  create_table "users", :force => true do |t|
    t.string   "email",                  :default => "", :null => false
    t.string   "encrypted_password",     :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                             :null => false
    t.datetime "updated_at",                             :null => false
    t.string   "provider"
    t.string   "uid"
    t.integer  "online"
    t.integer  "signed_in"
    t.integer  "privacy"
  end

  add_index "users", ["email"], :name => "index_users_on_email", :unique => true
  add_index "users", ["reset_password_token"], :name => "index_users_on_reset_password_token", :unique => true

end
