json.array!(@turmas) do |turma|
  json.extract! turma, :id, :nome, :inicio, :termino, :hora_inicio, :hora_fim, :dia, :instituicao_id, :curso_id
  json.url turma_url(turma, format: :json)
end
