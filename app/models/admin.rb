class Admin < ApplicationRecord
  #belongs_to :dados_identificacoes

  def ativar
    self.ativo = true
    self.save
  end
end
