json.array!(@mensalidades) do |mensalidade|
  json.extract! mensalidade, :id, :codigo, :data_emissao, :data_vencimento, :numero, :valor, :desconto, :valor_desconto, :juros, :valor_pago, :matricula_id
  json.url mensalidade_url(mensalidade, format: :json)
end
