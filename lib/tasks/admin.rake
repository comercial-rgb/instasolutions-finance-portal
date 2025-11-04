namespace :admin do
  desc "Cria um usuário admin"
  task :create, [:email, :password] => :environment do |_, args|
    email = args[:email] || "admin@example.com"
    pass  = args[:password] || SecureRandom.hex(10)
    u = User.find_or_initialize_by(email: email)
    u.password = pass
    u.role = 0 # 0 = admin, 1 = fornecedor
    u.save!
    puts "✅ Admin criado: #{email} / #{pass}"
  end
end
