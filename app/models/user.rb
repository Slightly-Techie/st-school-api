class User < ApplicationRecord
    has_secure_password
    

    validates :first_name, :last_name, presence: true
    validates :email, presence: true, uniqueness: true
    validates_with EmailAddress::ActiveRecordValidator, field: :email
    validates :password, presence: true, length: { minimum: 8 }, format: { with: /\A(?=.*[A-Z])(?=.*[\W_])/, message: "must include at least one capital letter and one symbol" }, on: :create

    after_create :set_amount

    def set_amount
        if payment_type == "Full Payment (GHC 500)"
            self.amount = 500
        elsif payment_type == "Partial Payment(GHC 100/m)"
            self.amount = 100
        end

        save!
    end

end
