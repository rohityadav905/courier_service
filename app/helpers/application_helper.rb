module ApplicationHelper
	def users
		@users = User.all.map{|user| [user.name_with_address, user.id]}
	end

	def service_types
		 @service_types = ServiceType.all.map{|service_type| [service_type.name, service_type.id]}
	end
end
