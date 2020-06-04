TARGET = $1
CD_ANSIBLE = cd ansible/${TARGET}
CD_SERVERSPEC = cd serverspec/${TARGET}

setup:
	@${CD_ANSIBLE} && \
	ansible-playbook playbooks/my-mac.yml

before-check:
	@${CD_SERVERSPEC} && \
	bundle update --bundler && \
	bundle install --path=vendor/bundle

check:
	@${CD_SERVERSPEC} && \
	bundle exec rake