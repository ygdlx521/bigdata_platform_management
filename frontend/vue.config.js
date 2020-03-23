/*
处理本地开发环境跨域的问题 8080 -> 8081
 */
let proxy = {};
proxy['/'] = {
    ws: false,
    target: 'http://localhost:8081',
    changeOrigin: true,
    pathRewrite: {
        '^/':''
    }
};

module.exports = {
    devServer: {
        host: 'localhost',
        port: 8080,
        proxy: proxy
    }
};
