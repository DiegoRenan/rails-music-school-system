class Curso < ActiveRecord::Base
  has_many :turmas, dependent: :destroy
  
  
  #Relacionamentos
  validates_associated :turmas
  
  #devem ser preenchidos
  validates_presence_of :nome, message: "deve ser preenchido"
  validates_presence_of :valor, message: "deve ser preenchido"
    
  #campos que devem ser unicos
  validates_uniqueness_of :nome, message: "já cadastrado"
  
  #quantidade de caracteres
  validates :nome, length: {minimum: 3, maximum: 40, message:"deve ter de 3 a 40 digítos"}
  
  def self.search(search)
  	where("nome LIKE ? OR valor LIKE ?", "%#{search}%", "%#{search}%") 
  end
  
end
