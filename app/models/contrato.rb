class Contrato < ActiveRecord::Base
  belongs_to :matricula
  
  validates_presence_of :matricula_id
  validates_associated :matricula
end
