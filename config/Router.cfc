component{

	function configure(){
		// Set Full Rewrites
		setFullRewrites( true );

		route( ":handler/:action?" ).end();

	}
}