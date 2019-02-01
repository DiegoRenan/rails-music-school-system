json.array!(@instituicaos) do |instituicao|
  json.extract! instituicao, :id
  json.url instituicao_url(instituicao, format: :json)
end
