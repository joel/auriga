def create_vault
  _, operation = Vault::Create.run({ vault: attributes_for(:vault) })
  operation.model
end
def create_user(attributes=attributes_for(:user))
  _, operation = User::Create.run(user: attributes_for(:user))
  operation.model
end
