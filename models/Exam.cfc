/**
 * A cool Exam entity
 */
component persistent="true" table="exams" singleton extends="cborm.models.ActiveEntity"{

	// Primary Key
	property name="exam_id" fieldtype="id" column="exam_id" generator="native" setter="false";

	// Properties
	property name="name" ormtype="string";
	

	// property name="wirebox" inject="wirebox" persistent="false";

	
	// Validation
	this.constraints = {
		name = { required=true }
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

	// function getName() {
	// 	return this.name;
	// }
	// function getExamId() {
	// 	return this.exam_id;
	// }
}

