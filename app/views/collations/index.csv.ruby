require 'csv'

CSV.generate(encoding: Encoding::SJIS, row_sep: "\r\n", force_quotes: true) do |csv|
  column_names = %w[データ１ データ２ 合否 照合者 照合日]
  csv << column_names
  @collations.each do |collation|
    column_values = [
      collation.number1,
      collation.number2,
      collation.succes,
      collation.user_name,
      collation.created_at.strftime("%Y/%m/%d %H:%M")
    ]
    csv << column_values
  end
end
