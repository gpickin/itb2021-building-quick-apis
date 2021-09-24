/**
 * Manage Rants API Handler
 *
 */
component extends="coldbox.system.RestHandler"{


	// DI
	property name="rantService" inject="quickService:Rant@api-v25";
	property name="userService" inject="quickService:User@api-v25";

	/**
	 * Display a list of Rants
	 */
	function index( event, rc, prc ){
		event.getResponse().setDataWithPagination(
			rantService
				.addSubselect( "username", "user.username")
				.asMemento()
				.paginate(1,10)
		);
	}

	/**
	 * Create a Rant
	 */
	function create( event, rc, prc ){
		event.paramValue( "userID", "" );
		event.paramValue( "body", "" );
		var validationResult = validate(
            target      = rc,
            constraints = { body : { required : true } }
        )
        if ( !validationResult.hasErrors() ) {
			userService
				.findOrFail( rc.userID )
				.rants()
				.create(
					{
						body: rc.body
					}
				);
			event.getResponse().setData( "Rant Created" );
		} else {
			event.getResponse()
                .setError( true )
                .addMessage( validationResult.getAllErrors() )
                .setStatusCode( 400 )
                .setStatusText( "Validation error" );
		}
	}

	/**
	 * Show a Rant
	 */
	function show( event, rc, prc ){
		event.paramValue( "rantID", 0 );
		event.getResponse().setData( "Show a Rant");
	}


	/**
	 * Update a Rant
	 */
	function update( event, rc, prc ) secured{
		event.paramValue( "rantID", 0 );
		event.getResponse().setData( "Update a Rant" );

	}

	/**
	 * Delete a Rant
	 */
	function delete( event, rc, prc ) secured{
		event.paramValue( "rantID", 0 );
		event.getResponse().setData( "Delete a Rant" );
	}

}
