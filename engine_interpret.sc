Engine_Interpret : CroneEngine {

	alloc {
		this.addCommand(\interpret, "s", { |m|
		  var k = m[1].asString.compile.();
		  postf("interpreter -> %\n", k);""
		});
	}
	
}