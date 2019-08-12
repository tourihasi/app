class EncodersController < ApplicationController
require 'rqrcode'
require 'rqrcode_png'
require 'chunky_png'
  
  def new
    content = params[:text]
    if content.nil?
      content ='1'
    else
      content = params.require(:text)
    end
    @qrcode = qr_encode(content)
  end

  def create
    content = '1'
    @gg = qr_encode(content)
    redirect_to new_encoders_path
  end

  def qr_encode(content, options = {})
    qr = ::RQRCode::QRCode.new(content)
    return ChunkyPNG::Image.from_datastream(qr.as_png.resize(500,500).to_datastream).to_data_url
  end
end
