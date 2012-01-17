class Character < ActiveRecord::Base
  belongs_to :bemap
  acts_as_gmappable

  def gmaps4rails_address
    #describe how to retrieve the address from your model, if you use directly a db column, you can dry your code, see wiki
    address
    #logger.info address
  end

end
