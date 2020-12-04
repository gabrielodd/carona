class LocalIntermediario < ApplicationRecord
  belongs_to :trajeto, :dependent => :delete_all 
end
