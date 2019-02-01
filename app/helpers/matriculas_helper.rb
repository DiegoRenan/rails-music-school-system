module MatriculasHelper

	def there_carne?(id)
		@mensalidade = Mensalidade.where("matricula_id = ?", id)
		@mensalidade.ids.include?(id)
	end
	
end
