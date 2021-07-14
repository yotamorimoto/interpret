Engine_Interpret : CroneEngine {

	var group;

	*new { |context, doneCallback| ^super.new(context, doneCallback) }

	alloc {
		group = ParGroup.tail(context.xg);

		this.addCommand(\interpret, "s", { |m|
		  m[1].asString.compile.();
		});
	}
	// free { context.server.freeAll }
}