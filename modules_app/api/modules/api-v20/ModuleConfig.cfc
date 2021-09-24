/**
 * An API module for SoapBox App
 */
component {

	// Module Properties
	this.title = "soapbox-api-v20";
	this.author = "Ortus Solutions";
	this.webURL = "www.ortussolutions.com";
	this.description = "API module for our SoapBox App";
	this.version = "1.0.0";
	// If true, looks for views in the parent first, if not found, then in the module. Else vice-versa
	this.viewParentLookup = true;
	// If true, looks for layouts in the parent first, if not found, then in module. Else vice-versa
	this.layoutParentLookup = true;
	// Module Entry Point
	this.entryPoint = "api/v20";
	// Model Namespace
	this.modelNamespace = "api-v20";
	// CF Mapping
	this.cfmapping = "api-v20";
	// Auto-map models
	this.autoMapModels = true;
	// Module Dependencies
	this.dependencies = [];

	function configure() {
		// module settings - stored in modules.name.settings
		variables.settings = {
			cbsecurity : {
				// Module Relocation when an invalid access is detected, instead of each rule declaring one.
				"invalidAuthenticationEvent"  : "api-v20:main.index",
				// Default Auhtentication Action: override or redirect when a user has not logged in
				"defaultAuthenticationAction" : "redirect",
				// Module override event when an invalid access is detected, instead of each rule declaring one.
				"invalidAuthorizationEvent"   : "api-v20:main.index",
				// Default invalid action: override or redirect when an invalid access is detected, default is to redirect
				"defaultAuthorizationAction"  : "redirect"
			}
		};

		// Layout Settings
		variables.layoutSettings = { defaultLayout: "" };

		// Custom Declared Points
		variables.interceptorSettings = { customInterceptionPoints: "" };

		// Custom Declared Interceptors
		variables.interceptors = [];
	}

}
