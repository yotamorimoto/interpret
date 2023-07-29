Engine_Interpret : CroneEngine {

	var group, addr;

	*new { |context, doneCallback| ^super.new(context, doneCallback) }

	alloc {
		this.addCommand(\interpret, "s", { |m|
		  var k = m[1].asString.compile.();
		  postf("interpreter -> %\n", k);""
		});
	}
}