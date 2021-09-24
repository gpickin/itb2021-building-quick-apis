component extends="coldbox.system.RestHandler"{

	function index( event, rc, prc ){
		event.getResponse().setData( "Welcome to SoapBox API - v24" );
	}

		function onInvalidAuth( event, rc, prc ){
		event.getResponse()
			.setErrorMessage( "Invalid Authentication" )
			.setStatusCode( 401 );
	}

	function onInvalidAuthorization( event, rc, prc ){
		event.getResponse()
			.setErrorMessage( "Invalid Authorization" )
			.setStatusCode( 403 );
	}

}