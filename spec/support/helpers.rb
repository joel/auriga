def with_tenant(tenant)
  Mongoid::Multitenancy.with_tenant(tenant) { yield }
end
def assign(tenant, user)
  Mongoid::Multitenancy.with_tenant(tenant) do
    user.vault = tenant
    user.confirm
  end
end
