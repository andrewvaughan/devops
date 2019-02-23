
#
# Pings all of the hosts to test connections
#
ping:
	ansible all -m ping


#
# Cleanup
#
clean:
	find . -name "*.retry" -delete
	find . -name "*.py[oc]" -delete
	find . -name "__pycache__" -delete
	rm *.log


.PHONY : ping clean
