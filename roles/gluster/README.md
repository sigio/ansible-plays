Role: gluster
=============

The gluster role will install required software for glusterfs and then
partition (gpt), format(xfs) and mount the bricks.

Specify the disks to be used as bricks in a variable:
  glusterdisks= [ 'sdb', 'sdc', 'sdd' ]

It currently doesn't actually create the gluster volume, and the playbook will
abort at the step where the volume needs to be created.

After manually creating the volume, you can re-run the playbook/role to
complete the glusterfs configuration.

I've decided to not do the gluster volume creation in the play/role at this
time, since it requires some coordination between the various hosts, and there
are many different ways to actually configure the volume.

I myself currently use 3 gluster nodes in production, which are all 3 replica's
of each-other.

An example command to create the volume:

(2 nodes, 3 bricks per node, 2 replica's)

gluster volume create gv0 replica 2 \
  cluster1:/brick/sdb1 cluster2:/brick/sdb1 \
  cluster1:/brick/sdc1 cluster2:/brick/sdc2 \
  cluster1:/brick/sdd1 cluster2:/brick/sdd2

(3 nodes, 3 bricks per node, 3 replica's)

gluster volume create gv0 replica 3 \
  cluster1:/brick/sdb1 cluster2:/brick/sdb1 cluster3:/brick/sdb1 \
  cluster1:/brick/sdc1 cluster2:/brick/sdc2 cluster3:/brick/sdc1 \
  cluster1:/brick/sdd1 cluster2:/brick/sdd2 cluster3:/brick/sdd1


