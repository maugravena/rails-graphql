run-docker:
	@docker run -it --rm --network onboarding_net --name rails-graphql -p 9999:9999 -v $(PWD):/opt/app rails-graphql sh

server:
	@docker run -it --rm --network onboarding_net --name rails-graphql -p 9999:9999 -v $(PWD):/opt/app rails-graphql rails s -b 0.0.0.0 -p 9999
