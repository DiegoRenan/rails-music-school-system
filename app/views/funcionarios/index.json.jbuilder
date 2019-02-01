json.array!(@funcionarios) do |funcionario|
  json.extract! funcionario, :id, :cpf, :rg, :nome, :telefone, :celular, :celular_op, :email, :cargo, :endereco, :numero, :bairro, :cidade, :uf, :cep, :logradouro, :instituicao_id
  json.url funcionario_url(funcionario, format: :json)
end
