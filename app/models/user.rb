class User < ApplicationRecord
    has_secure_password
    has_many :contacts

    validates :first_name, :last_name, presence: true
    validates :email, presence: true, uniqueness: true
    # validates_with EmailAddress::ActiveRecordValidator, field: :email
    validates :password, presence: true, length: { minimum: 8 }, format: { with: /\A(?=.*[A-Z])(?=.*[\W_])/, message: "must include at least one capital letter and one symbol" }, on: :create

    enum role: {
        'Admin': 1,
        'Teacher': 2,
        'Student': 3
    }

    enum track: {
        'Frontend': 1,
        'Backend': 2,
    }
end
