require 'rails_helper'

RSpec.describe Post, type: :model do
  before do
    @post = FactoryBot.build(:post)
  end

  describe '投稿の登録' do
    context '投稿の登録ができるとき' do
      it '全ての入力事項が、存在すれば登録できる' do
        expect(@post).to be_valid
      end
      it 'レシピが空でも登録できる' do
        @post.recipe = ""
        expect(@post).to be_valid
      end
    end

    context '投稿ができないとき' do
      it 'ログインしていないと投稿できない' do
        @post.user = nil
        @post.valid?
        expect(@post.errors.full_messages).to include('ユーザーを入力してください')
      end
      it '画像がないと投稿できない' do
        @post.image = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("画像を入力してください")
      end
      it 'タイトルが空欄だと投稿できない' do
        @post.title = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("タイトルを入力してください")
      end
      it 'メニューが空欄だと投稿できない' do
        @post.menu = nil
        @post.valid?
        expect(@post.errors.full_messages).to include("メニューを入力してください")
      end
    end
  end
end
