require "rails_helper"

RSpec.describe MessageMailer, type: :mailer do
  let(:message) {FactoryBot.create(:message, title: 'mail_title',body: 'mail_body')}

  let(:text_body) do
    part = mail.body.parts.detect { |part| part.content_type == 'text/plain; charset=UTF-8' }
    part.body.raw_source
  end

  let(:html_body) do
    part = mail.body.parts.detect { |part| part.content_type == 'text/html; charset=UTF-8' }
    part.body.raw_source
  end

  describe '#creation_email' do
    let(:mail) { MessageMailer.creation_email(message) }

    it '作成したメールが生成されている' do
      #ヘッダ
      expect(mail.subject).to eq('テストメール')
      expect(mail.to).to eq(['example@.com'])
      expect(mail.from).to eq(['sousinngawa@example.com'])

      #text形式の本文
      expect(text_body).to match('以下のメッセージが展開されました')
      expect(text_body).to match('mail_title')
      expect(text_body).to match('mail_body')

      #html形式の本文
      expect(html_body).to match('以下のメッセージが展開されました')
      expect(html_body).to match('mail_title')
      expect(html_body).to match('mail_body')
    end
  end
end
