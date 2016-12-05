tc7user = node["tomcat7"]["user"]
tc7group = node["tomcat7"]["group"]
=begin
application "ServletDBLog4jExample" do
  path "/var/lib/tomcat/webapps"
  owner "#{tc7user}"
  group "#{tc7group}"
  repository "https://github.com/rashisha/tomcat/tree/master/files/default/ServletDBLog4jExample.war"
  revision "does this matter"
  java_webapp do
    war "ServletDBLog4jExample.war"
  end
  tomcat
end
=end

application 'ServletDBLog4jExample' do 
  path '/var/lib/tomcat/webapps'
  repository '/tmp/ServletDBLog4jExample.war'  
  owner "#{tc7user}"
  group "#{tc7group}"
  revision '1.0.0'
  scm_provider Chef::Provider::File::Deploy
  

  # Handles war specifics and creates the `context.xml`
  java_webapp 
  tomcat # Symlinks the context.xml into $CATALINA_HOME
end
=begin
deploy "ServletDBLog4jExample" do
  # Use a local repo if you prefer
  repo '/path/to/gitrepo/typo/'
  deploy_to '/var/lib/tomcat/webapps'
  action :deploy
  restart_command 'touch tmp/restart.txt'
  create_dirs_before_symlink  %w{test}
end
=end