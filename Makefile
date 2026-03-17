boltplan:
	bolt plan run d::nginx -t webserva --modulepath site
puppetapply:
	puppet apply site/profile/manifests/nginx.pp -e 'include profile::nginx' --environmentpath=/root --environment=puppet
