/**
 * Manage User Rants API Handler
 *
 */
component extends="coldbox.system.RestHandler"{


	// DI
	property name="userService" inject="quickService:User@api-v23";
	property name="rantService" inject="quickService:Rant@api-v23";


	/**
	 * Display a list of users
	 */
	function index( event, rc, prc ){
		event.paramValue( "userID", "" );
		event.paramValue( "page", 1 );
		event.paramValue( "per_page", 10 );
		event.getResponse().setDataWithPagination(
			rantService
				.where( "userID", rc.userID )
				.orderBy( "createdDate", "desc" )
				.asMemento()
				.paginate( rc.page, rc.per_page )
		);
	}
}