class Actionfolder < ApplicationRecord

    validates :folder , uniqueness: true
    validates_presence_of :folder, :lawyer

end
