class SalasTurma < ActiveRecord::Base
  belongs_to :sala
  belongs_to :turma
end
