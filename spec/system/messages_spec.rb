require 'rails_helper'

describe 'メッセージ一覧表示', type: :system do #describe テストのタイトル(任意)
  describe '一覧表示'
    before do
      #user 作成
      user_test =  FactoryBot.create(:user, name: 'テストネーム', email: 'テストメール', password: 'テストパスワード', admin: true)
      #message 作成
      message_test = FactoryBot.create(:message, title: 'テストタイトル', body: 'テストボディ',user: user_test)
    end

    context 'userがloginしている時' do
      before do
        #login
        visit login_path #ログインパスへ移動
        fill_in 'あなたのお名前', with: 'テストネーム'
        fill_in 'あなたのﾊﾟｽﾜｰﾄﾞ', with: 'テストパスワード'
        click_button 'サインイン'
      end
    end

    it 'メッセージ表示' do
      visit messages_path #メッセージ一覧へ移動
      # 一覧表示確認 テストタイトルがあることをページに期待する
      expect(page).to have_content 'テストタイトル'
    end
end