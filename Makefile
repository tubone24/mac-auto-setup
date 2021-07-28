TARGET = $1
CD_ANSIBLE = cd ansible/${TARGET}
CD_SERVERSPEC = cd serverspec/${TARGET}

install-ansible:
	brew install ansible

setup:
	@${CD_ANSIBLE} && \
	ansible-playbook playbooks/my-mac.yml

setup-devtools:
	@${CD_ANSIBLE} && \
	ansible-playbook playbooks/dev-tools.yml

setup-native-apps:
	@${CD_ANSIBLE} && \
	ansible-playbook playbooks/native-apps.yml

before-check:
	@${CD_SERVERSPEC} && \
	bundle update --bundler && \
	bundle install --path=vendor/bundle

check:
	@${CD_SERVERSPEC} && \
	bundle exec rake