# checks the config file for syntax
validate:
	@packer validate ami-spec.json

# ensures AWS pre-requisites are satisfied
prepare:
	@test -f ./private/sec-group.json || ./resources/create_builder_security_group.sh

# Build the image without interactive prompts
build: prepare validate
	$(eval INLINE_VARS := --var 'builder_security_group_id=$(shell jq --raw-output .SecurityGroups[0].GroupId ./private/sec-group.json)')
	@packer build $(INLINE_VARS) ami-spec.json

# Build the image but use packer debug mode to allow interactive with builder instance
build-debug: prepare validate
	$(eval INLINE_VARS := --var 'builder_security_group_id=$(shell jq --raw-output .SecurityGroups[0].GroupId ./private/sec-group.json)')
	@packer build -debug $(INLINE_VARS) ami-spec.json

run_instance:
	aws ec2 run-instances --image-id

# resets all stateful resources
reset:
	@rm -f -f ./private/sec-group.json
