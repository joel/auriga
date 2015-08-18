class Users::InvitationsController < Devise::InvitationsController

  private

  # this is called when accepting invitation
  # should return an instance of resource class
  def accept_resource
    resource = resource_class.accept_invitation!(update_resource_params)

    Mongoid::Multitenancy.with_tenant(resource.invited_by.vault) do
      resource.vault = resource.invited_by.vault
      resource.save
    end

    resource
  end
end
