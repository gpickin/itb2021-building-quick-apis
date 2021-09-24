component extends="coldbox.system.RestHandler"{

	function index( event, rc, prc ){
		event.getResponse().setData( "Welcome to SoapBox API - v03" );
	}
}