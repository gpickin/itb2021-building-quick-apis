/**
 * Generate API Docs
 */
component{

	function init(){
		variables.util 		= shell.getUtil();
		variables.root 		= getCWD();
		variables.outputDir = variables.root & "/workbench/apidocs";

		// Cleanup
		if( directoryExists( variables.outputDir ) ){
			directoryDelete( variables.outputDir, true );
		}

		variables.util
			.addMapping( '/soapbox-api',		variables.root )
			.addMapping( '/coldbox', 		    '#variables.root#/coldbox' )
			.addMapping( '/quick', 		    '#variables.root#/modules/quick' )
			.addMapping( '/api', 		        '#variables.root#/modules_app/api' );

	}

	function run(){
		print.blueLine( "Generating Docs..." ).toConsole();

		command( "docbox generate" )
			.params(
				"mappings:soapbox-api.models" 	= variables.root & "/models",
				"mappings:soapbox-api.modules_app" 	= variables.root & "/modules_app",
				"strategy-projectTitle"	= 'SoapBox-API',
				"strategy-outputdir" 	= variables.outputDir
			)
			.run();

		print.greenLine( "API Docs completed and can be found at: #variables.outputDir#" ).toConsole();
	}

}