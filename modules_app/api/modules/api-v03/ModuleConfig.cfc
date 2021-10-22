/**
 * An API module for SoapBox App
 */
component {

	// Module Properties
	this.title              = "soapbox-api-v03";
	this.author             = "Ortus Solutions";
	this.webURL             = "www.ortussolutions.com";
	this.description        = "API module for our SoapBox App";
	this.version            = "1.0.0";
	// If true, looks for views in the parent first, if not found, then in the module. Else vice-versa
	this.viewParentLookup   = true;
	// If true, looks for layouts in the parent first, if not found, then in module. Else vice-versa
	this.layoutParentLookup = true;
	// Module Entry Point
	this.entryPoint         = "api/v03";
	// Model Namespace
	this.modelNamespace     = "api-v03";
	// CF Mapping
	this.cfmapping          = "api-v03";
	// Auto-map models
	this.autoMapModels      = true;
	// Module Dependencies
	this.dependencies       = [];

	function configure() {
		// module settings - stored in modules.name.settings
		variables.settings = {};

		// Layout Settings
		variables.layoutSettings = { defaultLayout : "" };

		// Custom Declared Points
		variables.interceptorSettings = { customInterceptionPoints : "" };

		// Custom Declared Interceptors
		variables.interceptors = [];
	}

}
