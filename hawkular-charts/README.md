# Use Hawkular-Charts to graph individual metric
You can use [hawkular-charts](https://github.com/hawkular/hawkular-charts) to graph individual metric.  Feel free to modify [index.html](index.html) to add more graphs.

On a system with Docker installed (probably not on your openshift cluster):
```
# docker run -d --name nginx -p 8080:80 -v $PWD:/usr/share/nginx/html nginx
```
Point your browser to http://your_host_ip:8080
