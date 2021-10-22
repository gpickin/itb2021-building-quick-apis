/**
 * Manage Rants API Handler
 *
 */
component extends="coldbox.system.RestHandler" {

	// DI
	property name="rantService" inject="quickService:Rant@api-v17";

	/**
	 * Display a list of Rants
	 */
	function index( event, rc, prc ) {
		event.getResponse().setData( rantService.asMemento().get() );
	}

	/**
	 * Create a Rant
	 */
	function create( event, rc, prc ) secured {
		event.getResponse().setData( "Create Rant" );
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
	function update( event, rc, prc ) secured {
		event.paramValue( "rantID", 0 );
		event.getResponse().setData( "Update a Rant" );
	}

	/**
	 * Delete a Rant
	 */
	function delete( event, rc, prc ) secured {
		event.paramValue( "rantID", 0 );
		event.getResponse().setData( "Delete a Rant" );
	}

}
