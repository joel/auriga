def with_tenant(tenant)
  Mongoid::Multitenancy.with_tenant(tenant) { yield }
end
def assign_to_user(tenant, user)
  Mongoid::Multitenancy.with_tenant(tenant) do
    user.vault = tenant
    user.confirm
  end
end
def assign_to_goldbrick(tenant, goldbrick)
  Mongoid::Multitenancy.with_tenant(tenant) do
    goldbrick.vault = tenant
  end
end
