require 'rqrcode'

class QrCodesController < ApplicationController
  def new
    @qr_code = QrCode.new
  end

  def create
    @qr_code = QrCode.new(qr_code_params)
    if @qr_code.save
      redirect_to qr_code_path(@qr_code)
    else
      render :new
    end
  end

  def show
    @qr_code = QrCode.find(params[:id])
    respond_to do |format|
      format.html
      format.png do
        url = @qr_code.url.starts_with?('http://', 'https://') ? @qr_code.url : "http://#{@qr_code.url}"
        qr = RQRCode::QRCode.new(url)

        # Ajusta el tamaño del código QR
        png = qr.as_png(size: 1200) # Ajusta el valor de 'size' según tus necesidades

        send_data png.to_s, type: "image/png", disposition: "attachment"
      end
    end
  end

  private

  def qr_code_params
    params.require(:qr_code).permit(:url)
  end
end
