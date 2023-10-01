AdminUser.find_or_create_by!(email: "admin@example.com") do |admin_user|
  admin_user.password = "password"
  admin_user.password_confirmation = "password"
end

PaymentType.find_or_create_by!(name: "Full Payment (GHC 500)")
PaymentType.find_or_create_by!(name: "Partial Payment(GHC 100/m)")

PaymentMethod.find_or_create_by!(name: "Mobile Money")
PaymentMethod.find_or_create_by!(name: "Credit Card")