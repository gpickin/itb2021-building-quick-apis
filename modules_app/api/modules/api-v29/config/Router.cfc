Component {

	function configure() {
		get( "/users/:userID/rants", "userRants.index" );
		resources(
			resource = "users",
			handler = "users",
			parameterName = "userID",
			only = [ "index", "show", "create", "update", "delete" ]
		);
		resources(
			resource = "rants",
			handler = "rants",
			parameterName = "rantID",
			only = [ "index", "show", "create", "update", "delete" ]
		);

		get( "/", "main.index" );
	}

}