/*
 Navicat Premium Data Transfer

 Source Server         : mysql
 Source Server Type    : MySQL
 Source Server Version : 50529
 Source Host           : localhost:3306
 Source Schema         : blog

 Target Server Type    : MySQL
 Target Server Version : 50529
 File Encoding         : 65001

 Date: 04/08/2020 14:40:46
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for article
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article`  (
  `aid` int(11) NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `title` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '标题',
  `text` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '正文',
  `newstime` datetime NOT NULL COMMENT '创建时间',
  `modifytime` datetime NOT NULL COMMENT '修改时间',
  `state` int(11) NOT NULL COMMENT '状态 0草稿 1发布',
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户id',
  `cid` int(11) NOT NULL COMMENT '分类id',
  `tags` text CHARACTER SET utf8 COLLATE utf8_bin NULL COMMENT '标签',
  `pageviews` int(11) NULL DEFAULT 0 COMMENT '浏览量',
  PRIMARY KEY (`aid`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `cid`(`cid`) USING BTREE,
  CONSTRAINT `article_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `userbase` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `article_ibfk_2` FOREIGN KEY (`cid`) REFERENCES `classify` (`cid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES (1, 'SpringBoot简介', 'Spring Boot 基于 Spring 开发，Spirng Boot 本身并不提供 Spring 框架的核心特性以及扩展功能，只是用于快速、敏捷地开发新一代基于 Spring 框架的应用程序。也就是说，它并不是用来替代 Spring 的解决方案，而是和 Spring 框架紧密结合用于提升 Spring 开发者体验的工具。Spring Boot 以**约定大于配置的核心思想**，默认帮我们进行了很多设置，多数 Spring Boot 应用只需要很少的 Spring 配置。同时它集成了大量常用的第三方库配置（例如 Redis、MongoDB、Jpa、RabbitMQ、Quartz 等等），Spring Boot 应用中这些第三方库几乎可以零配置的开箱即用，\n\n简单来说就是SpringBoot其实不是什么新的框架，它默认配置了很多框架的使用方式，就像maven整合了所有的jar包，spring boot整合了所有的框架 。\n\nSpring Boot 出生名门，从一开始就站在一个比较高的起点，又经过这几年的发展，生态足够完善，Spring Boot 已经当之无愧成为 Java 领域最热门的技术。\n\n**Spring Boot的主要优点：**\n\n- 为所有Spring开发者更快的入门\n- **开箱即用**，提供各种默认配置来简化项目配置\n- 内嵌式容器简化Web项目\n- 没有冗余代码生成和XML配置的要求', '2020-04-06 20:11:11', '2020-04-06 20:11:11', 1, '001', 1, 'JAVA,SpringBoot', 26);
INSERT INTO `article` VALUES (2, 'Shiro简介', 'Shiro不仅可以在javaSE环境使用，也可以在JavaEE环境使用。它有自己的Session\nShiro可以完成，认证，授权，加密，会话管理，Web集成，缓存等\n官网地址：http://shiro.apache.org/\nAuthentication：身份认证，登录，验证用户是不是拥有相应的身份\nAuthorization：授权，即权限验证，验证某个已认证的用户是否拥有某个权限，即判断用户是否能进行什么操作，如：验证某个用户是否拥有某个角色，或者验证某个用户对某个资源是否具有某个权限\nSession Management：会话管理，用户登录后就是第一次会话，在没有退出之前，他的所有信息都在会话中；会话可以是普通的JavaSE环境，也可以是WEB环境\nCryptography：机密，保护数据的安全性，如密码加密存储到数据库中，而不是明文存储\nWeb Support：web支持，可以非常容易的集成到web环境\nCaching：缓存，比如用户登录后，其用户信息，拥有的角色，权限不必每次去查，可以提高效率\nConcurrency：Shiro支持多线程应用的并发验证，即，如在一个线程中开启另一个线程，能把权限自动的传播过去\nTesting：提供测试支持\nRun As：允许一个用户假装为另一个用户的身份访问\nRemember Me：记住我，即一次登录后，下次不用登录', '2020-04-06 20:13:28', '2020-04-06 20:13:28', 1, '001', 1, 'shiro', 36);
INSERT INTO `article` VALUES (5, 'ssm整合答题系统', '在线答题系统，使用ssm整合框架开发的答题系统。前端ui框架bootstrap，接入第三方登录：qq，github，gitee，接入必应每日一图接口，获取历史图片\n\n**前端UI框架：bootstrap**\n\n**富文本编辑器：simditor**\n\n**第三方登录：QQ，GitHub，Gitee**\n\n**必应每日一图接口**\n\n**只展示相关配置详细业务代码见：https://github.com/beloved-zh/answer_ssm **\n\n# 1、开发环境\n\n- IDEA\n- MySql 5.5.29\n- Tomcat 8.5.28\n- Maven  3.5.4\n\n# 2、数据库环境\n\n**answer.sql**\n\n# 3、环境搭建\n\n> **创建maven-web项目。answer_ssm。修改web.xml头文件**\n>\n> **mvaen创建的web项目，生成的web.xml版本过低，需要手动修改高版本**\n\n```xml\n<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<web-app xmlns=\"http://xmlns.jcp.org/xml/ns/javaee\"\n         xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n         xsi:schemaLocation=\"http://xmlns.jcp.org/xml/ns/javaee http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd\"\n         version=\"4.0\">\n\n</web-app>\n```\n\n> **导入ssm基础依赖**\n\n```xml\n<!--依赖：junit，数据库驱动，连接池，servlet，jsp，mybatis，mybatis-spring,spring-->\n<dependencies>\n  <!--Junit-->\n  <dependency>\n    <groupId>junit</groupId>\n    <artifactId>junit</artifactId>\n    <version>4.12</version>\n  </dependency>\n  <!--数据库驱动-->\n  <dependency>\n    <groupId>mysql</groupId>\n    <artifactId>mysql-connector-java</artifactId>\n    <version>5.1.47</version>\n  </dependency>\n  <!-- 数据库连接池 c3p0 -->\n  <dependency>\n    <groupId>com.mchange</groupId>\n    <artifactId>c3p0</artifactId>\n    <version>0.9.5.2</version>\n  </dependency>\n\n  <!--Servlet - JSP -->\n  <dependency>\n    <groupId>javax.servlet</groupId>\n    <artifactId>servlet-api</artifactId>\n    <version>2.5</version>\n  </dependency>\n  <dependency>\n    <groupId>javax.servlet.jsp</groupId>\n    <artifactId>jsp-api</artifactId>\n    <version>2.2</version>\n  </dependency>\n  <dependency>\n    <groupId>javax.servlet</groupId>\n    <artifactId>jstl</artifactId>\n    <version>1.2</version>\n  </dependency>\n  <!--Mybatis-->\n  <dependency>\n    <groupId>org.mybatis</groupId>\n    <artifactId>mybatis</artifactId>\n    <version>3.5.2</version>\n  </dependency>\n  <dependency>\n    <groupId>org.mybatis</groupId>\n    <artifactId>mybatis-spring</artifactId>\n    <version>2.0.2</version>\n  </dependency>\n\n  <!--Spring-->\n  <dependency>\n    <groupId>org.springframework</groupId>\n    <artifactId>spring-webmvc</artifactId>\n    <version>5.1.9.RELEASE</version>\n  </dependency>\n  <dependency>\n    <groupId>org.springframework</groupId>\n    <artifactId>spring-jdbc</artifactId>\n    <version>5.1.9.RELEASE</version>\n  </dependency>\n  <!--lombok-->\n  <dependency>\n    <groupId>org.projectlombok</groupId>\n    <artifactId>lombok</artifactId>\n    <version>1.18.8</version>\n  </dependency>\n  <!--aop织入-->\n  <dependency>\n    <groupId>org.aspectj</groupId>\n    <artifactId>aspectjweaver</artifactId>\n    <version>1.9.4</version>\n  </dependency>\n</dependencies>\n```\n\n> **其余扩展依赖**\n\n```xml\n<!--json-->\n<dependency>\n  <groupId>com.alibaba</groupId>\n  <artifactId>fastjson</artifactId>\n  <version>1.2.60</version>\n</dependency>\n<!--文件上传-->\n<dependency>\n  <groupId>commons-fileupload</groupId>\n  <artifactId>commons-fileupload</artifactId>\n  <version>1.3.3</version>\n</dependency>\n<!--servlet-api导入高版本的-->\n<dependency>\n  <groupId>javax.servlet</groupId>\n  <artifactId>javax.servlet-api</artifactId>\n  <version>4.0.1</version>\n</dependency>\n\n<!-- dom4j解析xml数据 -->\n<dependency>\n  <groupId>dom4j</groupId>\n  <artifactId>dom4j</artifactId>\n  <version>1.6.1</version>\n</dependency>\n\n<!--java代码发送请求依赖包-->\n<dependency>\n  <groupId>org.apache.httpcomponents</groupId>\n  <artifactId>httpclient</artifactId>\n  <version>4.5.6</version>\n</dependency>\n\n<!--邮件发送-->\n<!-- https://mvnrepository.com/artifact/javax.mail/javax.mail-api -->\n<dependency>\n  <groupId>javax.mail</groupId>\n  <artifactId>javax.mail-api</artifactId>\n  <version>1.6.2</version>\n</dependency>\n<dependency>\n  <groupId>com.sun.mail</groupId>\n  <artifactId>javax.mail</artifactId>\n  <version>1.6.2</version>\n</dependency>\n<!-- https://mvnrepository.com/artifact/javax.activation/activation -->\n<dependency>\n  <groupId>javax.activation</groupId>\n  <artifactId>activation</artifactId>\n  <version>1.1.1</version>\n</dependency>\n```\n\n> **配置静态资源过滤**\n\n```xml\n<!--静态资源过滤-->\n<build>\n  <resources>\n    <resource>\n      <directory>src/main/java</directory>\n      <includes>\n        <include>**/*.properties</include>\n        <include>**/*.xml</include>\n      </includes>\n      <filtering>false</filtering>\n    </resource>\n    <resource>\n      <directory>src/main/resources</directory>\n      <includes>\n        <include>**/*.properties</include>\n        <include>**/*.xml</include>\n      </includes>\n      <filtering>false</filtering>\n    </resource>\n  </resources>\n</build>\n```\n\n> **建立项目基本结构和框架配置**\n\n- com.zh.pojo\n\n- com.zh.mapper\n\n- com.zh.service\n\n- com.zh.controller\n\n- mybatis-config.xml\n\n  ```xml\n  <?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n  <!DOCTYPE configuration\n          PUBLIC \"-//mybatis.org//DTD Config 3.0//EN\"\n          \"http://mybatis.org/dtd/mybatis-3-config.dtd\">\n  <configuration>\n  \n  </configuration>\n  ```\n\n- applicationContext.xml\n\n  ```xml\n  <?xml version=\"1.0\" encoding=\"UTF-8\"?>\n  <beans xmlns=\"http://www.springframework.org/schema/beans\"\n         xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n         xsi:schemaLocation=\"http://www.springframework.org/schema/beans\n          http://www.springframework.org/schema/beans/spring-beans.xsd\">\n  \n  </beans>\n  ```\n\n# 4、整合SpringMvc\n\n## 4.1、web.xml相关配置\n\n```xml\n<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<web-app xmlns=\"http://xmlns.jcp.org/xml/ns/javaee\"\n         xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n         xsi:schemaLocation=\"http://xmlns.jcp.org/xml/ns/javaee\n         http://xmlns.jcp.org/xml/ns/javaee/web-app_4_0.xsd\"\n         version=\"4.0\">\n    <!--DispatcherServlet-->\n    <servlet>\n        <servlet-name>springmvc</servlet-name>\n        <servlet-class>org.springframework.web.servlet.DispatcherServlet</servlet-class>\n        <init-param>\n            <param-name>contextConfigLocation</param-name>\n            <param-value>classpath:applicationContext.xml</param-value>\n        </init-param>\n        <load-on-startup>1</load-on-startup>\n    </servlet>\n    <servlet-mapping>\n        <servlet-name>springmvc</servlet-name>\n        <url-pattern>/</url-pattern>\n    </servlet-mapping>\n\n    <!--乱码过滤-->\n    <filter>\n        <filter-name>encodingFilert</filter-name>\n        <filter-class>org.springframework.web.filter.CharacterEncodingFilter</filter-class>\n        <init-param>\n            <param-name>encoding</param-name>\n            <param-value>utf-8</param-value>\n        </init-param>\n    </filter>\n    <filter-mapping>\n        <filter-name>encodingFilert</filter-name>\n        <url-pattern>/*</url-pattern>\n    </filter-mapping>\n\n    <!--session超时时间-->\n    <session-config>\n        <session-timeout>15</session-timeout>\n    </session-config>\n\n</web-app>\n```\n\n## 4.2、Spring-mvc.xml\n\n```xml\n<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<beans xmlns=\"http://www.springframework.org/schema/beans\"\n       xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n       xmlns:mvc=\"http://www.springframework.org/schema/mvc\"\n       xmlns:context=\"http://www.springframework.org/schema/context\"\n       xsi:schemaLocation=\"http://www.springframework.org/schema/beans\n       http://www.springframework.org/schema/beans/spring-beans.xsd\n       http://www.springframework.org/schema/mvc\n       https://www.springframework.org/schema/mvc/spring-mvc.xsd\n       http://www.springframework.org/schema/context\n       https://www.springframework.org/schema/context/spring-context.xsd\">\n\n\n    <!--自动扫描指定的包，下面所有注解类交给IOC容器管理 -->\n    <context:component-scan base-package=\"com.zh.controller\"/>\n    <!--静态资源过滤-->\n    <mvc:default-servlet-handler/>\n    <!--json乱码问题-->\n    <mvc:annotation-driven>\n        <mvc:message-converters register-defaults=\"true\">\n            <ref bean=\"stringHttpMessageConverter\" />\n            <ref bean=\"fastJsonHttpMessageConverter\" />\n        </mvc:message-converters>\n    </mvc:annotation-driven>\n\n    <!--配置fastjson-->\n    <bean id=\"stringHttpMessageConverter\"\n          class=\"org.springframework.http.converter.StringHttpMessageConverter\">\n        <constructor-arg value=\"UTF-8\" index=\"0\"></constructor-arg>\n        <property name=\"supportedMediaTypes\">\n            <list>\n                <value>text/plain;charset=UTF-8</value>\n            </list>\n        </property>\n    </bean>\n    <bean id=\"fastJsonHttpMessageConverter\" class=\"com.alibaba.fastjson.support.spring.FastJsonHttpMessageConverter4\">\n        <property name=\"supportedMediaTypes\">\n            <list>\n                <value>text/html;charset=UTF-8</value>\n                <value>application/json;charset=UTF-8</value>\n            </list>\n        </property>\n        <property name=\"fastJsonConfig\">\n            <bean class=\"com.alibaba.fastjson.support.config.FastJsonConfig\">\n                <property name=\"features\">\n                    <list>\n                        <value>AllowArbitraryCommas</value>\n                        <value>AllowUnQuotedFieldNames</value>\n                        <value>DisableCircularReferenceDetect</value>\n                    </list>\n                </property>\n                <property name=\"dateFormat\" value=\"yyyy-MM-dd HH:mm:ss\"></property>\n            </bean>\n        </property>\n    </bean>\n\n    <!-- 视图解析器 -->\n    <bean class=\"org.springframework.web.servlet.view.InternalResourceViewResolver\"\n          id=\"internalResourceViewResolver\">\n        <!-- 前缀 -->\n        <property name=\"prefix\" value=\"/WEB-INF/views/\" />\n        <!-- 后缀 -->\n        <property name=\"suffix\" value=\".jsp\" />\n    </bean>\n\n\n    <!--\n        对静态资源的访问\n        mapping：url路径\n        location：本地路径\n    -->\n    <mvc:resources mapping=\"/static/**\" location=\"/static/\" />\n\n    <!--配置拦截器-->\n    <mvc:interceptors>\n        <mvc:interceptor>\n            <!--拦截所有请求-->\n            <mvc:mapping path=\"/**\"/>\n            <!--放行的请求-->\n            <mvc:exclude-mapping path=\"/index.jsp\"/>\n            <mvc:exclude-mapping path=\"/github/**\"/>\n            <mvc:exclude-mapping path=\"/gitee/**\"/>\n            <mvc:exclude-mapping path=\"/qq/**\"/>\n            <mvc:exclude-mapping path=\"/user/login/\"/>\n            <mvc:exclude-mapping path=\"/getImage\"/>\n            <mvc:exclude-mapping path=\"/favicon.ico\"/>\n            <!--放行静态资源请求-->\n            <mvc:exclude-mapping path=\"/static/**\"/>\n            <!--将拦截器注入到ioc容器-->\n            <bean class=\"com.zh.config.LoginInterceptor\"/>\n        </mvc:interceptor>\n    </mvc:interceptors>\n</beans>\n```\n\n**==注意：使用的json解析jar包不一样，配置文件中配置的json数据乱码也不一样。具体配置见：springmvc.md==**\n\n**==相关拦截器配置之后。一定要注意静态资源过滤问题==**\n\n# 5、整合mybatis\n\n## 5.1、数据库配置文件：database.properties\n\n```properties\njdbc.driver=com.mysql.jdbc.Driver\njdbc.url=jdbc:mysql://localhost:3306/answer?useUnicode=true&characterEncoding=utf8\njdbc.username=root\njdbc.password=123456\n```\n\n## 5.2、mybatis-config.xml\n\n```xml\n<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n<!DOCTYPE configuration\n        PUBLIC \"-//mybatis.org//DTD Config 3.0//EN\"\n        \"http://mybatis.org/dtd/mybatis-3-config.dtd\">\n<configuration>\n\n    <settings>\n        <!--日志打印-->\n        <setting name=\"logImpl\" value=\"STDOUT_LOGGING\"/>\n    </settings>\n\n    <!--别名-->\n    <typeAliases>\n        <package name=\"com.zh.pojo\"/>\n    </typeAliases>\n    \n</configuration>\n```\n\n## 5.3、spring-mybatis.xml\n\n```xml\n<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<beans xmlns=\"http://www.springframework.org/schema/beans\"\n       xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n       xmlns:context=\"http://www.springframework.org/schema/context\"\n       xsi:schemaLocation=\"http://www.springframework.org/schema/beans\n       http://www.springframework.org/schema/beans/spring-beans.xsd\n       http://www.springframework.org/schema/context\n       https://www.springframework.org/schema/context/spring-context.xsd\">\n    <!--==================数据源=============================-->\n    <!--1.关联数据库配置文件-->\n    <context:property-placeholder location=\"classpath:database.properties\"/>\n\n    <!--2.c3p0连接池-->\n    <bean id=\"dataSource\" class=\"com.mchange.v2.c3p0.ComboPooledDataSource\">\n        <property name=\"driverClass\" value=\"${jdbc.driver}\"/>\n        <property name=\"jdbcUrl\" value=\"${jdbc.url}\"/>\n        <property name=\"user\" value=\"${jdbc.username}\"/>\n        <property name=\"password\" value=\"${jdbc.password}\"/>\n\n        <!-- c3p0连接池的私有属性 -->\n        <property name=\"maxPoolSize\" value=\"30\"/>\n        <property name=\"minPoolSize\" value=\"10\"/>\n        <!-- 关闭连接后不自动commit -->\n        <property name=\"autoCommitOnClose\" value=\"false\"/>\n        <!-- 获取连接超时时间 -->\n        <property name=\"checkoutTimeout\" value=\"10000\"/>\n        <!-- 当获取连接失败重试次数 -->\n        <property name=\"acquireRetryAttempts\" value=\"2\"/>\n    </bean>\n\n    <!--=======================spring与mybatis的整合=============================-->\n    <!--3.sqlSessionFactory-->\n    <bean id=\"sqlSessionFactory\" class=\"org.mybatis.spring.SqlSessionFactoryBean\">\n        <!--数据源-->\n        <property name=\"dataSource\" ref=\"dataSource\"/>\n        <!--绑定mybatis配置文件-->\n        <property name=\"configLocation\" value=\"classpath:mybatis/mybatis-config.xml\"/>\n        <!--指定mybatis的mapper文件位置-->\n        <property name=\"mapperLocations\" value=\"classpath:mapper/*.xml\" />\n    </bean>\n\n    <!--4.配置mapper接口扫描包，动态实现了Mapper接口可以注入到spring容器中-->\n    <bean class=\"org.mybatis.spring.mapper.MapperScannerConfigurer\">\n        <!--注入sqlSessionFactory-->\n        <property name=\"sqlSessionFactoryBeanName\" value=\"sqlSessionFactory\"/>\n        <!--要扫描的mapper包-->\n        <property name=\"basePackage\" value=\"com.zh.mapper\"/>\n    </bean>\n\n</beans>\n```\n\n## 5.4、Mapper.xml\n\n```xml\n<?xml version=\"1.0\" encoding=\"UTF-8\" ?>\n<!DOCTYPE mapper\n        PUBLIC \"-//mybatis.org//DTD Mapper 3.0//EN\"\n        \"http://mybatis.org/dtd/mybatis-3-mapper.dtd\">\n\n<mapper namespace=\"com.zh.mapper.CourseMapper\">\n\n    <select id=\"findAll\" resultType=\"course\">\n        select * from course;\n    </select>\n\n</mapper>\n```\n\n# 6、整合service层\n\n```xml\n<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<beans xmlns=\"http://www.springframework.org/schema/beans\"\n       xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n       xmlns:tx=\"http://www.springframework.org/schema/tx\"\n       xmlns:aop=\"http://www.springframework.org/schema/aop\"\n       xmlns:context=\"http://www.springframework.org/schema/context\"\n       xsi:schemaLocation=\"http://www.springframework.org/schema/beans\n       http://www.springframework.org/schema/beans/spring-beans.xsd\n       http://www.springframework.org/schema/tx\n       http://www.springframework.org/schema/tx/spring-tx.xsd\n       http://www.springframework.org/schema/aop\n       https://www.springframework.org/schema/aop/spring-aop.xsd\n       http://www.springframework.org/schema/context\n       https://www.springframework.org/schema/context/spring-context.xsd\">\n\n    <!--扫描service层的包-->\n    <context:component-scan base-package=\"com.zh.service\" />\n\n    <!--=======================事务配置==================================-->\n    <!--声明式事务配置-->\n    <bean id=\"transactionManager\" class=\"org.springframework.jdbc.datasource.DataSourceTransactionManager\">\n        <!--注入数据源-->\n        <property name=\"dataSource\" ref=\"dataSource\"/>\n    </bean>\n    <!--aop事务支持-->\n    <!--结合aop实现事务的织入-->\n    <tx:advice id=\"txAdvice\" transaction-manager=\"transactionManager\">\n        <tx:attributes>\n            <tx:method name=\"*\" propagation=\"REQUIRED\"/>\n        </tx:attributes>\n    </tx:advice>\n    <!--配置事务切入-->\n    <aop:config>\n        <aop:pointcut id=\"txPointcut\" expression=\"execution(* com.zh.service.*.*(..))\"/>\n        <aop:advisor advice-ref=\"txAdvice\" pointcut-ref=\"txPointcut\"/>\n    </aop:config>\n</beans>\n```\n\n# 7、配置文件整合\n\n```xml\n<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n<beans xmlns=\"http://www.springframework.org/schema/beans\"\n       xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\"\n       xmlns:context=\"http://www.springframework.org/schema/context\"\n       xsi:schemaLocation=\"http://www.springframework.org/schema/beans\n       http://www.springframework.org/schema/beans/spring-beans.xsd\n       http://www.springframework.org/schema/context\n       https://www.springframework.org/schema/context/spring-context.xsd\">\n\n    <import resource=\"spring/spring-mvc.xml\"/>\n    <import resource=\"spring/spring-mybatis.xml\"/>\n    <import resource=\"spring/spring-service.xml\"/>\n\n    <context:component-scan base-package=\"com.zh.utils\"/>\n</beans>\n```\n\n**==最后在applicationContext.xml中引入相关的spring的配置文件==**\n\n# 8、必应每日一图接口处理\n\n后台发送http请求依赖的jar包\n\n```xml\n<!--java代码发送请求依赖包-->\n<dependency>\n  <groupId>org.apache.httpcomponents</groupId>\n  <artifactId>httpclient</artifactId>\n  <version>4.5.6</version>\n</dependency>\n```\n\n## **8.1、每日一图接口**', '2020-04-08 21:18:05', '2020-04-08 21:18:05', 1, '001', 1, 'JAVA', 14);

-- ----------------------------
-- Table structure for bingimage
-- ----------------------------
DROP TABLE IF EXISTS `bingimage`;
CREATE TABLE `bingimage`  (
  `bid` int(11) NOT NULL AUTO_INCREMENT COMMENT '图片id',
  `bname` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '图片介绍',
  `burl` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '图片地址',
  PRIMARY KEY (`bid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of bingimage
-- ----------------------------
INSERT INTO `bingimage` VALUES (1, '四月的满月从圣迈克尔山上升起，英国康沃尔', 'https://www.bing.com/th?id=OHR.PinkMoon_ZH-CN9026483067_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp');
INSERT INTO `bingimage` VALUES (2, '盛开的樱花和姬路城，日本姬路', 'https://www.bing.com/th?id=OHR.CastleDay_ZH-CN8752542375_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp');
INSERT INTO `bingimage` VALUES (3, '基西米湖中的绿色树蛙和紫色睡莲，佛罗里达州', 'https://www.bing.com/th?id=OHR.KissimmeeFrog_ZH-CN8379824947_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp');
INSERT INTO `bingimage` VALUES (4, '哀悼为抗击新冠肺炎牺牲的烈士和逝世的同胞', 'https://www.bing.com/th?id=OHR.QingmingCandle2020_ZH-CN2729283235_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp');
INSERT INTO `bingimage` VALUES (5, '维多利亚瀑布上的彩虹，赞比亚', 'https://www.bing.com/th?id=OHR.PlaceofRainbows_ZH-CN7878813025_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp');
INSERT INTO `bingimage` VALUES (6, '从庞塞德莱昂河口向灯塔望去，佛罗里达州', 'https://www.bing.com/th?id=OHR.PascuaFlorida_ZH-CN7720904158_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp');
INSERT INTO `bingimage` VALUES (7, '马拉克勒国家公园中一只隐身的chia象，南非林波波河', 'https://www.bing.com/th?id=OHR.ShyGuy_ZH-CN7391687938_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp');
INSERT INTO `bingimage` VALUES (8, '连接巴林托伊附近两处悬崖的Carrick-a-Rede索桥，北爱尔兰安特里姆', 'https://www.bing.com/th?id=OHR.CarrickSpring_ZH-CN7085146237_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp');
INSERT INTO `bingimage` VALUES (9, '连接巴林托伊附近两处悬崖的Carrick-a-Rede索桥，北爱尔兰安特里姆', 'https://www.bing.com/th?id=OHR.CarrickSpring_ZH-CN7085146237_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp');
INSERT INTO `bingimage` VALUES (10, '连接巴林托伊附近两处悬崖的Carrick-a-Rede索桥，北爱尔兰安特里姆', 'https://www.bing.com/th?id=OHR.CarrickSpring_ZH-CN7085146237_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp');
INSERT INTO `bingimage` VALUES (11, '连接巴林托伊附近两处悬崖的Carrick-a-Rede索桥，北爱尔兰安特里姆', 'https://www.bing.com/th?id=OHR.CarrickSpring_ZH-CN7085146237_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp');
INSERT INTO `bingimage` VALUES (12, '连接巴林托伊附近两处悬崖的Carrick-a-Rede索桥，北爱尔兰安特里姆', 'https://www.bing.com/th?id=OHR.CarrickSpring_ZH-CN7085146237_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp');
INSERT INTO `bingimage` VALUES (13, '连接巴林托伊附近两处悬崖的Carrick-a-Rede索桥，北爱尔兰安特里姆', 'https://www.bing.com/th?id=OHR.CarrickSpring_ZH-CN7085146237_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp');
INSERT INTO `bingimage` VALUES (14, '连接巴林托伊附近两处悬崖的Carrick-a-Rede索桥，北爱尔兰安特里姆', 'https://www.bing.com/th?id=OHR.CarrickSpring_ZH-CN7085146237_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp');
INSERT INTO `bingimage` VALUES (15, '连接巴林托伊附近两处悬崖的Carrick-a-Rede索桥，北爱尔兰安特里姆', 'https://www.bing.com/th?id=OHR.CarrickSpring_ZH-CN7085146237_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp');
INSERT INTO `bingimage` VALUES (16, '连接巴林托伊附近两处悬崖的Carrick-a-Rede索桥，北爱尔兰安特里姆', 'https://www.bing.com/th?id=OHR.CarrickSpring_ZH-CN7085146237_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp');
INSERT INTO `bingimage` VALUES (17, '连接巴林托伊附近两处悬崖的Carrick-a-Rede索桥，北爱尔兰安特里姆', 'https://www.bing.com/th?id=OHR.CarrickSpring_ZH-CN7085146237_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp');
INSERT INTO `bingimage` VALUES (18, '连接巴林托伊附近两处悬崖的Carrick-a-Rede索桥，北爱尔兰安特里姆', 'https://www.bing.com/th?id=OHR.CarrickSpring_ZH-CN7085146237_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp');
INSERT INTO `bingimage` VALUES (19, '连接巴林托伊附近两处悬崖的Carrick-a-Rede索桥，北爱尔兰安特里姆', 'https://www.bing.com/th?id=OHR.CarrickSpring_ZH-CN7085146237_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp');
INSERT INTO `bingimage` VALUES (20, '连接巴林托伊附近两处悬崖的Carrick-a-Rede索桥，北爱尔兰安特里姆', 'https://www.bing.com/th?id=OHR.CarrickSpring_ZH-CN7085146237_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp');
INSERT INTO `bingimage` VALUES (21, '连接巴林托伊附近两处悬崖的Carrick-a-Rede索桥，北爱尔兰安特里姆', 'https://www.bing.com/th?id=OHR.CarrickSpring_ZH-CN7085146237_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp');
INSERT INTO `bingimage` VALUES (22, '连接巴林托伊附近两处悬崖的Carrick-a-Rede索桥，北爱尔兰安特里姆', 'https://www.bing.com/th?id=OHR.CarrickSpring_ZH-CN7085146237_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp');
INSERT INTO `bingimage` VALUES (23, '连接巴林托伊附近两处悬崖的Carrick-a-Rede索桥，北爱尔兰安特里姆', 'https://www.bing.com/th?id=OHR.CarrickSpring_ZH-CN7085146237_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp');
INSERT INTO `bingimage` VALUES (24, '连接巴林托伊附近两处悬崖的Carrick-a-Rede索桥，北爱尔兰安特里姆', 'https://www.bing.com/th?id=OHR.CarrickSpring_ZH-CN7085146237_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp');
INSERT INTO `bingimage` VALUES (25, '连接巴林托伊附近两处悬崖的Carrick-a-Rede索桥，北爱尔兰安特里姆', 'https://www.bing.com/th?id=OHR.CarrickSpring_ZH-CN7085146237_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp');
INSERT INTO `bingimage` VALUES (26, '连接巴林托伊附近两处悬崖的Carrick-a-Rede索桥，北爱尔兰安特里姆', 'https://www.bing.com/th?id=OHR.CarrickSpring_ZH-CN7085146237_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp');
INSERT INTO `bingimage` VALUES (27, '圣托里尼岛鸟瞰图，希腊 (© Amazing Aerial Agency/Offset)', 'https://www.bing.com/th?id=OHR.SantoriniAerial_ZH-CN9367767863_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp');
INSERT INTO `bingimage` VALUES (28, '圣托里尼岛鸟瞰图，希腊 ', 'https://www.bing.com/th?id=OHR.SantoriniAerial_ZH-CN9367767863_1920x1080.jpg&rf=LaDigue_1920x1080.jpg&pid=hp');

-- ----------------------------
-- Table structure for classify
-- ----------------------------
DROP TABLE IF EXISTS `classify`;
CREATE TABLE `classify`  (
  `cid` int(11) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `cname` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '类名',
  PRIMARY KEY (`cid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of classify
-- ----------------------------
INSERT INTO `classify` VALUES (1, '笔记');
INSERT INTO `classify` VALUES (2, '闲聊');
INSERT INTO `classify` VALUES (3, '文章');
INSERT INTO `classify` VALUES (5, '教程');

-- ----------------------------
-- Table structure for discuss
-- ----------------------------
DROP TABLE IF EXISTS `discuss`;
CREATE TABLE `discuss`  (
  `did` int(11) NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `comments` longtext CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '评论',
  `time` datetime NOT NULL COMMENT '时间',
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户id',
  `aid` int(11) NOT NULL COMMENT '文章id',
  PRIMARY KEY (`did`) USING BTREE,
  INDEX `uid`(`uid`) USING BTREE,
  INDEX `aid`(`aid`) USING BTREE,
  CONSTRAINT `discuss_ibfk_1` FOREIGN KEY (`uid`) REFERENCES `userbase` (`uid`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `discuss_ibfk_2` FOREIGN KEY (`aid`) REFERENCES `article` (`aid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for links
-- ----------------------------
DROP TABLE IF EXISTS `links`;
CREATE TABLE `links`  (
  `lid` int(11) NOT NULL AUTO_INCREMENT COMMENT '链接id',
  `lname` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '网站名',
  `lurl` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '网站地址',
  PRIMARY KEY (`lid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of links
-- ----------------------------
INSERT INTO `links` VALUES (1, 'GitHub', 'https://github.com');
INSERT INTO `links` VALUES (2, '码云', 'https://gitee.com');
INSERT INTO `links` VALUES (3, 'Bootstrap', 'https://v3.bootcss.com');
INSERT INTO `links` VALUES (4, 'Layui', 'https://www.layui.com');
INSERT INTO `links` VALUES (5, 'Maven仓库', 'https://mvnrepository.com');
INSERT INTO `links` VALUES (6, 'thymeleaf', 'https://www.thymeleaf.org');
INSERT INTO `links` VALUES (7, 'Spring', 'https://spring.io');
INSERT INTO `links` VALUES (8, 'shiro', 'http://shiro.apache.org');
INSERT INTO `links` VALUES (9, 'processon在线制图', 'https://www.processon.com');
INSERT INTO `links` VALUES (10, '百度', 'https://www.baidu.com');
INSERT INTO `links` VALUES (11, '知乎', 'https://www.zhihu.com');
INSERT INTO `links` VALUES (12, '巴学园', 'http://www.beloved.ink');

-- ----------------------------
-- Table structure for role
-- ----------------------------
DROP TABLE IF EXISTS `role`;
CREATE TABLE `role`  (
  `rid` int(11) NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `rname` varchar(20) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '角色',
  `introduction` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '介绍',
  PRIMARY KEY (`rid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of role
-- ----------------------------
INSERT INTO `role` VALUES (1, 'admin', '管理员');
INSERT INTO `role` VALUES (2, 'author', '普通作者');
INSERT INTO `role` VALUES (3, 'ordinary', '普通用户');

-- ----------------------------
-- Table structure for tag
-- ----------------------------
DROP TABLE IF EXISTS `tag`;
CREATE TABLE `tag`  (
  `tid` int(11) NOT NULL AUTO_INCREMENT COMMENT '标签id',
  `tname` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '标签名',
  PRIMARY KEY (`tid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of tag
-- ----------------------------
INSERT INTO `tag` VALUES (1, 'JAVA');
INSERT INTO `tag` VALUES (2, 'HTML');
INSERT INTO `tag` VALUES (3, 'SQL');
INSERT INTO `tag` VALUES (5, 'SpringMVC');
INSERT INTO `tag` VALUES (6, 'SpringBoot');
INSERT INTO `tag` VALUES (7, 'shiro');

-- ----------------------------
-- Table structure for userbase
-- ----------------------------
DROP TABLE IF EXISTS `userbase`;
CREATE TABLE `userbase`  (
  `uid` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '用户id',
  `userNo` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '账号',
  `userName` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NOT NULL COMMENT '昵称',
  `password` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '密码',
  `userPostbox` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '邮箱',
  `headSculpture` varchar(100) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '头像',
  `source` varchar(50) CHARACTER SET utf8 COLLATE utf8_bin NULL DEFAULT NULL COMMENT '来源',
  `rid` int(11) NOT NULL COMMENT '角色',
  PRIMARY KEY (`uid`) USING BTREE,
  INDEX `rid`(`rid`) USING BTREE,
  CONSTRAINT `userbase_ibfk_1` FOREIGN KEY (`rid`) REFERENCES `role` (`rid`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_bin ROW_FORMAT = Compact;

-- ----------------------------
-- Records of userbase
-- ----------------------------
INSERT INTO `userbase` VALUES ('001', 'admin', 'Beloved', '123456', '1425279634@qq.com', 'https://portrait.gitee.com/uploads/avatars/user/1825/5475941_beloved_zh_1583295679.png!avatar100', NULL, 1);

SET FOREIGN_KEY_CHECKS = 1;
