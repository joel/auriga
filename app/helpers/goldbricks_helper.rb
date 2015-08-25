module GoldbricksHelper

  def new_goldbrick
    return current_vault.goldbricks.new if Rails.env.production?

    name = ['Facebook', 'Twitter', 'Linkedin', 'Github'].sample
    current_vault.goldbricks.new({
      name:     name,
      link:     "http://www.#{name.downcase}.com",
      login:    "#{name.downcase}@example.com",
      password: Faker::Internet.password(10, 20),
      content:  "#{name} account",
    })
  end
end
