class EncodersController < ApplicationController
  require 'rqrcode'
  require 'rqrcode_png'
  require 'chunky_png'

  def new
    contents = params[:text]
    contents = if contents.nil?
                 ['テスト']
               else
                 params.require(:text)
               end
    @qrcodes = []
    contents.each do |content|
      @qrcodes.push({qr: qr_encode(content), content: content}) if content != ''
    end
  end

  def create; end

  def qr_encode(content, _options = {})
    qr = ::RQRCode::QRCode.new(content)
    return ChunkyPNG::Image.from_datastream(qr.as_png.resize(500, 500).to_datastream).to_data_url
  end
end
