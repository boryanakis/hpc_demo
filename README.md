# A _brief_ demo of the KU Community Cluster 

The CRC high performance computing cluster (CRC) at KU is a community cluster that does the heavy lifting of computing for researchers on campus. 

![Visual representation of a simple computing cluster](https://upload.wikimedia.org/wikipedia/commons/thumb/4/40/Beowulf.png/640px-Beowulf.png)

Think of a computer cluster as a network of computers with one computer acting as a mastermind (`head node`), and the rest being minions (`computing nodes`). The head node is also the entry point - when one logs into the cluster, they log into the head node. Specialized software on the head node manages the workload of the computing nodes. Each computing node, in turn, has cores (think minions that have multiple heads and sets of hands that allow them to _truly_ multitask). 

Currently, the CRC cluster has __a lot__ of minions: 383, with anywhere from 16 to 40 pairs of hands. 


Let's connect:

```
ssh USERNAME@hpc.crc.ku.edu
```

Some of you will be asked if you want to add the host to the list of known hosts. Type `yes`. When asked, type your password and hit return (you won't see anything being typed but your keystrokes are being recorded, I promise!)
  
Notice that your prompt is now a bit different. You can tell the difference between being on your local machine (your laptop) vs the remote machine (the cluster).

```
[USERNAME@submit1] $
```

Two storage areas: `$SCRATCH` and `$WORK`

```
cd $SCRATCH
```


Let's clone this repository so that you can run a simple analysis on a small test data set. 
```
git clone git@github.com:boryanakis/hpc_demo.git

cd hcp_demo
```


Let's have a look around the directory.
```
tree .
```


Two ways to run analyses: interactive mode and submission scripts. We are going to use a submission script:
```
sbatch scripts/align.dmel.submit.sh
```

Check the status of the submitted job:
```
squeue -u ${USER}
```


