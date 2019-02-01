json.array!(@matriculas) do |matricula|
  json.extract! matricula, :id, :status_matricula, :data_inicio_matricula, :data_inicio_contrato, :data_fim_contrato, :turma_id, :aluno_id
  json.url matricula_url(matricula, format: :json)
end
