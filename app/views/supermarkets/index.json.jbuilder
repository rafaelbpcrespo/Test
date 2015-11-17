json.array!(@supermarkets) do |supermarket|
  json.extract! supermarket, :id, :name, :cep_id
  json.url supermarket_url(supermarket, format: :json)
end
