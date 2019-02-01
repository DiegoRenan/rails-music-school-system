json.array!(@usuarios) do |usuario|
  json.extract! usuario, :id, :login, :senha, :nivel, :funcionario_id
  json.url usuario_url(usuario, format: :json)
end
