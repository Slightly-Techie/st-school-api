AdminUser.find_or_create_by!(email: "admin@example.com") do |admin_user|
  admin_user.password = "password"
  admin_user.password_confirmation = "password"
end

PaymentType.find_or_create_by!(name: "Full")
PaymentType.find_or_create_by!(name: "Part")

PaymentMethod.find_or_create_by!(name: "Mobile Money")
PaymentMethod.find_or_create_by!(name: "Credit Card")

frontend = Stack.find_or_create_by!(name: "Frontend")
backend = Stack.find_or_create_by!(name: "Backend")

StackOption.find_or_create_by!(name: "React", stack: frontend)
StackOption.find_or_create_by!(name: "Node", stack: backend)
StackOption.find_or_create_by!(name: "Python", stack: backend)



