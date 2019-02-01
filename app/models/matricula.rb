class Matricula < ActiveRecord::Base
  belongs_to :turma
  belongs_to :aluno
  has_many :mensalidades, dependent: :destroy
  has_many :contratos, dependent: :destroy
  
  #Relacionamentos
  validates_presence_of :turma_id
  validates_associated :turma
  validates_presence_of :aluno_id
  validates_associated :aluno
  
  #devem ser preenchidos
  validates_presence_of :data_inicio_matricula, message: "deve ser preenchido"
  
  def self.search(search)
  	where("id LIKE ? OR status_contrato LIKE ? OR status_matricula LIKE ?", search, search, search) 
  end
  
end
