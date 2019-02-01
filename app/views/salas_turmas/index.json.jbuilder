json.array!(@salas_turmas) do |salas_turma|
  json.extract! salas_turma, :id
  json.url salas_turma_url(salas_turma, format: :json)
end
