require 'rails_helper'

describe User do
  let(:vault_1) { create_vault }
  let(:vault_2) { create_vault }
  let(:user_1)  { create_user }
  let(:user_2)  { create_user }
  let(:user_3)  { create_user }

  before do
    assign(vault_1, user_1)
    assign(vault_2, user_2)
    assign(nil, user_3)
  end

  specify do
    with_tenant(vault_1) do
      expect(User.all.map(&:name)).to eql([user_1.name, user_3.name])
      expect(User.authorized.map(&:name)).to eql([user_1.name])
    end
    with_tenant(vault_2) do
      expect(User.all.map(&:name)).to eql([user_2.name, user_3.name])
      expect(User.authorized.map(&:name)).to eql([user_2.name])
    end
    with_tenant(nil) do
      expect(User.all.map(&:name)).to eql([user_1.name, user_2.name, user_3.name])
      expect(User.authorized.map(&:name)).to eql([user_3.name])
    end
  end
end
