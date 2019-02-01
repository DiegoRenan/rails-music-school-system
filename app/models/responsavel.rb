class Responsavel < ActiveRecord::Base
  has_many :alunos
   #devem ser preenchidos
  validates_presence_of :cpf, message: "deve ser preenchido corretamente"
  validates_presence_of :nome, message: "deve ser preenchido"
  validates_presence_of :celular, message: "deve ser preenchido"
  validates_presence_of :profissao, message: "deve ser preenchido"
  validates_presence_of :cep, message: "deve ser preenchido"
  validates :email, allow_blank: true, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create, message: "inválido" }
  
  #campos que devem ser unicos
  validates_uniqueness_of :cpf, message: "já cadastrado"
  validates_uniqueness_of :rg, message: "já cadastrada"
  
  #quantidade de caracteres
  validates :cpf, length: {minimum: 11, maximum: 12, message:"incorreto, digite novamente"}
  validates :cep, length: {minimum: 8, maximum: 9, message:"incorreto, digite novamente"}
  validates :cidade, length: {minimum: 3, message:"incorreto, digite novamente"}
  validates :bairro, length: {minimum: 3, message:"incorreto, digite novamente"}
  validates :endereco, length: {minimum: 1, message:"incorreto, digite novamente"}
  
  def self.search(search)
  	where("nome LIKE ? OR cpf LIKE ? OR rg LIKE ?  OR telefone LIKE ?  OR celular LIKE ? OR bairro LIKE ? 
	OR cidade LIKE ? OR profissao LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", 
	"%#{search}%", "%#{search}%", "%#{search}%") 
  end
  
end
