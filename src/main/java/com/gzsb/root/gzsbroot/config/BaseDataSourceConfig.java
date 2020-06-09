package com.gzsb.root.gzsbroot.config;

import com.github.pagehelper.PageHelper;
import org.apache.ibatis.plugin.Interceptor;
import org.apache.ibatis.session.AutoMappingBehavior;
import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.SqlSessionTemplate;
import org.mybatis.spring.annotation.MapperScan;
import org.mybatis.spring.boot.autoconfigure.ConfigurationCustomizer;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;

import javax.sql.DataSource;
import java.util.Properties;

/**
 * Created by KW-LL on 2019/3/18.
 */
@Configuration
// 配置多个mapper包
@MapperScan(basePackages = {"com.gzsb.root.gzsbroot.dao.mapper", "com.gzsb.root.gzsbroot.dao.mapperX"})
public class BaseDataSourceConfig {
    //代表主数据源
    @Bean
    @ConfigurationProperties(prefix = "spring.datasource")
    public DataSource setDataSource() {
        return new com.alibaba.druid.pool.DruidDataSource();
    }

    @Bean
    public DataSourceTransactionManager setTransactionManager(DataSource dataSource) {
        return new DataSourceTransactionManager(dataSource);
    }

    @Bean
    public SqlSessionFactory setSqlSessionFactory(DataSource dataSource) throws Exception {
        SqlSessionFactoryBean bean = new SqlSessionFactoryBean();
        bean.setDataSource(dataSource);
        //分页插件
        PageHelper pageHelper = new PageHelper();
        Properties props = new Properties();
        props.setProperty("reasonable", "true");
        props.setProperty("supportMethodsArguments", "true");
        props.setProperty("returnPageInfo", "check");
        props.setProperty("params", "count=countSql");
        pageHelper.setProperties(props);
        bean.setPlugins(new Interceptor[]{pageHelper});

        //扫描实体类设置类型别名
        bean.setTypeAliasesPackage("com.gzsb.root.gzsbroot.dao");
        org.apache.ibatis.session.Configuration mybatisConfig = new org.apache.ibatis.session.Configuration();

        //开启全局自动映射
        mybatisConfig.setAutoMappingBehavior(AutoMappingBehavior.FULL);

        //开启驼峰命名方式
        mybatisConfig.setMapUnderscoreToCamelCase(true);
        bean.setConfiguration(mybatisConfig);
        //扫描映射文件
        bean.setMapperLocations(new PathMatchingResourcePatternResolver().getResources("classpath*:mapper*/*.xml"));
        return bean.getObject();
    }

    @Bean
    public SqlSessionTemplate setSqlSessionTemplate(SqlSessionFactory sqlSessionFactory) throws Exception {
        return new SqlSessionTemplate(sqlSessionFactory);
    }
}
