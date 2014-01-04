dataSource {
	pooled = true
	driverClassName = "org.h2.Driver"
	username = "sa"
	password = ""
}
hibernate {
	cache.use_second_level_cache = true
	cache.use_query_cache = true
	cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory' // Hibernate 3
	//    cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory' // Hibernate 4
}

// environment specific settings
environments {
	development {
		dataSource {
			driverClassName = "com.mysql.jdbc.Driver"
			dialect = org.hibernate.dialect.MySQL5InnoDBDialect
			username = 'abel'
			password = '2uiiggii'
			url = 'jdbc:mysql://localhost/shop?useUnicode=true&characterEncoding=UTF-8'
			dbCreate = 'update'
		}
	}
	test {
		dataSource {
			driverClassName = "com.mysql.jdbc.Driver"
			dialect = org.hibernate.dialect.MySQL5InnoDBDialect
			username = 'abel'
			password = '2uiiggii'
			url = 'jdbc:mysql://localhost/shop?useUnicode=true&characterEncoding=UTF-8'
			dbCreate = 'update'
		}
	}
	production {
		dataSource {
			driverClassName = "com.mysql.jdbc.Driver"
			dialect = org.hibernate.dialect.MySQL5InnoDBDialect
			username = 'abel'
			password = '2uiiggii'
			url = 'jdbc:mysql://localhost/shop?useUnicode=true&characterEncoding=UTF-8'
			dbCreate = 'update'
			properties {
				maxActive = -1
				minEvictableIdleTimeMillis=1800000
				timeBetweenEvictionRunsMillis=1800000
				numTestsPerEvictionRun=3
				testOnBorrow=true
				testWhileIdle=true
				testOnReturn=false
				validationQuery="SELECT 1"
				jdbcInterceptors="ConnectionState"
			}
		}
	}
}
