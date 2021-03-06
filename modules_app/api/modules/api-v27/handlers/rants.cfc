/**
 * Manage Rants API Handler
 *
 */
component extends="coldbox.system.RestHandler" {

	// DI
	property name="rantService" inject="quickService:Rant@api-v27";
	property name="userService" inject="quickService:User@api-v27";

	/**
	 * Display a list of Rants
	 */
	function index( event, rc, prc ) {
		event
			.getResponse()
			.setDataWithPagination(
				rantService
					.addSubselect( "username", "user.username" )
					.asMemento()
					.paginate( 1, 10 )
			);
	}

	/**
	 * Create a Rant
	 */
	function create( event, rc, prc ) {
		event.paramValue( "userID", "" );
		event.paramValue( "body", "" );
		var rant = getInstance( "Rant@api-v27" ).fill( { body : rc.body, userID : rc.userID } );
		validateOrFail( rant );
		var user = userService.findOrFail( rc.userID );
		rant.save();
		event.getResponse().setData( "Rant Created" );
	}

	/**
	 * Show a Rant
	 */
	function show( event, rc, prc ) {
		event.paramValue( "rantID", 0 );
		event.getResponse().setData( "Show a Rant" );
	}


	/**
	 * Update a Rant
	 */
	function update( event, rc, prc ) {
		event.paramValue( "rantID", 0 );
		event.paramValue( "body", "" );
		var rant = rantService.findOrFail( rc.rantID ).fill( { body : rc.body } );
		validateOrFail( rant );
		rant.save();
		event.getResponse().setData( "Rant Updated" );
	}

	/**
	 * Delete a Rant
	 */
	function delete( event, rc, prc ) secured {
		event.paramValue( "rantID", 0 );
		event.getResponse().setData( "Delete a Rant" );
	}

}
