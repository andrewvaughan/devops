# Makefile
#
# Provides various functionality calls for the Ansible playbook. Optionally, parameters can be added to the call by
# separating variables with `--`. For example:
#
# ```bash
# make ping -- -vvv
# ```
#
# @author Andrew Vaughan <hello@andrewvaughan.io>
# @since  0.1.0


#
# Runs the entire playbook
#
all:
	@echo "Running full playbook...\n"
	@ansible-playbook $(filter-out $@,$(MAKECMDGOALS)) playbook.yml


#
# Pings all of the hosts to test connections - note the `test@LICENSE` bit is to address this issue in Ansible:
# https://github.com/ansible/ansible/issues/52898
#
ping:
	@echo "Attempting to ping all hosts...\n"

	@ANSIBLE_VAULT_IDENTITY_LIST="test@LICENSE" \
		ansible all -m ping $(filter-out $@,$(MAKECMDGOALS))


#
# Ignore any command that isn't explicitly listed - allows for using arguments
#
%:
	@:


#
# Cleans the environment, removing any temporary, cache, and log files
#
clean:
	@echo "Removing temporary files...\n"
	@find . -name "*.retry" -delete
	@find . -name "*.py[oc]" -delete
	@find . -name "__pycache__" -delete
	@rm *.log


.PHONY : all ping clean
