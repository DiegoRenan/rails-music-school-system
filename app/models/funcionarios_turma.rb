class FuncionariosTurma < ActiveRecord::Base
   belongs_to :turmas
   belongs_to :salas
end
