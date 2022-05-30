class Supplier < ApplicationRecord
  validates :corporate_name, :brand_name, :registration_number, :email, presence: true
  validates :registration_number, uniqueness: true
  validates :registration_number, length: {is: 13, wrong_length: "deve ter 13 caracteres"}
  validates :registration_number, numericality: {only_integer: true, message: "deve conter apenas números"}
end
