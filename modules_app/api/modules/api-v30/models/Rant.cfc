/**
 * Rant Quick Entity
 */
component extends="quick.models.BaseEntity" accessors="true" {

	property name="id"           type="string";
	property name="body"         type="string";
	property name="createdDate"  type="date";
	property name="modifiedDate" type="date";
	property name="userID"       type="string";

	this.constraints = {
		body   : { required : true },
		userID : { required : true, type : "numeric" }
	};

	function user() {
		return hasOne( "User@api-v30", "id", "userID" );
	}

}
