/**
 * A cool TestingCenters entity
 */
component persistent="true" table="reservations" singleton extends="cborm.models.ActiveEntity"{

	// Primary Key
	property name="reservation_id" fieldtype="id" column="reservation_id" generator="native" setter="false";

	// Properties
	property name="first_name" ormtype="string";
	property name="last_name" ormtype="string";
	property name="exam_id" ormtype="integer";
	property name="testingcenter_id" ormtype="integer";
	property name="receipt_number" ormtype="string";
	

	// Validation
	this.constraints = {
		first_name = { required=true, alpha=true},
		last_name = { required=true, alpha=true},
		exam_id = { required=true, type="integer" },
		testingcenter_id = { required=true, type="integer" }
	};

	// Mementifier
	this.memento = {
		// An array of the properties/relationships to include by default
		defaultIncludes = [ "*" ],
		// An array of properties/relationships to exclude by default
		defaultExcludes = [],
		// An array of properties/relationships to NEVER include
		neverInclude = [],
		// A struct of defaults for properties/relationships if they are null
		defaults = {},
		// A struct of mapping functions for properties/relationships that can transform them
		mappers = {}
	};

	/**
	 * Constructor
	 */
	function init(){
		super.init( useQueryCaching="false" );
		return this;
	}

}

