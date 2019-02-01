class Mensalidade < ActiveRecord::Base
  belongs_to :matricula

  #Relacionamentos
  validates_presence_of :matricula_id
  
  
  #devem ser preenchidos
  validates_presence_of :data_emissao, message: "deve ser preenchido corretamente"
  validates_presence_of :data_vencimento, message: "deve ser preenchido"
  validates_presence_of :numero, message: "deve ser preenchido"
  validates_presence_of :valor, message: "deve ser preenchido"
  validates_presence_of :status, message: "deve ser preenchido"
  
   def self.search(search)
  	where("codigo LIKE ? OR data_emissao LIKE ? OR data_emissao LIKE ?  OR matricula_id LIKE ?  OR status LIKE ?" , 
	"%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%") 
   end
   
   def self.seleciona(selecionado)
		case selecionado
			when "abertas"
				Mensalidade.where("status = ? AND data_vencimento > ?", "aberta", DateTime.now)
			when "quitadas"
				Mensalidade.where("status = ?", "pago")
			when "vencidas"
				Mensalidade.where("data_vencimento < ? AND status = ?", DateTime.now, "aberta")
			else
				Mensalidade.all
		end
   end
  
end
