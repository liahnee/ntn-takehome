/**
 * I am a new handler
 */
component{
	property name="examtcService" inject="entityService:ExamTc";
	// property name="async" inject="asyncManager@coldbox";
	
	// OPTIONAL HANDLER PROPERTIES
	this.prehandler_only 	= "";
	this.prehandler_except 	= "";
	this.posthandler_only 	= "";
	this.posthandler_except = "";
	this.aroundHandler_only = "";
	this.aroundHandler_except = "";
	// REST Allowed HTTP Methods Ex: this.allowedMethods = {delete='POST,DELETE',index='GET'}
	this.allowedMethods = {};

	any function index( event, rc, prc ){
		prc.allExamTcs= examTcService.getAll();
		return prc.allEexamTcs;
	};

	any function show( event, rc, prc ){
		prc.etcs = examtcService.findAllWhere(entityName="ExamTc", criteria={exam_id=rc.exam_id}).getMemento( includes="id" );
		return prc.etcs;
	};

	/**
	IMPLICIT FUNCTIONS: Uncomment to use

	function preHandler( event, rc, prc, action, eventArguments ){
	}
	function postHandler( event, rc, prc, action, eventArguments ){
	}
	function aroundHandler( event, rc, prc, targetAction, eventArguments ){
		// executed targeted action
		arguments.targetAction( event );
	}
	function onMissingAction( event, rc, prc, missingAction, eventArguments ){
	}
	function onError( event, rc, prc, faultAction, exception, eventArguments ){
	}
	function onInvalidHTTPMethod( event, rc, prc, faultAction, eventArguments ){
	}
	*/

}


