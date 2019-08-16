class EncodersController < ApplicationController
require 'rqrcode'
require 'rqrcode_png'
require 'chunky_png'
  
  def new
    binding.pry
    content = params[:text0]
    if content.nil?
      content ='テスト'
    else
      content = params.require(:text0)
    end
    @qrcode = qr_encode(content)
  end

  def create

  end

  def qr_encode(content, options = {})
    qr = ::RQRCode::QRCode.new(content)
    return ChunkyPNG::Image.from_datastream(qr.as_png.resize(500,500).to_datastream).to_data_url
  end
end
