class Sala < ActiveRecord::Base
  has_many :turmas, through: :salas_turmas
  #devem ser preenchidos
  validates_presence_of :nome, message: "deve ser preenchido corretamente"
  validates_presence_of :limite, message: "deve ser preenchido"
  
  #quantidade de caracteres
  validates :limite, length: {minimum: 1, message:"limite minímo de 1 aluno"}

end
