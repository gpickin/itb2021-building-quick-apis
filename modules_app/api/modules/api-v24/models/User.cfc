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
		return hasMany( "Rant@api-v24", "userID", "id" );
	}

}
