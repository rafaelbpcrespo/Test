json.array!(@ceps) do |cep|
  json.extract! cep, :id, :code
  json.url cep_url(cep, format: :json)
end
