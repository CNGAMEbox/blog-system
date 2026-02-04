package com.blog.util;

import com.zaxxer.hikari.HikariConfig;
import com.zaxxer.hikari.HikariDataSource;
import java.sql.Connection;
import java.sql.SQLException;

public class DatabaseUtil {
    private static HikariDataSource dataSource;

    static {
        try {
            // 创建HikariCP配置
            HikariConfig config = new HikariConfig();
            config.setDriverClassName(DatabaseConfig.getProperty("db.driver"));
            config.setJdbcUrl(DatabaseConfig.getProperty("db.url"));
            config.setUsername(DatabaseConfig.getProperty("db.username"));
            config.setPassword(DatabaseConfig.getProperty("db.password"));

            // 连接池配置
            config.setMaximumPoolSize(Integer.parseInt(
                    DatabaseConfig.getProperty("db.pool.maximumPoolSize")));
            config.setMinimumIdle(Integer.parseInt(
                    DatabaseConfig.getProperty("db.pool.minimumIdle")));
            config.setConnectionTimeout(Long.parseLong(
                    DatabaseConfig.getProperty("db.pool.connectionTimeout")));
            config.setIdleTimeout(Long.parseLong(
                    DatabaseConfig.getProperty("db.pool.idleTimeout")));
            config.setMaxLifetime(Long.parseLong(
                    DatabaseConfig.getProperty("db.pool.maxLifetime")));

            // 优化设置
            config.addDataSourceProperty("cachePrepStmts", "true");
            config.addDataSourceProperty("prepStmtCacheSize", "250");
            config.addDataSourceProperty("prepStmtCacheSqlLimit", "2048");

            dataSource = new HikariDataSource(config);
            System.out.println("数据库连接池初始化成功");

        } catch (Exception e) {
            System.err.println("数据库连接池初始化失败: " + e.getMessage());
            e.printStackTrace();
        }
    }

    /**
     * 获取数据库连接
     */
    public static Connection getConnection() throws SQLException {
        return dataSource.getConnection();
    }

    /**
     * 关闭数据库连接池
     */
    public static void shutdown() {
        if (dataSource != null && !dataSource.isClosed()) {
            dataSource.close();
            System.out.println("数据库连接池已关闭");
        }
    }
}