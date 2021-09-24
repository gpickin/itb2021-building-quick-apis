Component {

	function configure() {
		resources(
			resource = "users",
			handler = "users",
			parameterName = "userID",
			only = [ "index", "show", "create", "update", "delete" ]
		);

		get( "/", "main.index" );
	}

}