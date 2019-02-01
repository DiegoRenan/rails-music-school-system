class Instituicao < ActiveRecord::Base
  has_many :funcionarios, dependent: :destroy
  has_many :turmas, dependent: :destroy
  
  #Relacionamentos
  validates_associated :funcionarios
  validates_associated :turmas
  
  #Deve ser preenchidos
  validates_presence_of :cnpj, message: "deve ser preenchido corretamente"
  validates_presence_of :insc_estadual, message: "deve ser preenchido"
  validates_presence_of :razao_social, message: "deve ser preenchido"
  validates_presence_of :nome_fantasia, message: "deve ser preenchido"
  validates_presence_of :responsavel, message: "deve ser preenchido"
  validates_presence_of :telefone, message: "deve ser preenchido"
  validates_presence_of :email, message: "deve ser preenchido"
  validates_presence_of :endereco, message: "deve ser preenchido"
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create, message: "inválido" }
  
  #campos que devem ser unicos
  validates_uniqueness_of :cnpj, message: "já cadastrado"
  validates_uniqueness_of :insc_estadual, message: "já cadastrada"
  validates_uniqueness_of :razao_social, message: "já cadastrada"
  
  #quantidade de caracteres
  validates :cnpj, length: {minimum: 14, message:"incorreto, CNPJ deve ter 14 dígitos"}
  validates :insc_estadual, length: {minimum: 9, message:"incorreto, deve conter 9 dígitos"}
  validates :telefone, length: {minimum: 10, message:"incorreto, digite no formato DD XXXX XXXX"}
end
