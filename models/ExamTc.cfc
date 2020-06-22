/**
 * A cool TestingCenters entity
 */
component persistent="true" table="examtcs" singleton extends="cborm.models.ActiveEntity"{

	// Primary Key
	property name="examtc_id" fieldtype="id" column="examtc_id" generator="native" setter="false";

	// Properties
	property name="exam_id" ormtype="integer";
	property name="testingcenter_id" ormtype="integer";
	property name="testingcenter_name" ormtype="string";
	

	// Validation
	this.constraints = {
		exam_id = { required=true},
		testingcenter_id = { required=true},
		testingcenter_name = { required=true}
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

