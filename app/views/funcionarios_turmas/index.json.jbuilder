json.array!(@funcionarios_turmas) do |funcionarios_turma|
  json.extract! funcionarios_turma, :id
  json.url funcionarios_turma_url(funcionarios_turma, format: :json)
end
