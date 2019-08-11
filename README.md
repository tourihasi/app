# 概要

* 【開発環境構築】  
  ・Dockerfile/docker-compose.ymlを使用した開発環境構築  
  【CI】  
  ・CircleCiを用いた、Githubへpush時の自動ﾃｽﾄ  
  ・ 'rspec','rubocop'使用  

* 【ポートフォリオの機能】  
  ・ﾛｸﾞｲﾝ  
    sessionによるログイン機能  
    googleアカウントでのログイン機能  
  ・ユーザー管理  
      ユーザ登録/編集/削除  
      ユーザmodel バリデーション  
      jqueryによる入力フォームのバリデーション  
  ・メッセージ機能  
      modelの多対多のアソシエーションによるコメント機能  
      Ajax処理によるコメント投稿/削除  
      Active Storageによるﾌｧｲﾙ投稿  
      添付画像・動画のサムネイル表示  
      kaminariによるページネーション機能  
      ransackによる検索機能  
      csv出力  