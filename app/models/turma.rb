class Turma < ActiveRecord::Base
  belongs_to :instituicao
  belongs_to :curso
  has_many :funcionarios, through: :funcionarios_turma
  has_many :salas, through: :salas_turmas

  #Validações de Relacionamento
  validates_presence_of :curso_id
  validates_presence_of :instituicao_id
  
  #devem ser preenchidos
  validates_presence_of :nome, message: "deve ser preenchido"
  validates_presence_of :inicio, message: "deve ser preenchido"
  validates_presence_of :termino, message: "deve ser preenchido"
  validates_presence_of :hora_inicio, message: "deve ser preenchido"
  validates_presence_of :hora_fim, message: "deve ser preenchido"
  validates_presence_of :dia, message: "deve ser preenchido"
  
  #quantidade de caracteres
  validates :nome, length: {minimum: 3, maximum: 40, message:"deve ter de 3 a 40 digítos"}
  
  def self.search(search)
  	where("nome LIKE ? OR dia LIKE ? OR turno LIKE ?  OR hora_inicio LIKE ?  OR id LIKE ?", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%", "%#{search}%") 
  end
  
end
