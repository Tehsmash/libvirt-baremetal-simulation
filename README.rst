Instructions
============

#. Install binary-requirements using your package manager

#. Install python requirements using pip::

    sudo pip install -r requirements.txt

#. Create an OVS bridge to represent our virtual switch::

    sudo ovs-vsctl add-br bmswitch

#. Create a virtualised baremetal server plugged into the switch::

    ./wrap-create-node.sh vbaremetal1 bmswitch

#. Repeat until you've got as many nodes as you want

To tear down the environment, for each node you've created::

   sudo ./cleanup-node.sh vbaremetal2
