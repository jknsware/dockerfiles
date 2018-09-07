# docker-nmap 


## How or why to use this project

Quick way to run nmap where ever you have Docker installed.

## Technical or step-by-step instructions

My common search is:
```
nmap -v -sn -n 192.168.1.0/24 -oG - | awk '/Status: Down/{print $2}'
```

I need to find a way to do the same with the container. Currently, running the nmap portion of the command a) takes over 30s to complete and b) reports that all IPs are up when I know that's not the case.

Other examples would be:
```
  # -v Verbose, -A OS detection, version detection, script scanning, and traceroute
  nmap -v -A scanme.nmap.org
  # -v Verbose, -sn Ping scan
  nmap -v -sn 192.168.0.0/16 10.0.0.0/8
  # -v Verbose, -iR Random targets <num hosts>, -Pn Treat all hosts as online, -p Port 80
  nmap -v -iR 10000 -Pn -p 80
```

### External Links

- [nmap](http://nmap.org), for nmap documentation.


### Thanks

- [@codep0tato](https://github.com/codep0tato), for introducing me to <insert_anything_cool_here>. 
- [@uzyexe](https://github.com/uzyexe), for building it first.
