Сборка dnsperf в Docker
===

**howto**  
- docker build -t dnsperf .  
- docker run -it --rm dnsperf dnsperf  

**help**  

dnsperf -s 109.195.161.96 -l 240 -c 1 -q 100 -Q 100 -t 5 -d /usr/share/dnsperf/30k_query  

-l 240	limit for the run, in seconds  
-c 1	Act as multiple clients  
-q 100	Sets the maximum number of outstanding requests  
-Q 100	Limits the number of requests per second  
-t 5	the request timeout value, in seconds  
