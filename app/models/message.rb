class Message < ApplicationRecord
  # userとmessageの1対多の関係
  belongs_to :user
  has_many :comments
  # messageはcommentsを通して多くのuserを持っている
  has_many :comment_users, through: :comments, source: :user
  # active strage 複数upload
  has_many_attached :images

  # ﾍﾟｰｼﾞ前後送り
  def previous
    Message.order('created_at desc, id desc').where('created_at <= ? and id < ?', created_at, id).first
  end

  def next
    Message.order('created_at desc, id desc').where('created_at >= ? and id > ?', created_at, id).reverse.first
  end

  # csv I/O
  def self.csv_attributes # どの属性をどの順番で出力するか決めた
    %w[title body created_at]
  end

  def self.generate_csv # selfは引数
    CSV.generate(headers: true) do |csv| # generateでcsv作成
      csv << csv_attributes # １行目のタイトル= 'title','body','created_at'
      all.each do |message|
        csv << csv_attributes.map { |attr| message.send(attr) } # 1行ずつmessageから取り出してcsvに与えている
      end
    end
  end
end
