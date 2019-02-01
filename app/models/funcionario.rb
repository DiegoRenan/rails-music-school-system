class Funcionario < ActiveRecord::Base
  belongs_to :instituicao
  has_one :usuario, dependent: :destroy
  has_many :turmas, through: :funcionarios_turma
  
  #Associação 
  validates_presence_of :instituicao_id
  
  #devem ser preenchidos
  validates_presence_of :endereco, message: "deve ser preenchido"
  validates_presence_of :bairro, message: "deve ser preenchido"
  validates_presence_of :cidade, message: "deve ser preenchido"
  validates_presence_of :uf, message: "deve ser preenchido"
  validates_presence_of :cep, message: "deve ser preenchido"
  validates_presence_of :numero, message: "deve ser preenchido"
  
  #quantidade de caracteres
  validates :cep, length: {minimum: 8, maximum: 9, message:"incorreto, digite novamente"}
  validates :uf, length: {minimum: 2, message:"incorreto, digite novamente"}
  validates :cidade, length: {minimum: 3, message:"incorreto, digite novamente"}
  validates :bairro, length: {minimum: 3, message:"incorreto, digite novamente"}

  
  #devem ser preenchidos
  validates_presence_of :cpf, message: "deve ser preenchido corretamente"
  validates_presence_of :rg, message: "deve ser preenchido"
  validates_presence_of :nome, message: "deve ser preenchido"
  validates_presence_of :celular, message: "deve ser preenchido"
  validates_presence_of :email, message: "deve ser preenchido"
  validates_presence_of :cargo, message: "deve ser preenchido"
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create, message: "inválido" }
  
  #campos que devem ser unicos
  validates_uniqueness_of :cpf, message: "já cadastrado"
  validates_uniqueness_of :rg, message: "já cadastrada"
  
  #quantidade de caracteres
  validates :cpf, length: {minimum: 11, maximum: 12, message:"incorreto, digite novamente"}
  validates :rg, length: {minimum: 6, message:"incorreto, digite novamente"}
  validates :telefone, length: {minimum: 10, maximum: 13, message:"incorreto, digite no formato DD xxxx xxxx"}
  validates :celular, length: {minimum: 10, maximum: 13, message:"incorreto, digite no formato DD xxxx xxxx"}
end
