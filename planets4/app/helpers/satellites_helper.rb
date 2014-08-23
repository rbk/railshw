module SatellitesHelper

	def get_children_satellites
		@children = Satellite.where( parent_id: params[:id] )
	end
	def get_parent 
		me = Satellite.find( params[:id] )
		if ! me.parent_id.nil?
			parent = Satellite.find( me.parent_id )
			parent.name
		else
			"No Parent"
		end

	rescue
		"Parent with id #{me.parent_id} has been deleted"
	end

end
