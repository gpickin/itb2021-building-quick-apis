/**
 * Manage users API Handler
 *
 */
component extends="coldbox.system.RestHandler"{


	// DI
	property name="userService" inject="quickService:User@api-v09";


	/**
	 * Display a list of users
	 */
	function index( event, rc, prc ){
		event.getResponse().setData(
			userService
				.asMemento()
				.get()
		);
	}

	/**
	 * Create a users
	 */
	function create( event, rc, prc ) secured{
		event.getResponse().setData( "Create Users" );
	}

	/**
	 * Show a user
	 */
	function show( event, rc, prc ){
		event.paramValue( "userID", 0 );
		event.getResponse().setData(
			userService
				.findOrFail( rc.userID )
				.getMemento()
		);
	}


	/**
	 * Update a user
	 */
	function update( event, rc, prc ) secured{
		event.paramValue( "userID", 0 );
		event.getResponse().setData( "Update a User" );

	}

	/**
	 * Delete a user
	 */
	function delete( event, rc, prc ) secured{
		event.paramValue( "userID", 0 );
		event.getResponse().setData( "Delete a User" );
	}

}
