VERSION = 0.1.1
SRC = chef-handler-serverspec.gemspec

gem: $(SRC)
	chef exec rspec
	VERSION=$(VERSION) gem build $<
	cp *.gem test/test-handler/files/default/

clean:
	rm *.gem

.PHONY: gem
