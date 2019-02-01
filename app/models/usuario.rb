class Usuario < ActiveRecord::Base
  belongs_to :funcionario
  #valida associação
  validates_presence_of :funcionario_id
  #validates_associated :funcionario
  
  #deve ser preenchido
  validates_presence_of :login, message: "deve ser preenchido"
  validates_presence_of :password, message: "deve ser preenchido"
  validates_presence_of :nivel, message: "deve ser preenchido"
  
  #campos que devem ser unicos
  validates_uniqueness_of :login, message: "já cadastrado"
  
  #quantidade de caracteres
  validates :login, length: {minimum: 6, maximum: 15, message:"deve ter no minimo 6 digitos"}
  validates :password, length: {minimum: 6, maximum: 15, message:"deve ter no minimo 6 digitos"}
  has_secure_password
end
