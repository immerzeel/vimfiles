BUNDLE_DIR = bundle

clean:
	@@print Clean $(JS_ENGINE) $(COMPILER) $(POST_COMPILER)

install:
	@@print Install

lint:
