/**
 * User Quick Entity
 */
component extends="quick.models.BaseEntity" accessors="true" {

	property name="id"       type="string";
	property name="username" type="string";
	property name="email"    type="string";
	property name="password" type="string";

	this.memento = {
		defaultIncludes : [ "username", "email" ],
		neverInclude    : [ "password" ]
	}

	function scopewhereUsernameLike( qb, filter ) {
		qb.where( "username", "like", "%#filter#%" )
	}

	function rants() {
		return hasMany( "Rant@api-v30", "userID", "id" );
	}

	/**
	 * A struct of custom claims to add to the JWT token
	 */
	struct function getJWTCustomClaims() {
		return {};
	}

	/**
	 * This function returns an array of all the scopes that should be attached to the JWT token that will be used for authorization.
	 */
	array function getJWTScopes() {
		return [];
	}

	public User function retrieveUserByUsername( required string username ) {
		return newEntity().where( "username", arguments.username ).firstOrFail();
	}

	public User function retrieveUserById( required numeric id ) {
		return newEntity().findOrFail( arguments.id );
	}

}
