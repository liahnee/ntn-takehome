/**
 * I am a new handler
 */
component{

	property name="resService" inject="entityService:Reservation";

	property name="examService" inject="entityService:Exam";
	property name="tcService" inject="entityService:TestingCenter";
	
	// OPTIONAL HANDLER PROPERTIES
	this.prehandler_only 	= "";
	this.prehandler_except 	= "";
	this.posthandler_only 	= "";
	this.posthandler_except = "";
	this.aroundHandler_only = "";
	this.aroundHandler_except = "";
	// REST Allowed HTTP Methods Ex: this.allowedMethods = {delete='POST,DELETE',index='GET'}
	this.allowedMethods = {};

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

	/**
	 * index
	 */
	function index( event, rc, prc ){
		event.setView( "reservations/index" );
	}

	/**
	 * create
	 */
	function create( event, rc, prc ){
		// exam = getInstance( "Exam" ).getOrFail( rc.exam_id ?: -1 );
		// tc = getInstance( "TestingCenter" ).getOrFail( rc.testingcenter_id ?: -1 );

		receipt_number = generateSecretKey("AES");
		res = resService
			.new({
				first_name: rc.first_name,
				last_name: rc.last_name,
				exam_id: LSParseNumber(rc.exam_id),
				testingcenter_id: LSParseNumber(rc.testingcenter_id),
				receipt_number = receipt_number
			})
		prc.reservation = resService.save( res );
		prc.res.exam = examService.get( prc.reservation.exam_id ?: 0 ).name
		prc.res.tc = tcService.get( prc.reservation.testingcenter_id ?: 0 ).name
	}

	/**
	 * show
	 */
	function show( event, rc, prc ){
		event.setView( "reservations/show" );
	}

	/**
	 * update
	 */
	function update( event, rc, prc ){
		event.setView( "reservations/update" );
	}

	/**
	 * delete
	 */
	function delete( event, rc, prc ){
		event.setView( "reservations/delete" );
	}



}
