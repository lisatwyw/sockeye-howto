# Example to load Python

Search to see which versions are available:
```
module spider python 
```


Search to see which other modules needed for specific Python version, e.g.:
```
module spider python/3.11.6
```

Example of loading all needed modules for use of Python 3.11.6:
```
module load intel-oneapi-compilers/2023.1.0  python/3.11.6
```


# Create and activate new Python VE

```
python -m venv ~/scrapper
~/scrapper/bin/activate
```

  
