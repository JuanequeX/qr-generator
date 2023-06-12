class CreateQrCodes < ActiveRecord::Migration[7.0]
  def change
    create_table :qr_codes do |t|
      t.string :url

      t.timestamps
    end
  end
end
