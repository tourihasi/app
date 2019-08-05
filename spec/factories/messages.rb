FactoryBot.define do
    factory :message do
      title {'テストタイトル'}
      body  {'テストボディ'}
      user #user factory をmessageに定義されたuserの関連しているものを生成
    end
  end