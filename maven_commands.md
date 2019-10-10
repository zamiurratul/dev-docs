## Install 3rd Party JAR

#### Format
`> mvn install:install-file -Dfile=c:\kaptcha-{version}.jar -DgroupId=com.google.code -DartifactId=kaptcha -Dversion={version} -Dpackaging=jar`
`> mvn install:install-file -Dfile=c:\spring-security-oauth2-2.3.6.RELEASE.jar -DgroupId=org.springframework.security.oauth -DartifactId=spring-security-oauth2 -Dversion=2.3.6.RELEASE -Dpackaging=jar
#### Example (Oracle JDBC)
`mvn install:install-file -Dfile=/src/main/webapp/WEB-INF/lib/oracle-ojdbc6-11.2.0.3.jar -DgroupId=com.oracle -DartifactId=oracle-ojdbc6 -Dversion=11.2.0.3 -Dpackaging=jar`