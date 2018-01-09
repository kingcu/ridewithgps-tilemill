# HowTo get the renderer up and running for temporary usage

### Setup the tunnel
```
ssh -L 5001:localhost:5000 dank
```

### Startup the virtual environment
```
cd ~/ridewithgps-tilemill/renderer/
source venv/bin/activate
```

### start up the render server
```
./server.py
```

### When rendering is complete, make sure to shut down the server.
