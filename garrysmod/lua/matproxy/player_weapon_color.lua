
matproxy.Add( {
	name = "PlayerWeaponColor",

	init = function( self, mat, values )

		self.ResultTo = values.resultvar

	end,

	bind = function( self, mat, ent )

		if ( !IsValid( ent ) ) then return end
                
		--Collects weapon owner value from ent and binds it to local variable
		local owner = ent:GetOwner()
			
		--Checks if weapon's owner is a player or valid owner
		if ( !IsValid( owner ) or !owner:IsPlayer() ) then return end
		--gets the weapon color as a local varible
		local col = owner:GetWeaponColor()
		--Checks if the stored property is a vector
		if ( !isvector( col ) ) then return end
		
		--Creates local variable used to modify color
		local mul = ( 1 + math.sin( CurTime() * 5 ) ) * 0.5
		--modifues color based on CurTime()
		mat:SetVector( self.ResultTo, col + col * mul )

	end
} )
