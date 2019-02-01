json.array!(@responsavels) do |responsavel|
  json.extract! responsavel, :id, :cpf, :rg, :nome, :data_nascimento, :estado_civil, :telefone, :celular, :email, :profissao, :endereco, :numero, :bairro, :cep, :cidade, :uf
  json.url responsavel_url(responsavel, format: :json)
end
