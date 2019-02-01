class Aluno < ActiveRecord::Base
  belongs_to :responsavel
  has_many :matriculas, dependent: :destroy

  #Associação
  validates_associated :responsavel


  #devem ser preenchidos
  validates_presence_of :nome, message: "deve ser preenchido"
  validates_presence_of :celular, message: "deve ser preenchido"  
  validates_presence_of :nome_pai, message: "deve ser preenchido"
  validates_presence_of :nome_mae, message: "deve ser preenchido"
  validates_presence_of :sexo, message: "deve ser preenchido"  
  validates_presence_of :estado_civil, message: "deve ser preenchido"
  validates :email, allow_blank: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create, message: "inválido" }

  #campos que devem ser unicos
  #validates_uniqueness_of :cpf, message: "já cadastrado"
  #validates_uniqueness_of :rg, message: "já cadastrado"

  #quantidade de caracteres
  validates :cpf, allow_blank: true, length: {minimum: 11, maximum: 12, message:"incorreto, digite novamente"}
  validates :rg, allow_blank: true, length: {minimum: 5, maximum: 20, message:"incorreto, digite novamente"}
  validates :celular, length: {minimum: 11, maximum: 13, message:"incorreto, digite novamente"}
  
  def self.search(search)
  	where("nome LIKE ? OR cpf LIKE ? OR rg LIKE ?  OR nome_pai LIKE ?  OR nome_mae LIKE ?
	OR nome_mae LIKE ?" , "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%") 
  end
 
end
