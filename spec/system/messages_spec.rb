require 'rails_helper'

describe 'メッセージ機能', type: :system do # describe テストのタイトル(任意)
  # letで変数のように扱う
  let(:user_a) { FactoryBot.create(:user, name: 'テストネームa', email: 'テストメールa', password: 'テストパスワードa', admin: true) }
  let(:user_b) { FactoryBot.create(:user, name: 'テストネームb', email: 'テストメールb', password: 'テストパスワードb', admin: true) }

  before do
    # message 作成
    message_a = FactoryBot.create(:message, title: 'テストタイトルa', body: 'テストボディa', user: user_a)
    message_b = FactoryBot.create(:message, title: 'テストタイトルb', body: 'テストボディb', user: user_b)
    # login
    visit login_path # ログインパスへ移動
    fill_in 'あなたのお名前', with: login_user.name # 後述のlogin_user変数の名前
    fill_in 'あなたのﾊﾟｽﾜｰﾄﾞ', with: login_user.password # 後述のlogin_user変数のパス
    click_button 'サインイン'
  end

  describe 'メッセージ一覧表示機能' do
    context 'user_aでﾛｸﾞｲﾝ時' do
      let(:login_user) { user_a } # login_user 変数はuser_a

      it 'メッセージ表示' do
        visit messages_path # メッセージ一覧へ移動
        # 一覧表示確認 テストタイトルがあることをページに期待する
        expect(page).to have_content 'テストタイトルa'
      end

      it 'メッセージ作成' do
        visit new_message_path
        fill_in 'title', with: '入力タイトル'
        fill_in 'body', with: '入力ボディ'
        click_button '展開'
        expect(page).to have_content '入力タイトル'
        expect(page).to have_content '入力ボディ'
      end

      it '送信メッセージにuser_bのﾒｯｾｰｼﾞが表示されていないことの確認' do
        visit messages_sent_path
        expect(page).to have_no_content 'テストタイトルb'
      end
    end

    context 'user_bでﾛｸﾞｲﾝ時' do
      let(:login_user) { user_b } # login_user 変数はuser_b

      it '送信メッセージにuser_aのﾒｯｾｰｼﾞは表示されない' do
        visit messages_sent_path
        expect(page).to have_no_content 'テストタイトルa'
      end
    end
  end

  describe 'メッセージ詳細機能' do
    context 'user_aでﾛｸﾞｲﾝ時' do
      let(:login_user) { user_a } # login_user 変数はuser_a

      before do
        # メッセージaの詳細path
        visit message_path(message_a)
        expect(page).to have_content '入力タイトル'
        expect(page).to have_content '入力ボディ'
      end
    end
  end
end
