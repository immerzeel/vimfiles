BUNDLE_DIR = bundle

clean:
	@@print Clean $(JS_ENGINE) $(COMPILER) $(POST_COMPILER)

install:
	@@print Install

pull:
	@@echo Pulling origin and updating the submodules.
	@@git pull
	@@git submodule update --init

push:
	@@echo Committing th changes and pushing it to origin.
	git add .
	git commit -a
	git push

#.PHONY clean install pull push
