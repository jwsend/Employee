export CLASSPATH=$JAVA_HOME/lib/tools.jar:/root/.m2/repository/org/apache/logging/log4j/log4j-jcl/2.5/log4j-jcl-2.5.jar
export CLASSPATH=$CLASSPATH:/root/.m2/repository/commons-logging/commons-logging/1.2/commons-logging-1.2.jar
export CLASSPATH=$CLASSPATH:/root/.m2/repository/org/apache/logging/log4j/log4j-api/2.5/log4j-api-2.5.jar
export CLASSPATH=$CLASSPATH:/root/.m2/repository/org/apache/logging/log4j/log4j-core/2.5/log4j-core-2.5.jar
export CLASSPATH=$CLASSPATH:/root/.m2/repository/org/springframework/spring-webmvc/4.2.4.RELEASE/spring-webmvc-4.2.4.RELEASE.jar
export CLASSPATH=$CLASSPATH:/root/.m2/repository/org/springframework/spring-beans/4.2.4.RELEASE/spring-beans-4.2.4.RELEASE.jar
export CLASSPATH=$CLASSPATH:/root/.m2/repository/org/springframework/spring-context/4.2.4.RELEASE/spring-context-4.2.4.RELEASE.jar
export CLASSPATH=$CLASSPATH:/root/.m2/repository/org/springframework/spring-aop/4.2.4.RELEASE/spring-aop-4.2.4.RELEASE.jar
export CLASSPATH=$CLASSPATH:/root/.m2/repository/aopalliance/aopalliance/1.0/aopalliance-1.0.jar
export CLASSPATH=$CLASSPATH:/root/.m2/repository/org/springframework/spring-core/4.2.4.RELEASE/spring-core-4.2.4.RELEASE.jar
export CLASSPATH=$CLASSPATH:/root/.m2/repository/org/springframework/spring-expression/4.2.4.RELEASE/spring-expression-4.2.4.RELEASE.jar
export CLASSPATH=$CLASSPATH:/root/.m2/repository/org/springframework/spring-web/4.2.4.RELEASE/spring-web-4.2.4.RELEASE.jar
export CLASSPATH=$CLASSPATH:

echo "$CLASSPATH"

java com.hybrid.SpringTest
