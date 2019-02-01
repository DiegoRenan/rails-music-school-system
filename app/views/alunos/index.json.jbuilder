json.array!(@alunos) do |aluno|
  json.extract! aluno, :id, :cpf, :rg, :nome, :data_nascimento, :estado_civil, :sexo, :telefone, :celular, :email, :profissao, :nome_pai, :nome_mae, :observacao, :parentesco_responsavel, :responsavel_id
  json.url aluno_url(aluno, format: :json)
end
