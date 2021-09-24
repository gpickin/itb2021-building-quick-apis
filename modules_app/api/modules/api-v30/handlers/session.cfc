/**
 * Manage Sessions API Handler
 *
 */
component extends="coldbox.system.RestHandler"{

	// DI
	property name="userService" inject="quickService:User@api-v30";


	function create( event, rc, prc ){
		token = jwtAuth().fromuser( userService.findOrFail( 2 ) );
		event.getResponse()
			.addMessage( "Token Created" )
			.setData( token );
	}

	function delete( event, rc, prc ){
		jwtAuth().logout();
		event.getResponse().setData( "Delete Session - Log Out" );
	}
}