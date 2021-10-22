/**
 * Main Handler in API Module
 */
component extends="coldbox.system.RestHandler" {

	function index( event, rc, prc ) {
		event.getResponse().setData( "Welcome to SoapBox API - V01" );
	}

}
