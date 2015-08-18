client_instance_one
client_instance_two

Mongoid::Multitenancy.with_tenant(client_instance) do
  article = Article.new(:title => 'New article 1')
  article.save # => <#Article _id: 50ca04b86c82bfc125000044, title: 'New blog', client_id: nil>

  # tenant needs to be set manually
  article.tenant = client_instance_one
  article.save # => <#Article _id: 50ca04b86c82bfc125000044, title: 'New blog', client_id: 50ca04b86c82bfc125000025>
end

Mongoid::Multitenancy.current_tenant = client_instance_one
Article.all.map(&:title) # => ['New article 1']

Mongoid::Multitenancy.current_tenant = nil
article = Article.new(:title => 'New article 2')
article.save
Article.all.map(&:title) # => ['New article 1', 'New article 2']

Mongoid::Multitenancy.current_tenant = client_instance_one
Article.all.map(&:title) # => ['New article 1', 'New article 2']

Mongoid::Multitenancy.current_tenant = client_instance_two
article.tenant = client_instance_two
article.save
Article.all.map(&:title) # => ['New article 2']

Mongoid::Multitenancy.current_tenant = client_instance_one
Article.all.map(&:title) # => ['New article 1', 'New article 2']
User.where(vault: Mongoid::Multitenancy.current_tenant).map(&:name)
# => ['New article 1']
