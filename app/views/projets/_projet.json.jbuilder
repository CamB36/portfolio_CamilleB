json.extract! projet, :id, :title, :description, :dateStart, :dateEnd, :projet_type, :reference, :image, :created_at, :updated_at
json.url projet_url(projet, format: :json)
