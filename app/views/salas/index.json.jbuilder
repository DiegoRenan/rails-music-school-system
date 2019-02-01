json.array!(@salas) do |sala|
  json.extract! sala, :id, :nome, :numero, :limite
  json.url sala_url(sala, format: :json)
end
